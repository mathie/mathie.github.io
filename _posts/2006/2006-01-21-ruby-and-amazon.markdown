---
layout: post
title: Ruby and Amazon
date: 2006-01-21 18:52:09 +00:00
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
---
Well, that's been a fun day of geeking. :-)  I've spent most of the day writing a small [Ruby](http://www.ruby-lang.org/) module which will talk to [Amazon's](http://www.amazon.co.uk/) [E-Commerce Service](http://www.amazon.com/gp/aws/landing.html) nicely.  It's been an interesting experience, particularly since I really don't know Ruby all that well (embarrassingly, it took me about 10 minutes to figure out how to iterate through a list -- I'd forgotten to use the `.each` method!).  But I've now got a basic item lookup which will return an item from the Amazon database given an ASIN.  Which is actually pretty much all I need for my other nefarious plan (more on that when it's actually closer to fruition!).  I still need to tidy it up and write some documentation.

The one thing that I actually got to do today, though, was practice Test Driven Development.  I'd write a test to demonstrate what I actually want the method to do, then go off and write the method 'til it actually fulfilled that test case.  Along the way, I'd see edge cases, corners, bits that needed checking, so I'd add test cases for them too.  The proof of the pudding?  I could confidently refactor the lowest-level routine which creates the REST URL and throws it in the direction of Amazon, safe in the knowledge that I'd not broken anything, because the high-level test suite still passed.

I wish we could get [MailManager](http://www.logicalware.com/) to a similar stage.  It's getting there, but very, very slowly, and it makes doing any work on it that bit more painful because you *don't* know that you haven't broken something else with any change you make...

I started off this afternoon with a spike, simply writing a quick script to retrieve something from Amazon.  I did two of them; one with SOAP and one using the REST API.  I never finished the SOAP one -- REST was just *so* much simpler to implement, and faster.
