default: build

clean:
	rm -rf _site

build:
	bundle exec jekyll build

serve:
	bundle exec jekyll serve --watch --future --drafts --unpublished

publish: clean build
	@echo FIXME: Publish the site.
