---
layout: post
status: publish
published: true
title: ! 'Lazyweb: Ruby diff visualiser'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 388
wordpress_url: http://woss.name/2007/02/08/lazyweb-ruby-diff-visualiser/
date: 2007-02-08 18:50:29.000000000 +00:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
comments:
- id: 763
  author: mikkel
  author_email: mikkel@helenius.dk
  author_url: http://www.helenius.dk
  date: !binary |-
    MjAwNy0wMi0wOCAxOTozMzozNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0wOCAxODozMzozNiArMDAwMA==
  content: <p>i believe the diff code can be found in the rails svn somewhere...or
    was it the wiki?? it has been in the open im sure...<&#47;p>
- id: 764
  author: Seth
  author_email: seth@mojodna.net
  author_url: http://mojodna.net/
  date: !binary |-
    MjAwNy0wMi0wOCAxOTo1NjozMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0wOCAxODo1NjozMyArMDAwMA==
  content: ! '<p>I found it in Instiki or i2 after looking around for a long while.<&#47;p>


    <p>It''s here:

    http:&#47;&#47;dev.rubyonrails.org&#47;browser&#47;tools&#47;i2&#47;vendor&#47;html_diff&#47;lib&#47;html_diff.rb?rev=2294<&#47;p>


    <p>Be warned though, it''s a bit slow (for common diffs, such as the diff between
    the 2 most recent versions, I''m actually storing the diff rather than calculating
    it on the fly).<&#47;p>'
- id: 765
  author: Kyle Maxwell
  author_email: kyle@kylemaxwell.com
  author_url: http://www.kylemaxwell.com
  date: !binary |-
    MjAwNy0wMi0wOCAyMTowOTo0MCArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0wOCAyMDowOTo0MCArMDAwMA==
  content: ! '<p>I use this for my diff displays:

    http:&#47;&#47;ejohn.org&#47;projects&#47;javascript-diff-algorithm&#47;<&#47;p>


    <p>Also, a simple Google search for ruby diff returned useful results.<&#47;p>'
- id: 766
  author: Nathan de Vries
  author_email: nathan@atnan.com
  author_url: http://www.atnan.com
  date: !binary |-
    MjAwNy0wMi0wOSAwMTo0MjowNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0wOSAwMDo0MjowNSArMDAwMA==
  content: <p>The SVN diff library provided in TextMate's subversion bundle is rather
    good. You might want to contact them and ask if their library could be made "available".<&#47;p>
- id: 767
  author: Benjamin Oakes
  author_email: benjamin.d.oakes@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNy0xNSAyMDo0NDowNCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNy0xNSAxOTo0NDowNCArMDEwMA==
  content: ! '<p>The HTMLDiff library located at http:&#47;&#47;dev.rubyonrails.org&#47;browser&#47;tools&#47;i2&#47;vendor&#47;html_diff&#47;lib&#47;html_diff.rb?rev=2294
    didn''t work with Rails 2.1 for me (I kept getting a cryptic error message saying
    "wrong number of arguments (0 for 1)", even though the same exact code outside
    of Rails would work perfectly fine).  I found a modified version that did work
    at:<&#47;p>


    <p>http:&#47;&#47;www.mypoint.se&#47;wp-content&#47;uploads&#47;2008&#47;06&#47;html_diff.rb<&#47;p>'
- id: 768
  author: Artem Vasiliev
  author_email: abublic@gmail.com
  author_url: http://thirstydoh.wordpress.com
  date: !binary |-
    MjAwOC0wNy0yOSAwODoyMjoxOSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNy0yOSAwNzoyMjoxOSArMDEwMA==
  content: ! '<p>Not sure this is what you want, but might be helpful: I scratched
    together a gem that converts diff to formatted HTML: http:&#47;&#47;github.com&#47;artemv&#47;diff_to_html.rb&#47;tree&#47;master.
    For now I think it works only with SVN diffs, and I have pending changes to it
    making it suitable for Git diffs also - contact me if interested.<&#47;p>'
---
I was sure I'd seen a plugin for Rails or a gem which allows one to nicely, visually, display the differences between two pieces of text.  So I thought to myself "OK, that's a solved problem, I'll go find it when I need it for this project."  I'd thought the [comatose](http:&#47;&#47;comatose.rubyforge.org&#47;) plugin just did it, or perhaps some other tool I'd been using recently.

OK, so it was a tool I'd been using recently, but it turns out it was [Writeboard](http:&#47;&#47;www.writeboard.com&#47;).  Does anybody happen to know if the code which does that fancy juju is publicly available, or if there's another implementation which does something similar?  Just because I'm, well, y'know, lazy and I'd rather write something new than reinvent the wheel. :-)
