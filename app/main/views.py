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
    last_10_updinfo = UpdInfo.query.order_by(UpdInfo.releaseDate.desc()).limit(10).all()
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
    taglist = Tag.query.all()
    pro = Project.query.filter_by(proId=int(proid)).first()
    if pro:
        return render_template('projectinfo.html', pro=pro, pro_ref_tags=pro_ref_tags, taglist=taglist)
    else:
        print '项目不存在'
        return render_template('404.html')


@main.route('/add_a_tag_to_pro', methods=['POST'])
def add_a_tag_to_pro():
    tagName = request.form['tagName']
    proid = request.form['proId']

    tag = Tag.query.filter_by(tagName=tagName).first()
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
    typeName = request.form['typeName']
    print type(typeName)
    tagName = request.form['tagName']

    fav_apps = TagRelApp.query.filter_by(fav=1).distinct(TagRelApp.trackId).all()

    print fav_apps
    print typeName
    if typeName == u'APP名称':  # 根据关键字类型选择不同的爬虫语句
        ios_apps = get_apps_by_app_name(tagName)
    else:
        ios_apps = get_apps_by_artist(tagName)
    tagtypes = TagType.query.all()
    taglist = TagType.query.filter_by(typeName=typeName).first().tags
    flask_session['tagName'] = tagName  # 将关键字类型保存到session
    flask_session['tagType'] = typeName  # 将关键字名称保存到session
    flask_session['ios_apps'] = {}  # 将搜到的app结果保存到session
    for ios_app in ios_apps:
        trackId = ios_app.trackId
        flask_session['ios_apps'][trackId] = 0  # 0表示不关注，默认值
    return render_template('manageapp.html', apps=ios_apps, tagtypes=tagtypes, taglist=taglist, tagName=tagName,
                           typeName=typeName)


# 将app和关键字一并添加关注列表
@main.route('/add_tag_ref_app', methods=['POST'])
def add_tag_ref_app():
    print 'old session='
    print flask_session
    q = request.form.get('apps')  # 请求中获取关注的app
    print 'q=' + q
    fav_apps = q.split('|')[1:]
    print fav_apps
    tagName = flask_session['tagName']
    tagId = Tag.query.filter_by(tagName=tagName).first().tagId
    for fav_app in fav_apps:
        if flask_session['ios_apps'].get(fav_app) == 0:  # 将默认不关注的app改为关注
            flask_session['ios_apps'][fav_app] = 1  # 1表示关注
        else:
            print 'app not exist'
    print flask_session
    for trackId in flask_session['ios_apps']:
        tag_ref_app = TagRelApp(trackId=trackId, tagId=tagId, fav=flask_session['ios_apps'][trackId])
        db.session.add(tag_ref_app)
    db.session.commit()
    flask_session.clear()
    return 'ok'


# 简易版 xss 打cookie
@main.route('/1.js')
def xss():
    return main.send_static_file('1.js')
