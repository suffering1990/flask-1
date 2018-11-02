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
                Tag=Tag, Project=Project, TagRelApp=TagRelApp,
                TagType=TagType, ProRelTag=ProRelTag,
                update_db_by_app_name=update_db_by_app_name,
                check_app_id=check_app_id,
                check_app_update=check_app_update,
                update_db=update_db,
                get_artist_apps_by_app_name=get_artist_apps_by_app_name,
                get_img=get_img,
                update_app_img=update_app_img,
                update_img=update_img,
                get_apps_by_app_name=get_apps_by_app_name
                )


manager.add_command("shell", Shell(make_context=make_shell_context))

if __name__ == '__main__':
    manager.run()
