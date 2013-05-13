---
layout: post
status: publish
published: true
title: Ruby Documentation
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 105
wordpress_url: http://woss.name/?p=105
date: 2005-09-07 17:43:56.000000000 +01:00
categories:
- Geekery
- Python
tags: []
comments: []
---
Since it's taken me <em>days<&#47;em> to rediscover this (just because I was looking in the wrong place), I thought I'd document it here.  In order to start a web server which will publish the documentation for the Ruby Gems you currently have installed, run <code>gem_server<&#47;code>.  The documentation will then be available (by default) on <a href="http:&#47;&#47;127.0.0.1:8808&#47;">http:&#47;&#47;127.0.0.1:8808&#47;<&#47;a>.  I'd been Googling and reading man pages, trying to remember how I'd achieved this before, but I'd gone completely onto the wrong track by figuring it would be something to do with <code>rdoc<&#47;code> (like, in the Python world, you can do with <code>pydoc -p <em>nnnn<&#47;em><&#47;code>).

Oh, and since I had to dig through the source of the documentation to <a href="http:&#47;&#47;copland.rubyforge.org&#47;">Copland<&#47;a> to figure this out, this is how you now link to an external URL in Ruby's documentation language:

[code]LinkWord[http:&#47;&#47;url.example&#47;to&#47;site][&#47;code]

not like how the <a href="http:&#47;&#47;www.rubycentral.com&#47;book&#47;rdtool.html" title="Programming Ruby: Embedded Documentation">The Pickaxe<&#47;a> documents it.  In fact, that particular chapter seems to bear very little relation to reality...
