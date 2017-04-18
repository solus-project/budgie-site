SHELL = /bin/bash

benchmark:
	hugo benchmark --quiet

deploy:
	hugo --quiet --destination public-deployed/
	rm -v public-deployed/index.html

local:
	hugo server --baseURL "http://127.0.0.1:1313" --watch --ignoreCache

setup:
	git submodule init
	sudo eopkg install hugo
	mkdir -p themes/budgie/static/{css,js}

sync:
	git submodule update --remote --rebase
	mkdir -p themes/budgie/static/{css,js}
	cp -R budgie-site-styling/build/* themes/budgie/static/css/
	cp -R solbit/build/fonts/*.{eot,svg,ttf,woff} themes/budgie/static/css/fonts/
	rm themes/budgie/static/js/solbit*
	cp solbit/build/solbit*.min.js themes/budgie/static/js/

help:
	@echo "deploy    - Create the deployed form of site. Not particularly useful for those not able to deploy the site."
	@echo "local     - Run the Budgie Site locally."
	@echo "setup     - Install necessary tooling for development."
	@echo "sync      - Update git submodules and update assets."