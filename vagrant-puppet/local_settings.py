DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ('Topher', 'topher@jumpcloud.in'),
    )

#Email settings
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'registration@jumpcloud.in'
EMAIL_HOST_PASSWORD = 'Witroehc'
EMAIL_PORT = 587

AGENT_DOMAIN = 'jumpcloud.in'

AGENT_PROTO = 'http'
AGENT_HOST = '192.168.29.1'
AGENT_PORT = 1974
AGENT_URL_BASE = '%s://%s:%d' % (AGENT_PROTO, AGENT_HOST, AGENT_PORT)

LOG_ROOT = '/var/log'

#TODO: this the password salt used by the agent code, this should be change to be unique for each system domain
USER_PWD_SALT = '33b0d84a-fbe0-4e8a-a211-295af614b4e5'

# Make this unique, and don't share it with anybody.
SECRET_KEY = '!5l0@q%dw^zrh3!@e6mfiwyjuzswrr65=cbot#a$gl&amp;kyi_^5-'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'jumpcloud',                      # Or path to database file if using sqlite3.
        'USER': 'jc',                      # Not used with sqlite3.
        'PASSWORD': '9umpcl0ud!',                  # Not used with sqlite3.
        'HOST': 'localhost',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '5432',                      # Set to empty string for default. Not used with sqlite3.
    }
}
