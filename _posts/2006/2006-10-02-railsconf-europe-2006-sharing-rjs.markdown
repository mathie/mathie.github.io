---
layout: post
status: publish
published: true
title: ! 'RailsConf Europe 2006: Sharing RJS'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 316
wordpress_url: http://woss.name/2006/10/02/railsconf-europe-2006-sharing-rjs/
date: 2006-10-02 10:00:24.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
comments:
- id: 600
  author: Sergey
  author_email: runmen@yandex.ru
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0wMyAxMToxMTozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0wMyAxMDoxMTozMyArMDEwMA==
  content: ! "<p>Bit another way:\nfrom ActionView::Helpers::PrototypeHelper::JavaScriptGenerator::GeneratorMethods<&#47;p>\n\n<p>module
    ApplicationHelper\n    def update_time\n      page.replace_html 'time', Time.now.to_s(:db)\n
    \     page.visual_effect :highlight, 'time'\n    end\n  end<&#47;p>\n\n<p># Controller
    action\n  def poll\n    render(:update) { |page| page.update_time }\n  end<&#47;p>"
---
> This is the fourth in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](&#47;index.php?s=RailsConf+Europe+2006)
> category.

A new discovery for me.  In the controller you can do:

    render :update do |page|
      ## Inline RJS goes here
    end

I'm not sure if it's a great idea, but it could be useful for tiny bits of
RJS. It's a building block for what follows though. The page object in RJS
also has the `<<` operator so you can splat out javascript code directly, for
something that isn't well supported by the JS helpers. With both of these
tools, we can start to create helpers:

    def my_helper
      update_page do |page|
        page.do_hoopy_ajax_things
      end
    end

and then make use of them in the RJS code:

    page << my_helper

That's it, really. It's a pretty simple solution and allows you to share RJS
code amongst several views.
