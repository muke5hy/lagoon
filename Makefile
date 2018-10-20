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

npm: 
	npm install
tests:
	export APP_SETTINGS=config.TestingConfig
	nosetests -v tests

install:
	echo "Installing packages from requirements.txt"
	.venv/bin/pip install -r requirements.txt

run:
	.venv/bin/python manage.py runserver

clean:
	rm *.pyc

requirements:
	pip freeze > requirements.txt

manage:
	.venv/bin/python manage.py $(ARG)

shell:
	.venv/bin/python