# -*- coding: utf-8 -*-
import urllib, urllib2
import json
import time
import os
import requests
import pytz
from datetime import datetime as dt
from app.models import *
from .. import db


# 根据app关键字搜appstore返回15条结果
# def get_apps_by_app_name(keywords):
#     search_string = urllib.quote(keywords.encode('utf-8'))
#     url = 'https://itunes.apple.com/search?term=' + search_string + '&entity=' \
#                                                                     'software&media=software&country=cn&limit=15'
#     try:
#         http_request = urllib2.Request(url)
#         response = urllib2.urlopen(http_request)
#         response_body = response.read()
#         print response_body
#     except urllib.request.URLError:
#         print('Could not connect to ' + url + '!')
#
#     apps = json.loads(response_body)
#     app_number = len(apps['results'])
#     res_apps = []
#     for n in range(0, app_number):
#         track_id = apps['results'][n]['trackId']
#         print track_id
#         version = apps['results'][n]['version']
#         artistId = apps['results'][n]['artistId']
#         update_days = get_update_days(apps['results']
#                                       [n]['currentVersionReleaseDate'])
#
#         # 注册日期和注册天数
#         register_day = dt.now().strftime("%Y-%m-%dT%H:%M:%SZ").decode('utf-8')
#         register_days = get_register_days(register_day)
#
#         # convert screenshotUrls(list) to screenshotUrls(str)
#         screenshotUrls = apps['results'][n]['screenshotUrls']
#         screenshotUrls = str(screenshotUrls)
#
#         # convert screenshotUrls(list) to screenshotUrls(str)
#         genres = apps['results'][n]['genres']
#         genres = str(genres)
#
#         # get release_note list
#         release_note = [apps['results'][n]['currentVersionReleaseDate'],
#                         apps['results'][n].get('releaseNotes', '')]
#         app = App(
#             trackId=str(apps['results'][n]['trackId']).decode('utf-8'),
#             trackCensoredName=apps['results'][n]['trackCensoredName'],
#             version=apps['results'][n]['version'],
#             releaseDate=apps['results'][n]['currentVersionReleaseDate'],
#             # releaseNotes=apps['results'][n].get('releaseNotes', None),
#             releaseNotes=str([release_note]),
#             description=apps['results'][n]['description'],
#             trackViewUrl=apps['results'][n]['trackViewUrl'],
#             genres=genres,
#             artworkUrl60=apps['results'][n]['artworkUrl60'],
#             artworkUrl100=apps['results'][n]['artworkUrl100'],
#             artworkUrl512=apps['results'][n]['artworkUrl512'],
#             screenShotUrls=screenshotUrls,
#             appType='ios',
#             artistId=str(apps['results'][n]['artistId']).decode('utf-8'),
#             registerDate=apps['results'][n]['currentVersionReleaseDate'],
#             registerDays=register_days,
#             update_days=update_days
#         )
#         artist = Artist(artistId=apps['results'][n]['artistId'],
#                         artistName=apps['results'][n]['artistName'],
#                         artistViewUrl=apps['results'][n]['artistViewUrl']
#                         )
#         res_apps.append(app)
#     print res_apps
#     return res_apps

# 根据关键字，实时搜索appstore，返回15条记录
def get_apps_by_app_name(keywords):
    search_string = urllib.quote(keywords.encode('utf-8'))
    url = 'https://itunes.apple.com/search?term=' + search_string + '&entity=' \
                                                                    'software&media=software&country=cn&limit=15'
    try:
        http_request = urllib2.Request(url)
        response = urllib2.urlopen(http_request)
        response_body = response.read()
        print response_body
    except urllib2.URLError:
        print('Could not connect to ' + url + '!')

    apps = json.loads(response_body)
    app_number = len(apps['results'])
    res_apps = []
    for n in range(0, app_number):
        # 如果track_id是int，转换成unicode
        track_id = apps['results'][n]['trackId']
        track_id = isinstance(track_id, int) and str(track_id).decode('utf-8') or track_id
        app = TempApp(
            trackId=track_id.encode('utf-8'),
            trackCensoredName=apps['results'][n]['trackCensoredName'],
            description=apps['results'][n]['description'],
            genres=apps['results'][n]['genres'],
            artistName=apps['results'][n]['artistName'],
        )
        res_apps.append(app)
    print res_apps
    return res_apps


# 根据 app名称，实时搜索appstore ，返回相同开发者的app，最多50条
def get_artist_apps_by_app_name(keywords):
    search_string = urllib.quote(keywords)

    begin_search_app = time.time()
    # url = 'https://itunes.apple.com/search?term=' + search_string + '&entity=software&country=cn&mediaType=ios_apps&limit=5'
    url = 'https://itunes.apple.com/search?term=' + search_string + '&entity=software&media=software&country=cn&limit=50'
    print 'app的json接口 = ' + url
    try:
        request = urllib2.Request(url)
        response = urllib2.urlopen(request)
        response_body = response.read()
        search_app_time = time.time() - begin_search_app
        print search_app_time
    except urllib2.URLError:
        print('Could not connect to ' + url + '!')

    parsed_json = json.loads(response_body)
    print type(response_body)
    print parsed_json
    number = len(parsed_json['results'])
    if number > 0:
        for n in range(0, number):
            trackCensoredName = parsed_json['results'][n]['trackCensoredName'].encode('utf-8')
            if trackCensoredName.find(keywords) == -1:
                continue
            else:
                print u'名称:' + parsed_json['results'][n]['trackCensoredName']
                print u'版本:' + parsed_json['results'][n]['version']
                print u'发布时间:' + parsed_json['results'][n]['currentVersionReleaseDate']
                print u'更新内容:\n' + parsed_json['results'][n]['releaseNotes']
                print u'app链接:' + parsed_json['results'][n]['trackViewUrl']
                print u'图标:' + parsed_json['results'][n]['artworkUrl100']
                print u'开发者:' + parsed_json['results'][n]['artistName']
                print u'开发者链接:' + parsed_json['results'][n]['artistViewUrl']
                break
    else:
        print 'sorry,app not found'
        return
    begin_search_artist = time.time()
    # artist_url = parsed_json['results'][n]['artistViewUrl']

    print u'匹配成功，序号=' + str(n)
    trackCensoredName = parsed_json['results'][n]['trackCensoredName'].encode('utf-8')
    if trackCensoredName.find(keywords) == -1:
        return
    else:
        artist_name = parsed_json['results'][n]['artistName'].encode('utf-8')
        artist_url = 'https://itunes.apple.com/search?term=' + urllib.quote(artist_name) + \
                     '&entity=software&media=software&attribute=softwareDeveloper&country=cn'
        print '开发者json接口 = ' + artist_url

    try:
        artist_info = urllib2.urlopen(artist_url)
        artist_apps_json = artist_info.read()
        print artist_apps_json
        apps = json.loads(artist_apps_json)  # json conversion
        print apps
        search_artist_time = time.time() - begin_search_artist
        print search_artist_time
        return apps
    except urllib2.URLError, e:
        print "Failed to reach the server"
        print "The reason:", e.reason


def check_app_id(id):
    return App.query.filter_by(trackId=id).first()


def check_artist_id(id):
    return Artist.query.filter_by(artistId=id).first()


# check app updated or not in given days
def check_app_update(trackId, days):
    print dt.now()
    now = dt.now(pytz.timezone('Asia/Taipei'))
    # bj_time = now.strftime('%Y-%m-%dT%H:%M:%SZ')
    # print bj_time
    app = App.query.filter_by(trackId=trackId).first()
    if app:
        releaseDate = app.releaseDate.encode('utf-8')
        str2day = dt.strptime(releaseDate.replace('T', ' ').replace('Z', ''),
                              '%Y-%m-%d %H:%M:%S')
        str2day = str2day.replace(tzinfo=pytz.timezone('Asia/Taipei'))
        update_days = (now - str2day).days
        if update_days < days:
            return True
        else:
            print 'exceeds ' + str(days) + ' days'
            return False
    else:
        print 'app not found'
        return False


# app多久没有更新
def get_update_days(release_date):
    release_Date = release_date.encode('utf-8')
    now = dt.now(pytz.timezone('Asia/Taipei'))
    print now
    str2day = dt.strptime(release_Date.replace('T', ' ').replace('Z', ''),
                          '%Y-%m-%d %H:%M:%S')
    str2day = str2day.replace(tzinfo=pytz.timezone('Asia/Taipei'))
    print str2day
    return (now - str2day).days


# app上架天数
def get_register_days(register_date):
    register_date = register_date.encode('utf-8')
    now = dt.now(pytz.timezone('Asia/Taipei'))
    str2day = dt.strptime(register_date.replace('T', ' ').replace('Z', ''),
                          '%Y-%m-%d %H:%M:%S')
    str2day = str2day.replace(tzinfo=pytz.timezone('Asia/Taipei'))
    return (now - str2day).days


# 更新app的图标
def get_img(trackId, img):
    img_dir = 'app/static/img/' + str(trackId)
    print img_dir
    if not os.path.exists(img_dir):
        os.mkdir(img_dir)
        print os.path.exists(img_dir)
    html = requests.get(img)  # get函数获取图片链接地址，requests发送访问请求
    img_name = img_dir + '/' + img.encode('utf-8').split('/')[-1]
    print img_name
    with open(img_name, 'wb') as img_file:  # 以byte形式将图片数据写入
        img_file.write(html.content)
        img_file.flush()
    img_file.close()  # 关闭文件


# 更新app的截图
def get_img2(trackId, imgs):
    img_dir = 'app/static/img/' + str(trackId)
    print img_dir
    if not os.path.exists(img_dir):
        os.mkdir(img_dir)
        print os.path.exists(img_dir)

    url_number = len(imgs)
    for n in range(0, url_number):
        img = imgs[n]
        html = requests.get(img)  # get函数获取图片链接地址，requests发送访问请求
        img_name = img_dir + '/screen_shot_' + str(n) + '.jpg'
        print img_name
        with open(img_name, 'wb') as img_file:  # 以byte形式将图片数据写入
            img_file.write(html.content)
            img_file.flush()
        img_file.close()  # 关闭文件


# 更新单个app的图标和截图
def update_app_img(trackId):
    app = App.query.filter_by(trackId=trackId).first()
    get_img(app.trackId, app.artworkUrl60)
    get_img(app.trackId, app.artworkUrl100)
    get_img(app.trackId, app.artworkUrl512)
    # 将screen_shot_urls还原成list对象
    screen_shot_urls = eval(app.screenShotUrls)
    get_img2(app.trackId, screen_shot_urls)


# 更新所有app的图标和截图
def update_img():
    apps = App.query.all()
    for app in apps:
        get_img(app.trackId, app.artworkUrl60)
        get_img(app.trackId, app.artworkUrl100)
        get_img(app.trackId, app.artworkUrl512)
        # 将screen_shot_urls还原成list对象
        screen_shot_urls = eval(app.screenShotUrls)
        get_img2(app.trackId, screen_shot_urls)


# 根据app名称 更新 数据库
def update_db_by_app_name(name):
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
        # 如果track_id是int，转换成unicode
        track_id = apps['results'][n]['trackId']
        track_id = isinstance(track_id, int) and str(track_id).decode('utf-8') or track_id

        version = apps['results'][n]['version']

        # 如果artistId是int，转换成unicode
        artistId = apps['results'][n]['artistId']
        artistId = isinstance(artistId, int) and str(artistId).decode('utf-8') or artistId

        # convert screenshotUrls(list) to screenshotUrls(str)
        screenshotUrls = apps['results'][n]['screenshotUrls']
        screenshotUrls = str(screenshotUrls)

        # convert genres(list) to genres(str)
        genres = apps['results'][n]['genres']
        genres = str(genres)

        # 比对数据库中的app,artist
        app_in_database = App.query.filter_by(trackId=track_id).first()
        artist_in_database = Artist.query.filter_by(artistId=artistId).first()
        upd_in_database = UpdInfo.query.filter_by(trackId=track_id).order_by(UpdInfo.releaseDate.desc()).first()
        if app_in_database is None:
            # 数据库没有app
            app = App(trackId=track_id,
                      description=apps['results'][n]['description'],
                      trackViewUrl=apps['results'][n]['trackViewUrl'],
                      genres=genres,
                      artworkUrl60=apps['results'][n]['artworkUrl60'],
                      artworkUrl100=apps['results'][n]['artworkUrl100'],
                      artworkUrl512=apps['results'][n]['artworkUrl512'],
                      screenShotUrls=screenshotUrls,
                      appType='ios',
                      artistId=artistId,
                      registerDate=dt.now().date(),
                      )
            upd_info = UpdInfo(trackId=track_id,
                               trackCensoredName=apps['results'][n]['trackCensoredName'],
                               version=version,
                               releaseDate=dt.strptime(apps['results'][n]['currentVersionReleaseDate'].
                                                       encode('utf-8').replace('T', ' ').replace('Z', ''),
                                                       '%Y-%m-%d %H:%M:%S').date(),
                               releaseNotes=apps['results'][n].get('releaseNotes', None),
                               )
            db.session.add(app)
            db.session.add(upd_info)
            print 'xxxxxxxxxxxxxxxxxxxx'
            print upd_info.releaseDate
            print 'xxxxxxxxxxxxxxxxxxxx'
            print app.registerDate
            if artist_in_database is None:
                # 开发者不存在
                artist = Artist(artistId=artistId,
                                artistName=apps['results'][n]['artistName'],
                                artistViewUrl=apps['results'][n]['artistViewUrl']
                                )
                db.session.add(artist)

        else:
            if upd_in_database.version == version:
                continue
            else:
                # 版本不一致，则更新
                upd_info = UpdInfo(trackId=track_id,
                                   trackCensoredName=apps['results'][n]['trackCensoredName'],
                                   version=version,
                                   releaseDate=dt.strptime(apps['results'][n]['currentVersionReleaseDate'].
                                                           encode('utf-8').replace('T', ' ').replace('Z', ''),
                                                           '%Y-%m-%d %H:%M:%S').date(),
                                   releaseNotes=apps['results'][n].get('releaseNotes', None),
                                   )
                db.session.add(upd_info)
        db.session.commit()
    apps = App.query.all()
    print apps
    artists = Artist.query.all()
    print artists
    updinfo = UpdInfo.query.all()
    print updinfo
