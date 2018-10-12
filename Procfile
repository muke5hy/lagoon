web: gunicorn simpleats.wsgi --limit-request-line 8188 --log-file -
worker: celery worker --app=simpleats --loglevel=info
