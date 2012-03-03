.PHONY: default build deploy


default: build


build:
	jekyll

deploy:
	git push
