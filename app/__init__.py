# -*- coding: utf-8 -*-
from flask import Flask
from flask_session import Session
from flask_sqlalchemy import SQLAlchemy
from config import config
from flask_bootstrap import Bootstrap

bootstrap = Bootstrap()
db = SQLAlchemy()
redis_session = Session()


def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)
    bootstrap.init_app(app)
    db.init_app(app)
    redis_session.init_app(app)  # redis保存session

    # routes/errors.html need to be added here
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    return app


from flask import Blueprint

main = Blueprint('main', __name__)
