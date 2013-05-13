---
layout: post
status: publish
published: true
title: Profiling your rspecs
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2007-08-04 13:27:03.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
comments: []
---
I have a whole pile of [rspec](http://rspec.rubyforge.org/) specs in one particular application.  I've been really good with this one and stuck to working in a behaviour-driven manner.  Well, mostly, I'm still not perfect, sometimes I go fill in the gaps later when I feel I'm under pressure.

Anyway.  One particular aspect of this application is an HTML page scraper.  That part is particularly well specified because it is necessarily fragile.  We're scraping HTML pages from another site that's rather popular, has lots of interesting data to mine and has no API.  And has *really butt-ugly HTML*.  (Guess right, you win a prize, which is probably getting first dibbs on the YouTube video of my client beating me up for spilling his uber-secrets!)

So started out by having the specs scrape the live page, and do some tests on it.  That's all well and good, but I can't actually rely on the data staying the same.  And it was *really* slow -- the whole test suite was taking around 5 minutes to run.  So, let's make it deterministic (getting the same page data back each time) and a little less laggy (cache them locally).  I dump the pages in a YAML file locally and stub out the method which retrieves the remote page to pull it from the YAML file instead.  I wind up with a module along the lines of:

    module WidgetCreation
      def valid_widget_options
        {
        }
      end

      def new_widget(options = {})
        widget = Widget.new(valid_widget_options.merge(options))
        stub_out_dom_reader(widget)
        widget
      end

      def create_widget(options = {})
        widget = new_widget(options)
        widget.save
        widget
      end

      private
      WidgetPages = YAML::load(IO.read("#{RAILS_ROOT}/test/fixtures/widget_pages.yml"))

      def stub_out_widget_reader(widget)
        unless widget.widget_url.blank?
          who = URI.parse(widget.widget_url).path[1..-1]
          widget.stub!(:read_widget_page).and_return(WidgetPages[who])
        end
      end
    end

As an aside, for all of the model specs I create, I build a similar module to load into all of the contexts/descriptions.  It provides me with a standard way of specifying default values that meet the validation criteria of the model, while allowing me to customise particular attributes on `new`/`create`.

Just doing that cut the test suite's run time in half.  Which is nice.  But it was still pretty slow.  Next up: I'm using Hpricot to pull the pages apart and do the scraping.  I wondered if it was being a little slow in doing the initial parse.  The test suite in this state is calling it about 150 times.  So let's try and factor that out.  I wind up with the private part of the module now looking like:

    module WidgetCreation
      private

      WidgetPages = YAML::load(IO.read("#{RAILS_ROOT}/test/fixtures/widget_pages.yml"))
      WidgetDoms = WidgetPages.mutate_values { |v| Hpricot.parse(v) }

      def stub_out_dom_reader(widget)
        unless widget.widget_url.blank?
          who = URI.parse(widget.widget_url).path[1..-1]
          widget.stub!(:read_widget_dom).and_return(WidgetDoms[who])
        end
      end
    end

Now we're just running `Hpricot.parse` once for each HTML page, rather than once per test which is was before.  Score.  That shaved about 30 seconds off the test suite run.  (Another aside, I [talked about `mutate_values` a few days ago](http://woss.name/2007/07/22/mutating-all-the-values-of-a-hash/).)

But it still takes 2 minutes to run.  And since I've just found another 'special case' page, the number of pages we're looking at is about to expand again.

I should have reached for the right tool before now.  Rather than guessing (however correctly it was in this case so far!) where the bottlenecks are, I need to instrument the code and *know* where to optimise.  So I was taking a look at [ruby-prof](http://rubyforge.org/projects/ruby-prof) and I've successfully run it with the particular spec file.  But I don't particularly understand the output.  In particular, I don't understand how some methods are running for '2919600.00%' of the 'total%'!  Does anybody happen to have any success stories or suggestions about profiling your rspecs?
