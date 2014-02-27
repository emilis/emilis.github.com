.PHONY: default build deploy


default: build

build:	static/style.css html


html:
	jekyll build

static/style.css: static/css/*.less
	lessc --yui-compress static/css/style.less static/style.css


deploy:
	git push
