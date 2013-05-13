---
layout: post
status: publish
published: true
title: VAT Validation Services
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 493
wordpress_url: http://woss.name/?p=493
date: 2008-11-24 18:32:08.000000000 +00:00
categories:
- Uncategorized
tags: []
comments: []
---
You may have noticed in the news that the [UK VAT rate has temporarily been dropped from 17.5% to 15%](http:&#47;&#47;news.bbc.co.uk&#47;1&#47;hi&#47;uk_politics&#47;7745340.stm).  This change is effective from next Monday (1st December 2008) for 13 months.

Software developers have a nasty habit of making assumptions.  (I know, I'm one of them.)  The standard VAT rate in the UK has been steady at 17.5% for  17 years now and, well, I didn't see this change coming.  And I'll bet that your web developers didn't either.  Fortunately in our instance, at least we had abstracted the VAT rate out into a constant so there is only one place in each application where we have had to make a change.  And since we now have a better idea of the assumption we can make, it's now a method which will return 17.5% unless it's in a particular date range, at which point it will return 15% so we don't have to repeat the fix next year!

So.  How about your web applications?  Do they handle UK VAT calculations?  Are they going to do the right thing come next week?  If you are not sure of the answers to those questions, please get in touch by emailing <mathie@rubaidh.com> or calling us on 0131 273 5271.  Rubaidh will be more than happy to validate your existing code base (no matter the language) and ensure it complies with the new VAT rules.
