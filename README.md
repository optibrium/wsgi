# Optibrium WSGI
A simple Python Web Server Gateway Interface lifter

## Supported Tags and respective `Dockerfile` links
* [latest](https://github.com/optibrium/wsgi)
* 1, 1.0, 1.0.0

## How to use this image
Create an app.wsgi / app.py file that exposes the name  _application_

```python
from myproject import application
```

Start a WSGI container

```
docker run -v {/path/to/my/app.wsgi}:/var/www/app.wsgi -p {port}:80 optibrium/wsgi
```

