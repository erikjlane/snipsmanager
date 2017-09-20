run:
	@make install
	pip install -e .
	snipsskills install

lint:
	pylint snipsskills/commands/*.py snipsskills/utils/*.py snipsskills/models/*.py snipsskills/*.py

test:
	python setup.py test

format:
	pip install pycodestyle
	pip install autopep8
	autopep8 --in-place --recursive --exclude='src,temp' .
	pycodestyle --exclude='src,temp' .

install:
	@make clean
	python setup.py install
	pip install .

pypi:
	@make install
	python setup.py sdist
	python setup.py bdist_wheel --universal
	twine upload dist/*

clean:
	rm -fr build
	rm -fr dist
	rm -fr .cache
	rm -fr *.egg-info
	rm -fr **/*.pyc
	rm -fr **/__pycache__

deb:
	python setup.py --command-packages=stdeb.command bdist_deb