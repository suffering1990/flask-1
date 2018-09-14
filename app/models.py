# -*- coding: utf-8 -*-
from . import db


# class App(db.Model):
#     __tablename__ = 'apps'
#     id = db.Column(db.Integer, primary_key=True)
#     trackId = db.Column(db.String(16), unique=True)
#     trackCensoredName = db.Column(db.String(32))
#     version = db.Column(db.String(16))
#     releaseDate = db.Column(db.String(32))
#     releaseNotes = db.Column(db.Text)
#     description = db.Column(db.Text)
#     screenShotUrls = db.Column(db.String(1024))
#     genres = db.Column(db.String)
#     artworkUrl60 = db.Column(db.String(256))
#     artworkUrl100 = db.Column(db.String(256))
#     artworkUrl512 = db.Column(db.String(256))
#     trackViewUrl = db.Column(db.String(256))
#     appType = db.Column(db.String(16))
#     registerDate = db.Column(db.String(32))
#     registerDays = db.Column(db.Integer)
#     artistId = db.Column(db.String(16), db.ForeignKey('artists.artistId'))
#     update_days = db.Column(db.Integer)
#
#     # def __repr__(self):
#     #     return '<AppName %r>' % self.trackCensoredName
#     def __repr__(self):
#         return '<TrackId %s>' % self.trackId.encode('utf-8')
#
#     def int_to_str(self, id):
#         return str(id).decode('utf-8')
#
#     def get_genres(self):
#         app_genres = eval(self.genres)
#         res = u''
#         for genre in app_genres:
#             res = res + ' ' + genre
#         return res
#
#     # 获得app的更新信息(list形式)
#     def get_app_release_notes(self):
#         notes = eval(self.releaseNotes)
#         return notes
#
#     def get_app_screen_shot_suffixes(self):
#         app_screen_shot_number = eval(self.screenShotUrls)
#         res = ['/screen_shot_0.jpg', '/screen_shot_1.jpg', '/screen_shot_2.jpg',
#                '/screen_shot_3.jpg', '/screen_shot_4.jpg', '/screen_shot_5.jpg']
#         number = len(app_screen_shot_number)
#         if number > 4:
#             return res[0:4]
#         else:
#             return res[0:number]


class Artist(db.Model):
    __tablename__ = 'artists'
    id = db.Column(db.Integer, primary_key=True)
    artistId = db.Column(db.String(16), unique=True)
    artistName = db.Column(db.String(32))
    artistViewUrl = db.Column(db.String(256))

    apps = db.relationship('App', backref='artist')

    def __repr__(self):
        return '<ArtistName %r>' % self.artistName


class App(db.Model):
    __tablename__ = 'apps'
    id = db.Column(db.Integer, primary_key=True)
    trackId = db.Column(db.String(16), unique=True)
    description = db.Column(db.Text)
    screenShotUrls = db.Column(db.String(1024))
    genres = db.Column(db.String)
    artworkUrl60 = db.Column(db.String(256))
    artworkUrl100 = db.Column(db.String(256))
    artworkUrl512 = db.Column(db.String(256))
    trackViewUrl = db.Column(db.String(256))
    appType = db.Column(db.String(16))
    registerDate = db.Column(db.Date)
    artistId = db.Column(db.String(16), db.ForeignKey('artists.artistId'))

    updinfo = db.relationship('UpdInfo', backref='app')

    # def __repr__(self):
    #     return '<AppName %r>' % self.trackCensoredName
    def __repr__(self):
        return '<TrackId %s>' % self.trackId.encode('utf-8')

    def int_to_str(self, id):
        return str(id).decode('utf-8')

    def get_genres(self):
        app_genres = eval(self.genres)
        res = u''
        for genre in app_genres:
            res = res + ' ' + genre
        return res

    def get_app_screen_shot_suffixes(self):
        app_screen_shot_number = eval(self.screenShotUrls)
        res = ['/screen_shot_0.jpg', '/screen_shot_1.jpg', '/screen_shot_2.jpg',
               '/screen_shot_3.jpg', '/screen_shot_4.jpg', '/screen_shot_5.jpg']
        number = len(app_screen_shot_number)
        if number > 4:
            return res[0:4]
        else:
            return res[0:number]


class UpdInfo(db.Model):
    __tablename__ = 'updinfo'
    id = db.Column(db.Integer, primary_key=True)
    trackId = db.Column(db.String(16), db.ForeignKey('apps.trackId'))
    trackCensoredName = db.Column(db.String(32))
    version = db.Column(db.String(16))
    releaseDate = db.Column(db.Date)
    releaseNotes = db.Column(db.Text)

    def __repr__(self):
        return '<Id %r>' % self.trackId


class Project(db.Model):
    __tablename__ = 'projects'
    proId = db.Column(db.Integer, primary_key=True)
    proName = db.Column(db.String(32))

    proreltag = db.relationship('ProRelTag', backref='project')

    def __repr__(self):
        return '<proName %r>' % self.proName

    def id2str(self):
        return str(self.proId)


class Tag(db.Model):
    __tablename__ = 'tags'
    tagId = db.Column(db.Integer, primary_key=True)
    tagName = db.Column(db.String(32))

    proreltag = db.relationship('ProRelTag', backref='tag')

    def __repr__(self):
        return '<tagName %r>' % self.tagName

    def id2str(self):
        return str(self.tagId)


class ProRelTag(db.Model):
    __tablename__ = 'proreltags'
    id = db.Column(db.Integer, primary_key=True)
    tagId = db.Column(db.Integer, db.ForeignKey('tags.tagId'))
    proId = db.Column(db.Integer, db.ForeignKey('projects.proId'))

    def __repr__(self):
        return '<id %r>' % self.id


class TagRelApp(db.Model):
    __tablename__ = 'tagrelapps'
    id = db.Column(db.Integer, primary_key=True)
    tagId = db.Column(db.Integer, db.ForeignKey('tags.tagId'))
    trackId = db.Column(db.Integer, db.ForeignKey('tags.tagId'))
    fav = db.Column(db.Boolean)


class TempApp(object):
    def __init__(self, trackId, trackCensoredName, description, genres, artistName):
        self.trackId = trackId
        self.trackCensoredName = trackCensoredName
        self.description = description
        self.genres = genres
        self.artistName = artistName

    def get_genres(self):
        app_genres = self.genres
        res = u''
        for genre in app_genres:
            res = res + ' ' + genre
        return res
