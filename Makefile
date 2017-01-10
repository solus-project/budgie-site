SHELL = /bin/bash

benchmark:
	hugo benchmark --quiet

deploy:
	hugo --quiet --destination public-deployed/
	rm -v public-deployed/index.html

local:
	hugo server --baseURL "http://127.0.0.1:1313" --watch --ignoreCache

pull:
	git pull --rebase

setup:
	git submodule init
	sudo eopkg install hugo
	mkdir -p themes/budgie/static/{css,js}

submoduleupdate:
	git submodule update --remote --rebase

assetcopy:
	mkdir -p themes/budgie/static/{css,js}
	cp -R budgie-site-styling/build/* themes/budgie/static/css/
	cp budgie-site-js/build/site.min.js themes/budgie/static/js/

sync: submoduleupdate assetcopy

help:
	@echo "minifier  - Minify the public/ HTML."
	@echo "pull      - Pull / rebase latest changes"
	@echo "setup     - Install necessary tooling for minification."
	@echo "sync      - Update git submodules and update assets."