# Initial configuration
Don't use default values. Adjust the passwords and secret keys! Remember that PI_DB_PASS === POSTGRES_PASSWORD
PI_DB_PASS: tog2gB9fouX4WExYVxN2m3MC
PI_SECRET_KEY: 3aa9ec03306cf1047602f776db322aa752aa8e8d
PI_ADMIN_PASS: qGswsbBusuztUEKXhiHu
POSTGRES_PASSWORD: tog2gB9fouX4WExYVxN2m3MC

Adjust server_name in data/nginx/nginx.conf
Drop cert.pem and key.pem inside data/nginx

# First run
- docker-compose up -d postgres
- Give it a couple of seconds and verify if postgres is ready docker-compose logs postgres
- d
