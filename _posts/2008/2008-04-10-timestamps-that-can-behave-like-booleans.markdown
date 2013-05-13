---
layout: post
status: publish
published: true
title: Timestamps that can behave like booleans
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 477
wordpress_url: http://woss.name/?p=477
date: 2008-04-10 17:25:09.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- active_record
- booleans
- named_scope
- plugin
- rails
- ruby
comments:
- id: 994
  author: Taryn East
  author_email: rubygirl@taryneast.com
  author_url: http://www.taryneast.com/
  date: !binary |-
    MjAwOC0wNC0xMSAwMToxMDozMSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xMSAwMDoxMDozMSArMDEwMA==
  content: ! '<p>heya - we use that pattern a bit here too. We have a system that
    allows orders to be stored in varying states - most notably "editable", "submitted"
    and "completed". So we have two of thosed boolean-timestamps: submitted_at and
    completed_at and have been doing something pretty similar to the above for some
    time now.<&#47;p>


    <p>However I''ve been using the autoscope plugin to restrict scope rather than
    rolling my own scoping method.<&#47;p>


    <p>Recently we''re about to add a few more states in, so it''s time for us to
    move over to acts_as_state_machine. But as a simple way of keeping state - you
    can''t beat this method.<&#47;p>'
- id: 995
  author: Henrik N
  author_email: henrik@nyh.se
  author_url: http://henrik.nyh.se
  date: !binary |-
    MjAwOC0wNC0xNCAxMjozODo1NCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xNCAxMTozODo1NCArMDEwMA==
  content: ! "<p>I've done something similar with a module (in <code>app&#47;models&#47;shared&#47;publishable_model.rb<&#47;code>).
    Including the module adds a named scope (has_finder), the instance method<&#47;p>\n\n<pre><code>\ndef
    published?\n  published_at?\nend\n<&#47;code><&#47;pre>\n\n<p>, some methods to
    publish&#47;unpublish etc.<&#47;p>\n\n<p>This is a great fit for us.<&#47;p>\n\n<p>I've
    been <a href=\"http:&#47;&#47;henrik.nyh.se&#47;2008&#47;02&#47;rails-model-extensions\"
    rel=\"nofollow\">using modules<&#47;a> more and more in Rails.<&#47;p>"
---
I often come across this particular use case and it's probably easiest to
explain with an example. Take an ActiveRecord model called `Book` which
represents a book in Amazon's catalogue. In addition to books which are
already published, we collect information about books which are going to be
released at some point in the future. We store the publication date in the
field `published_at`.

More often than not, though, we don't really want to know *when* a book was
(or will be) published, we just want to know whether it has been published or
not.  So I wind up defining a couple of extra methods:

    class Book < ActiveRecord::Base
      def published?
        !published_at.blank?
      end

      def published=(value)
        # Note the automatic time zone conversion magic in edge rails!
        self.published_at = value ? Time.now : nil
      end
    end

All well and good, but I wind up doing that quite a few times across all the
projects I have. Time for an extraction! And what's good about this
extraction? Well, it expresses what I am actually trying to do without boring
you with the details of how I do it.  So how about:

    class Book < ActiveRecord::Base
      timestamped_boolean :published_at
    end

Now we get the two methods defined automatically. And, as I say, we have a
declarative way of saying what we're providing without having to have extra
documentation.

I've pulled this abstraction into a tiny wee plugin which is now up on GitHub.
It's called
[`timestamped_booleans`](http:&#47;&#47;github.com&#47;rubaidh&#47;timestamped_booleans). Feel
free to grab it, fork it, play around. I've got a couple of changes I should
do and push in the next few hours. The first you'll already have noticed if
you're reading carefully; what if the date it is `published_at` is in the
future? It's not published then, is it? So I'll need to modify the question
method to also check that the attribute's date is not in the future.

Next up after that is to automatically declare associated named scopes for
edge Rails because I also wind up doing the equivalent as class methods a lot:

    class Book < ActiveRecord::Base
      def self.find_published(*args)
        with_published do
          find(*args)
        end
      end

      private
      def with_published
        with_scope :find => :conditions => { ['published_at IS NOT ?'], nil} do
          yield
        end
      end
    end

which it wouldn't hurt to tidy up a bit.
