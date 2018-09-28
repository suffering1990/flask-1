# -*- coding: utf-8 -*-
from datetime import timedelta as td
from flask import render_template, \
    session as flask_session, \
    request, \
    redirect, url_for
from . import main
from app.utils.crawl_utils import *


# 更新app的日期和时间
@main.route('/update_apps_new_days')
def update_apps_new_days():
    ios_apps = App.query.all()
    for ios_app in ios_apps:
        reg_days = get_register_days(ios_app.registerDate)
        ios_app.registerDays = reg_days
        rel_days = get_update_days(ios_app.releaseDate)
        ios_app.update_days = rel_days
        print ios_app.registerDate, ios_app.registerDays, \
            ios_app.releaseDate, ios_app.update_days

        db.session.add(ios_app)
    return 'ok'


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


@main.route('/updatesql/<name>')
def update_sql_by_app_name(name):
    keywords = name.encode('utf-8')
    apps = get_artist_apps_by_app_name(keywords)
    print apps
    print type(apps)
    if apps is None:
        return 'fail'
    # db.drop_all()
    # db.create_all()
    app_number = len(apps['results'])
    for n in range(0, app_number):
        track_id = apps['results'][n]['trackId']
        version = apps['results'][n]['version']
        artistId = apps['results'][n]['artistId']
        update_days = get_update_days(apps['results']
                                      [n]['currentVersionReleaseDate'])

        # 注册日期和注册天数
        register_day = dt.now().strftime("%Y-%m-%dT%H:%M:%SZ").decode('utf-8')
        register_days = get_register_days(register_day)

        # convert screenshotUrls(list) to screenshotUrls(str)
        screenshotUrls = apps['results'][n]['screenshotUrls']
        screenshotUrls = str(screenshotUrls)

        # convert screenshotUrls(list) to screenshotUrls(str)
        genres = apps['results'][n]['genres']
        genres = str(genres)

        # get release_note list
        release_note = [apps['results'][n]['currentVersionReleaseDate'],
                        apps['results'][n].get('releaseNotes', '')]
        print release_note
        # 比对数据库中的app,artist
        app_in_database = App.query.filter_by(trackId=track_id).first()
        artist_in_database = Artist.query.filter_by(artistId=artistId).first()
        if app_in_database is None:
            # 数据库没有app
            app = App(trackId=apps['results'][n]['trackId'],
                      trackCensoredName=apps['results'][n]['trackCensoredName'],
                      version=apps['results'][n]['version'],
                      releaseDate=apps['results'][n]['currentVersionReleaseDate'],
                      # releaseNotes=apps['results'][n].get('releaseNotes', None),
                      releaseNotes=str([release_note]),
                      description=apps['results'][n]['description'],
                      trackViewUrl=apps['results'][n]['trackViewUrl'],
                      genres=genres,
                      artworkUrl60=apps['results'][n]['artworkUrl60'],
                      artworkUrl100=apps['results'][n]['artworkUrl100'],
                      artworkUrl512=apps['results'][n]['artworkUrl512'],
                      screenShotUrls=screenshotUrls,
                      appType='ios',
                      artistId=apps['results'][n]['artistId'],
                      registerDate=dt.now().strftime("%Y-%m-%dT%H:%M:%SZ").decode('utf-8'),
                      registerDays=0,
                      update_days=update_days
                      )
            db.session.add(app)
            if artist_in_database is None:
                # 开发者不存在
                artist = Artist(artistId=apps['results'][n]['artistId'],
                                artistName=apps['results'][n]['artistName'],
                                artistViewUrl=apps['results'][n]['artistViewUrl']
                                )
                db.session.add(artist)

        else:
            # 如果存在记录
            # 更新入库天数
            rd = app_in_database.registerDate
            app_in_database.registerDays = get_register_days(rd)
            if app_in_database.version == version:
                # 比较版本信息
                # 更新未更新天数
                app_in_database.update_days = update_days
                db.session.add(app_in_database)
            else:
                # 版本不一致，则更新
                app_in_database.trackCensoredName = apps['results'][n]['trackCensoredName']
                app_in_database.version = version
                app_in_database.releaseDate = apps['results'][n]['currentVersionReleaseDate']

                # app_in_database.releaseNotes = apps['results'][n].get('releaseNotes', None)
                # 增加一条更新记录
                new_release_notes = eval(app_in_database.releaseNotes)
                print '本次更新内容'
                print type(new_release_notes)
                print new_release_notes
                print type(release_note)
                print release_note
                # 更新 releaseNotes，不能用append
                new_release_notes = new_release_notes + [release_note]
                print new_release_notes

                nr = str(new_release_notes)
                app_in_database.releaseNotes = nr
                app_in_database.trackViewUrl = apps['results'][n]['trackViewUrl']

                # 更新未更新天数
                app_in_database.update_days = update_days
                db.session.add(app_in_database)
        db.session.commit()
    apps = App.query.all()
    print apps
    artists = Artist.query.all()
    print artists
    return render_template('apps.html', apps=apps)


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


@main.route('/search_appstore', methods=['POST'])
def search_app_store():
    ios_app_name = request.form['ios_app_name']
    print type(ios_app_name)
    ios_apps = get_apps_by_app_name(ios_app_name)
    # flask_session['iosapps'] = json.dump(ios_apps)
    projects = Project.query.all()
    taglist = Tag.query.all()
    return render_template('manageapp.html', apps=ios_apps, projects=projects, taglist=taglist)


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
    projects = Project.query.all()
    taglist = Tag.query.all()
    return render_template('manageapp.html', apps=None, projects=projects, taglist=taglist)


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


@main.route('/addtag')
def addtag():
    return render_template('addtag.html')


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


@main.route('/addtag', methods=['POST'])
def add_a_tag():
    tagName = request.form['tagName']
    print type(tagName)
    tag = Tag(tagName=tagName)
    db.session.add(tag)
    db.session.commit()
    # 重定向避免刷新页面时重新提交post请求
    return redirect(url_for('main.show_taglist'))


@main.route('/addfav', methods=['POST'])
def add_fav():
    proName = request.form['proName']
    print type(proName)
    tagName = request.form['tagName']
    print tagName
    ios_apps = get_apps_by_app_name(tagName)
    projects = Project.query.all()
    taglist = Tag.query.all()
    flask_session['tag'] = tagName
    flask_session['ios_apps'] = {}
    for ios_app in ios_apps:
        trackId = ios_app.trackId
        flask_session['ios_apps'][trackId] = False
    return render_template('manageapp.html', apps=ios_apps, projects=projects, taglist=taglist)


@main.route('/add_app_ref_tag', methods=['POST'])
def add_app_ref_tag():
    print 'old session='
    print flask_session
    q = request.form.get('apps')
    print 'q=' + q
    fav_apps = q.split('|')[1:]
    print fav_apps
    for fav_app in fav_apps:
        flask_session['ios_apps'][fav_app] = True
    print flask_session
    return q.encode('utf-8')


# 简易版 xss 打cookie
@main.route('/1.js')
def xss():
    return main.send_static_file('1.js')
