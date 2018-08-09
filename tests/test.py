from datetime import datetime as dt
from datetime import timedelta as td
import pytz
from hashlib import md5


def test_time():
    print 'now:'
    print dt.now()
    print '7 day ago:'
    print dt.today().date() - td(days=7)
    now = dt.now(pytz.timezone('Asia/Taipei'))
    print now
    print(now.strftime('%Y-%m-%dT%H:%M:%SZ'))

    str2day = dt.strptime('2017-7-19T12:20:30Z'.replace('T', ' ').replace('Z', ''),
                          '%Y-%m-%d %H:%M:%S')
    print str2day.date()
    print (dt.now().date() - str2day.date()).days

    str2day = str2day.replace(tzinfo=pytz.timezone('Asia/Taipei'))
    print str2day

    print (now - str2day).days


def test_instance():
    a = 1234567
    isinstance(a, int)
    print str(a).decode('utf-8') if isinstance(a, str) else 'ss'
    print type(a)
    a = isinstance(a, int) and str(a).decode('utf-8') or a
    print type(a)


def test_sign():
    with open('secret.key', 'rb') as f:
        SECRET_KEY = f.read()
    print type(SECRET_KEY)
    body = 'order_id=1124&buyer_id=37&good_id=38&buyer_point=120&good_price=' \
           '888&order_create_time=1533607254.68603'
    csrfmiddlewaretoken = 'J8C17IX8mW0sAqCyU8mTmo0IPNjjfKC8IAzEA9aY4wxAJB255cowoUdTQ2pY2Hn4'
    print SECRET_KEY + csrfmiddlewaretoken + body
    from hashlib import md5
    print md5(SECRET_KEY + body).hexdigest()


if __name__ == '__main__':
    test_sign()
