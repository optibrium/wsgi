# Optibrium WSGI
A simple Python Web Server Gateway Interface lifter

## Supported Tags and respective `Dockerfile` links
* [latest](https://github.com/optibrium/wsgi)
* [1](https://github.com/optibrium/wsgi/releases/tag/v1.1.2), [1.1](https://github.com/optibrium/wsgi/releases/tag/v1.1.2), [1.1.2](https://github.com/optibrium/wsgi/releases/tag/v1.1.2)

## How to use this image
Create an app.wsgi / app.py file that exposes the name  _application_

```python
from myproject import application
```

Start a WSGI container

```
docker run -v {/path/to/my/app.wsgi}:/var/www/app.wsgi -p {port}:80 optibrium/wsgi
```

You can include custom Apache config (.conf) in the /etc/apache2/custom directory. This is designed for CORS headers
