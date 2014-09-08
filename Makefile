default: build

clean:
	rm -rf _site

distclean: clean
	rm -rf node_modules bower_components assets

setup:
	npm install
	bower install

build: setup
	grunt
	bundle exec jekyll build

serve: setup
	grunt
	bundle exec jekyll serve --watch --future --drafts --unpublished

publish: clean build
	@echo FIXME: Publish the site.
