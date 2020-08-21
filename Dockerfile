FROM python:3.8

COPY default.conf /etc/apache2/sites-enabled/000-default.conf

RUN apt update \
    && apt install -y apache2 apache2-dev \
    && pip3 install mod_wsgi mod-wsgi-httpd
#        libapache2-mod-wsgi-py3

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
