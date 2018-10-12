ARG := $(word 2, $(MAKECMDGOALS) )
# pipenv run python manage.py test $(ARG) --parallel

all: venv install

bootstrap: 
	echo "Installing Pip"
	sudo apt-get install python-pip
	echo "Installing virtualenv"
	sudo pip install virtualenv
	sudo pip install nose

venv:
	virtualenv .venv -p python3

tests:
	export APP_SETTINGS=config.TestingConfig
	nosetests -v tests

install:
	echo "Installing packages from requirements.txt"
	.venv/bin/pip install -r requirements.txt

run:
	echo "Do export APP_SETTINGS=config.DevelopmentConfig"
	.venv/bin/python run.py runserver

clean:
	rm *.pyc

requirements:
	echo "Updating requirements.txt"
	pip freeze > requirements.txt
