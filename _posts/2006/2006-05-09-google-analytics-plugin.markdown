---
layout: post
title: Google Analytics Plugin
date: 2006-05-09 15:47:21 +01:00
categories:
- Geekery
- Work
---
(AKA 'my first plugin')

Since the existing one from the [Plugins](http://wiki.rubyonrails.com/rails/pages/Plugins) page on the rails wiki isn't resolving correctly, I've created my own [Google Analytics](http://www.google.com/analytics/) plugin.  I got fed up adding the same chunk of code to `app/views/layouts/application.rhtml` for every new application.  So hopefully this will make things nice and easy.

To install it, add my plugin repository to your rails plugin sources:

    script/plugin source http://svn.rubaidh.com/plugins/trunk

and to install the Google Analytics plugin:

    script/plugin install google_analytics

To configure it, add the following to `config/environment.rb`:

    Rubaidh::GoogleAnalytics.tracker_id = 'UA-12345-67'

where the `tracker_id` is what `_uacct` gets set to in the chunk of javascript that Google gives you to insert.  That's it!  All configured!  Your tracking information will be inserted into every page.  If you don't want it in particular controller, you can do the usual to skip after_filters:

    skip_after_filter :add_google_analytics_code

Simple, eh?

**Update 2006/05/10** I've updated plugin so that it should automatically use the SSL version of the Google Analytics URL if it's on an SSL page (so that you don't get warnings about a mixture of secure and insecure content on a page).  I've also added support for specifying the `_udn` which you'll want to put in if you have multiple subdomains appearing on the same report.
