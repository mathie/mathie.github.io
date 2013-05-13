---
layout: post
status: publish
published: true
title: Ruby and Amazon
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-01-21 18:52:09.000000000 +00:00
categories:
- Geekery
- Python
- Ruby and Rails
- Work
tags:
- Geekery
- Python
- Ruby and Rails
- Work
comments:
- id: 269
  author: Amazon Web Shop
  author_email: laura@awswebshop.com
  author_url: http://www.awswebshop.com
  date: !binary |-
    MjAwNi0wMi0xNyAyMjoyNzoyNCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0xNyAyMToyNzoyNCArMDAwMA==
  content: ! '<p>Do you think that it''s easier to program an amazon shop in Ruby
    or PHP. I''m a php developer who doesn''t have any experience in Ruby myself,
    but I''m curious.</p>


    <p>thanks.</p>'
- id: 270
  author: agnessa
  author_email: agnieszka.figiel@gmail.com
  author_url: http://agnessa.railsplayground.com
  date: !binary |-
    MjAwNi0xMS0wMyAwOTo1MDozMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0wMyAwODo1MDozMCArMDAwMA==
  content: <p>wow, I could really make use of your snippet now :)</p>
---
Well, that's been a fun day of geeking. :-)  I've spent most of the day writing a small <a href="http://www.ruby-lang.org/">Ruby</a> module which will talk to [Amazon's](http://www.amazon.co.uk/) [E-Commerce Service](http://www.amazon.com/gp/aws/landing.html) nicely.  It's been an interesting experience, particularly since I really don't know Ruby all that well (embarrassingly, it took me about 10 minutes to figure out how to iterate through a list -- I'd forgotten to use the `.each` method!).  But I've now got a basic item lookup which will return an item from the Amazon database given an ASIN.  Which is actually pretty much all I need for my other nefarious plan (more on that when it's actually closer to fruition!).  I still need to tidy it up and write some documentation.

The one thing that I actually got to do today, though, was practice Test Driven Development.  I'd write a test to demonstrate what I actually want the method to do, then go off and write the method 'til it actually fulfilled that test case.  Along the way, I'd see edge cases, corners, bits that needed checking, so I'd add test cases for them too.  The proof of the pudding?  I could confidently refactor the lowest-level routine which creates the REST URL and throws it in the direction of Amazon, safe in the knowledge that I'd not broken anything, because the high-level test suite still passed.

I wish we could get [MailManager](http://www.logicalware.com/) to a similar stage.  It's getting there, but very, very slowly, and it makes doing any work on it that bit more painful because you *don't* know that you haven't broken something else with any change you make...

I started off this afternoon with a spike, simply writing a quick script to retrieve something from Amazon.  I did two of them; one with SOAP and one using the REST API.  I never finished the SOAP one -- REST was just *so* much simpler to implement, and faster.
