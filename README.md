# Initial configuration
Don't use default values. Adjust the passwords and secret keys! Remember that PI_DB_PASS === POSTGRES_PASSWORD
PI_DB_PASS: tog2gB9fouX4WExYVxN2m3MC
PI_SECRET_KEY: 3aa9ec03306cf1047602f776db322aa752aa8e8d
PI_ADMIN_PASS: qGswsbBusuztUEKXhiHu
POSTGRES_PASSWORD: tog2gB9fouX4WExYVxN2m3MC

Adjust server_name in data/nginx/nginx.conf and drop corresponding cert.pem and key.pem inside data/nginx

# HOW TO
- docker-compose up -d postgres - give it a couple of seconds, on next runs you can skip this step
- docker-compose up -d
- https://server_name/
