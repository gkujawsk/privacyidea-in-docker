FROM python:3.8.14-bullseye
RUN apt-get update && apt-get install -y libkrb5-dev
RUN git clone https://github.com/privacyidea/privacyidea.git /opt/privacyidea
WORKDIR /opt/privacyidea
RUN pip install -r requirements.txt
RUN pip install gunicorn gssapi psycopg2
RUN git submodule update --init --recursive
RUN git pull --recurse-submodules
RUN mkdir /etc/privacyidea
RUN rm -rf /var/lib/apt/lists/*

COPY entry-point.sh .

ENTRYPOINT [ "./entry-point.sh"]