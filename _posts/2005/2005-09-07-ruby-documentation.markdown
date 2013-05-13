---
layout: post
title: Ruby Documentation
date: 2005-09-07 17:43:56 +01:00
categories:
- Geekery
- Python
---
Since it's taken me <em>days</em> to rediscover this (just because I was looking in the wrong place), I thought I'd document it here.  In order to start a web server which will publish the documentation for the Ruby Gems you currently have installed, run <code>gem_server</code>.  The documentation will then be available (by default) on <a href="http://127.0.0.1:8808/">http://127.0.0.1:8808/</a>.  I'd been Googling and reading man pages, trying to remember how I'd achieved this before, but I'd gone completely onto the wrong track by figuring it would be something to do with <code>rdoc</code> (like, in the Python world, you can do with <code>pydoc -p <em>nnnn</em></code>).

Oh, and since I had to dig through the source of the documentation to <a href="http://copland.rubyforge.org/">Copland</a> to figure this out, this is how you now link to an external URL in Ruby's documentation language:

[code]LinkWord[http://url.example/to/site][/code]

not like how the <a href="http://www.rubycentral.com/book/rdtool.html" title="Programming Ruby: Embedded Documentation">The Pickaxe</a> documents it.  In fact, that particular chapter seems to bear very little relation to reality...
