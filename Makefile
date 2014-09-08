default: build

clean:
	rm -rf _site

distclean: clean
	rm -rf node_modules

setup:
	npm install

build: setup
	bundle exec jekyll build

serve: setup
	bundle exec jekyll serve --watch --future --drafts --unpublished

publish: clean build
	@echo FIXME: Publish the site.
