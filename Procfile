web: gunicorn lagoon.wsgi --limit-request-line 8188 --log-file -
worker: celery worker --app=lagoon --loglevel=info
