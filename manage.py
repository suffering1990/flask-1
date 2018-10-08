# -*- coding: utf-8 -*-
# !/usr/bin/env python
from app import create_app, db
from flask_script import Manager, Shell
from flask_migrate import Migrate, MigrateCommand
from app.utils.crawl_utils import *

app = create_app(os.getenv('FLASK_CONFIG') or 'default')
manager = Manager(app)
migrate = Migrate(app, db)


# shell模式启动，自动导入对象，可以用来测试
def make_shell_context():
    return dict(app=app, db=db, App=App, Artist=Artist, UpdInfo=UpdInfo,
                update_db_by_app_name=update_db_by_app_name,
                check_app_id=check_app_id,
                check_app_update=check_app_update,
                get_update_days=get_update_days,
                get_artist_apps_by_app_name=get_artist_apps_by_app_name,
                get_img=get_img,
                update_app_img=update_app_img,
                update_img=update_img,
                get_apps_by_app_name=get_apps_by_app_name
                )


# update_db_by_app_name(u'New.Do')
# update_db_by_app_name(u'渤海信托')
# update_db_by_app_name(u'渤海保呗')
# update_db_by_app_name(u'飞行加')
# update_db_by_app_name(u'国付宝')
# update_db_by_app_name(u'易生支付')
# update_db_by_app_name(u'海南航空')
# update_db_by_app_name(u'福州航空')
# update_db_by_app_name(u'天津航空')
# update_db_by_app_name(u'大集金服')
# update_db_by_app_name(u'首都航空')
# update_db_by_app_name(u'前海航交所')
# update_db_by_app_name(u'海航通信')
# update_db_by_app_name(u'掌合商城')


# check_app_update('989680116',10)
# get_update_days('2018-06-16T18:47:20Z')
# get_img('111111',u'https://is3-ssl.mzstatic.com/image/thumb/Purple4/v4/c0/7c/60/c07c60de-6170-c830-fc4c-c742abd48a42/source/60x60bb.jpg')

# get_app_genres(App.query.first().genres)


manager.add_command("shell", Shell(make_context=make_shell_context))

if __name__ == '__main__':
    manager.run()
