FROM debian:buster

COPY default.conf /etc/apache2/sites-enabled/000-default.conf

RUN apt update \
    && apt install -y apache2 python3-pip libapache2-mod-wsgi-py3\
    && a2enmod wsgi proxy proxy_http rewrite ssl\
    && rm /var/www/* -rf\
    && echo '#!/bin/bash\n\n/usr/sbin/apache2ctl -D FOREGROUND' > /usr/bin/wsgi\
    && chmod +x /usr/bin/wsgi

CMD ["/usr/bin/wsgi"]
