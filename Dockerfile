FROM python:3.8

COPY default.conf /etc/apache2/sites-enabled/000-default.conf

RUN apt update \
    && apt install -y apache2 apache2-dev \
    && pip3 install mod_wsgi mod-wsgi-httpd \
    && echo "LoadModule wsgi_module /usr/local/lib/python3.8/site-packages/mod_wsgi/server/mod_wsgi-py38.cpython-38-x86_64-linux-gnu.so" > /etc/apache2/mods-available/mod_wsgi.load \
    && a2enmod mod_wsgi\
    && a2enmod proxy proxy_http rewrite\
    && rm /var/www/* -rf\
    && echo '#!/bin/bash\n\n/usr/sbin/apache2ctl -D FOREGROUND' > /usr/bin/wsgi\
    && chmod +x /usr/bin/wsgi

CMD ["/usr/bin/wsgi"]
