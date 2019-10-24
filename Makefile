NODE_BIN=./node_modules/.bin
LESSC=${NODE_BIN}/lessc

### Tasks ----------------------------------------------------------------------

.PHONY: default
default: build

.PHONY: build
build:	html static/style.css

.PHONY: setup
setup:	node_modules

.PHONY: html
html:
	jekyll build

.PHONY: deploy
deploy:
	git push


### Targets --------------------------------------------------------------------

node_modules: package.json
	npm i
	touch node_modules

static/style.css: node_modules static/css/*.less
	${LESSC} --clean-css static/css/style.less static/style.css
