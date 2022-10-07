#!/bin/sh
# This script checks if the container is started for the first time.


CONTAINER_FIRST_STARTUP="CONTAINER_FIRST_STARTUP"
if [ ! -e /$CONTAINER_FIRST_STARTUP ]; then
cat > /etc/privacyidea/pi.cfg << EOF
SUPERUSER_REALM = ['super', 'administrators']
SQLALCHEMY_DATABASE_URI = '${PI_DB_SCHEMA}://${PI_DB_USER}:${PI_DB_PASS}@${PI_DB_HOST}/${PI_DB_NAME}'
SECRET_KEY = '${PI_SECRET_KEY}'
PI_PEPPER = "Never know..."
PI_ENCFILE = '/etc/privacyidea/enckey'
PI_AUDIT_NO_SIGN = True
PI_AUDIT_SQL_TRUNCATE = True
PI_LOGFILE = '/var/log/privacyidea.log'
PI_LOGLEVEL = 30
EOF
    touch /$CONTAINER_FIRST_STARTUP
    # place your script that you only want to run on first startup.
    ./pi-manage create_enckey && \
    ./pi-manage create_tables && \
    ./pi-manage admin add -p ${PI_ADMIN_PASS} ${PI_ADMIN_USER}
# else
    # script that should run the rest of the times (instances where you 
    # stop/restart containers).
fi

/usr/local/bin/gunicorn -w 4 --bind 0.0.0.0:3000 "privacyidea.app:create_app()"