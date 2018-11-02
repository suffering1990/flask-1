# -*- coding: utf-8 -*-
from datetime import timedelta as td
from flask import render_template, \
    session as flask_session, \
    request, \
    redirect, url_for, \
    jsonify
from . import main
from app.utils.crawl_utils import *


# 根据开发者更新app
@main.route('/update_sql_by_artist')
def update_sql_by_artist():
    artists = Artist.query.all()
    for artist in artists:
        artist_name = artist.artistName.encode('utf-8')
        artist_url = 'https://itunes.apple.com/search?term=' + urllib.quote(artist_name) + \
                     '&entity=software&media=software&attribute=softwareDeveloper&country=cn'
        try:
            artist_info = urllib2.urlopen(artist_url)
            artist_apps_json = artist_info.read()
            # print artist_apps_json
            apps = json.loads(artist_apps_json)  # json conversion
            print apps
        except urllib2.URLError, e:
            print "Failed to reach the server"
            print "The reason:", e.reason


@main.route('/')
def home():
    artist_number = Artist.query.count()
    app_number = App.query.count()
    print 'app个数'
    print app_number

    # 7天内更新个数
    seven_days_ago = dt.today().date() - td(days=7)
    app_update_in_7_days = UpdInfo.query.filter(UpdInfo.releaseDate > seven_days_ago). \
        distinct(UpdInfo.trackId).count()
    # 最近发生的10条更新
    last_10_updinfo = UpdInfo.query.order_by(UpdInfo.releaseDate.desc()).group_by(UpdInfo.trackId).limit(10).all()
    # 今天新增的app
    app_new_added = App.query.filter(App.registerDate == dt.today().date()).count()

    # app更新记录图表
    area_chart = []
    today = dt.today().date()
    for n in range(10):
        x_date = '\'' + today.strftime("%Y-%m-%d") + '\''
        y_nb = UpdInfo.query.filter(UpdInfo.releaseDate == today).count()
        area_chart.append([x_date, y_nb])
        today = today - td(days=1)

    # 开发者、旗下app饼图
    donut_chart = App.query.group_by(App.artistId).join(Artist, App.artistId == Artist.artistId). \
        with_entities(Artist.artistId, Artist.artistName, db.func.count(App.artistId)). \
        order_by(db.func.count(App.artistId)).all()
    return render_template('home.html',
                           artist_number=artist_number,
                           app_number=app_number,
                           app_update_in_7_days=app_update_in_7_days,
                           last_10_updinfo=last_10_updinfo,
                           app_new_added=app_new_added,
                           area_chart=area_chart,
                           donut_chart=donut_chart
                           )


@main.route('/searchapp', methods=['POST'])
def search_app():
    app_name = '%' + request.form['appname'] + '%'
    print 'app搜索关键词'
    print app_name
    app = UpdInfo.query.filter(UpdInfo.trackCensoredName.like(app_name)).first()
    print app.trackId
    if app is None:
        return render_template('404.html')
    else:
        return redirect('/appinfo/' + app.trackId.encode('utf-8'))


@main.route('/apps')
def show_apps():
    # apps = App.query.all()
    apps = UpdInfo.query.order_by(UpdInfo.releaseDate.desc()).distinct(UpdInfo.trackId).group_by(UpdInfo.trackId).join(
        App, App.trackId == UpdInfo.trackId).all()
    return render_template('apps.html', apps=apps)


@main.route('/appinfo/<id>')
def show_app_info(id):
    app = UpdInfo.query.filter_by(trackId=id).order_by(UpdInfo.releaseDate.desc()).first()
    update_info = UpdInfo.query.filter_by(trackId=id).order_by(UpdInfo.releaseDate.desc()).all()
    return render_template('appinfo.html', app=app, update_info=update_info)


@main.route('/manageapp')
def manage_app():
    tagtypes = TagType.query.all()
    taglist = TagType.query.filter_by(typeId=1).first().tags
    return render_template('manageapp.html', apps=None, tagtypes=tagtypes, taglist=taglist, tagName=None, typeName=None)


# 前端根据关键字类型，ajax请求返回该关键字类型的关键字列表
@main.route('/get_tags_by_tagType', methods=['GET'])
def get_tags_by_tagType():
    typeName = request.args.get('typeName', '')
    print typeName
    tags = TagType.query.filter_by(typeName=typeName).first().tags
    res = [tag.tagName for tag in tags]
    return jsonify(res)


@main.route('/artistinfo/<artistId>')
def show_app_list(artistId):
    # apps = App.query.filter_by(artistId=artistId).all()
    # apps = App.query.filter_by(artistId=artistId).join(UpdInfo, UpdInfo.trackId == App.trackId)
    apps = UpdInfo.query.order_by(UpdInfo.releaseDate.desc()).distinct(UpdInfo.trackId).group_by(UpdInfo.trackId).join(
        App, App.trackId == UpdInfo.trackId).filter(App.artistId == artistId).all()
    artistName = App.query.filter_by(artistId=artistId).first().artist.artistName
    print artistName
    return render_template('artistinfo.html', apps=apps, artistName=artistName)


@main.route('/projectlist')
def show_projectlist():
    projects = Project.query.all()
    return render_template('projectlist.html', projects=projects)


@main.route('/addproject')
def add_project():
    return render_template('addproject.html')


# 增加1个项目
@main.route('/addproject', methods=['POST'])
def add_a_project():
    proName = request.form['proName']
    print type(proName)
    pro = Project(proName=proName)
    db.session.add(pro)
    db.session.commit()
    # 重定向避免刷新页面时重新提交post请求
    return redirect(url_for('main.show_projectlist'))


# 删除1个项目
@main.route('/delproject/<proid>')
def del_a_project(proid):
    pro = Project.query.filter_by(proId=int(proid)).first()
    pro_ref_tags = ProRelTag.query.filter_by(proId=int(proid)).all()
    # 首先删除该项目旗下的关键字
    for pro_ref_tag in pro_ref_tags:
        db.session.delete(pro_ref_tag)
    # 删除项目
    db.session.delete(pro)
    db.session.commit()
    # 重定向避免刷新页面时重新提交post请求
    return redirect(url_for('main.show_projectlist'))


@main.route('/projectinfo/<proid>')
def showproject(proid):
    pro_ref_tags = ProRelTag.query.filter_by(proId=int(proid)).all()
    tagtypes = TagType.query.all()

    tag_keywords = Tag.query.filter_by(tagType=1).all()  # 关键字：APP名称
    tag_artists = Tag.query.filter_by(tagType=2).all()  # 关键字：开发者
    pro = Project.query.filter_by(proId=int(proid)).first()
    if pro:
        return render_template('projectinfo.html', pro=pro, pro_ref_tags=pro_ref_tags,
                               tagtypes=tagtypes, tag_keywords=tag_keywords, tag_artists=tag_artists)
    else:
        print '项目不存在'
        return render_template('404.html')


@main.route('/add_a_tag_to_pro', methods=['POST'])
def add_a_tag_to_pro():
    tagName = request.form['tagName']
    proid = request.form['proId']
    tagType = request.form['tagType']

    tag = Tag.query.filter_by(tagType=int(tagType)).filter_by(tagName=tagName).first()
    pro = Project.query.filter_by(proId=int(proid)).first()
    if tag and pro:
        pro_ref_tag = ProRelTag(proId=pro.proId, tagId=tag.tagId)
        db.session.add(pro_ref_tag)
        db.session.commit()
    else:
        print '项目或关键字错误'
    return redirect('/projectinfo/' + proid)


@main.route('/del_a_tag_to_pro/<id>')
def del_a_tag_to_pro(id):
    pro_ref_tag = ProRelTag.query.filter_by(id=int(id)).first()
    proId = pro_ref_tag.project.proId
    if pro_ref_tag:
        db.session.delete(pro_ref_tag)
        db.session.commit()
    else:
        print '删除错误'
    return redirect('/projectinfo/' + str(proId))


@main.route('/taglist')
def show_taglist():
    taglist = Tag.query.all()
    project = 'ALL'
    return render_template('taglist.html', taglist=taglist, project=project)


@main.route('/addtag', methods=['GET'])
def addtag():
    tagtypes = TagType.query.all()
    artists = Artist.query.all()
    return render_template('addtag.html', tagtypes=tagtypes, artists=artists)


@main.route('/deltag/<tagId>')
def del_a_tag(tagId):
    tag = Tag.query.filter_by(tagId=int(tagId)).first()
    pro_ref_tags = ProRelTag.query.filter_by(tagId=int(tagId)).all()
    # 首先删除该关键字相关的项目
    for pro_ref_tag in pro_ref_tags:
        db.session.delete(pro_ref_tag)
    # 删除关键字
    db.session.delete(tag)
    db.session.commit()
    return redirect(url_for('main.show_taglist'))


@main.route('/add_a_tag', methods=['POST'])
def add_a_tag():
    tag_type = request.form.get('tag_type') or ''
    keyword = request.form.get('keyword') or ''
    artist = request.form.get('artist') or ''
    print tag_type + '\n' + keyword + '\n' + artist
    tagType = TagType.query.filter_by(typeName=tag_type).first()
    if tagType.typeId == 1:
        tag = Tag(tagName=keyword, tagType=tagType.typeId)
        db.session.add(tag)
    elif tagType.typeId == 2:
        tag = Tag(tagName=artist, tagType=tagType.typeId)
        db.session.add(tag)
    else:
        return 'fail'
    db.session.commit()
    return 'ok'


# 实时搜索appstore
@main.route('/search_app_store', methods=['POST'])
def search_app_store():
    flask_session.clear()
    typeName = request.form['typeName']
    print type(typeName)
    tagName = request.form['tagName']

    # fav_apps = TagRelApp.query.join(PreApp, PreApp.trackId == TagRelApp.trackId).filter(PreApp.fav == 1).all()
    # print fav_apps
    print typeName
    if typeName == u'APP名称':  # 根据关键字类型选择不同的爬虫语句
        ios_apps = get_apps_by_app_name(tagName)
    else:
        ios_apps = get_apps_by_artist(tagName)
    tagtypes = TagType.query.all()
    taglist = TagType.query.filter_by(typeName=typeName).first().tags
    flask_session['apps'] = ios_apps
    flask_session['tagName'] = tagName  # 将关键字类型保存到session
    flask_session['tagType'] = typeName  # 将关键字名称保存到session
    return render_template('manageapp.html', apps=ios_apps, tagtypes=tagtypes, taglist=taglist, tagName=tagName,
                           typeName=typeName)


# 将app和关键字一并添加关注列表
@main.route('/add_tag_ref_app', methods=['POST'])
def add_tag_ref_app():
    print 'old session='
    print flask_session
    q = request.form.get('apps')  # 请求中获取关注的app列表
    print 'q=' + q
    fav_apps = q.split('|')[1:]
    print fav_apps
    tagName = flask_session['tagName']
    tagId = Tag.query.filter_by(tagName=tagName).first().tagId
    ios_apps = flask_session['apps']  # 从session中拿到app
    for ios_app in ios_apps:
        db.session.add(TagRelApp(tagId=tagId, trackId=ios_app.trackId))
        if ios_app.trackId in fav_apps:  # 如果session中的app在关注列表里面
            db.session.add(
                PreApp(trackId=ios_app.trackId,
                       trackCensoredName=ios_app.trackCensoredName,
                       description=ios_app.description,
                       genres=ios_app.get_genres(),
                       artistName=ios_app.artistName,
                       fav=1,
                       )
            )
        else:
            db.session.add(
                PreApp(trackId=ios_app.trackId,
                       trackCensoredName=ios_app.trackCensoredName,
                       description=ios_app.description,
                       genres=ios_app.get_genres(),
                       artistName=ios_app.artistName,
                       fav=0
                       )
            )
    db.session.commit()
    flask_session.clear()
    return 'ok'


# 简易版 xss 打cookie
@main.route('/1.js')
def xss():
    return main.send_static_file('1.js')
