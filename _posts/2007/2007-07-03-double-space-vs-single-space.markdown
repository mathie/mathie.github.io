---
layout: post
title: Double space vs. Single space
date: 2007-07-03 11:00:38 +01:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- Geekery
- Ruby and Rails
- Work
---
One of the companies I'm contracting for just now (which is actually nearing the stage where I might be able to talk about some of our fun, exciting work over the past several months!) has an editorial aspect to the business.  They receive manuscripts from authors and they are passed through an Editor who copy-edits and proofs them before they go much further.

It turns out that the editorial policy in the office is to have a single space between sentences instead of a double space.  I personally always use a double space and thought that was the accepted standard -- you learn something new every day!  Like me, most of the authors submit their manuscripts with double spaces.  We were talking about ways to automate the replacement (mostly with find-and-replace in Word for now), but a thought occurred to me.  These documents are destined solely for the Internet, and in mostly cases will only be rendered into HTML for a browser.

So, I'm wondering: does it matter?  Do web browsers respect the number of whitespace characters between sentences when they render?  Or do they just think "hmm, it's whitespace, I'll put in a fixed bit of whitespace"?  Or, even better, since it's a stylistic convention, is it controllable through CSS?

Yeah, this is a lazyweb request. :-)

**Update**: OK, let's test:

Single space. Double space.  Delimiter.
