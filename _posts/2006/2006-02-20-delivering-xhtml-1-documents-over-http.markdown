---
layout: post
title: Delivering XHTML 1 documents over HTTP
date: 2006-02-20 18:04:59 +00:00
categories:
- Geekery
- Python
---
I've been doing a bit of research this afternoon about how one is supposed to deliver XHTML documents which are correctly validated as either XHTML 1.0 or XHTML 1.1.  From [Sending XHTML as text/html Considered Harmful](http://www.hixie.ch/advocacy/xhtml) and [XHTML Media Types](http://www.w3.org/TR/xhtml-media-types/), I see that they really should be sent with a Content-Type of `application/xhtml+xml`, but the former document states that IE 6 doesn't support content delivered with that type.

And apparently we really shouldn't send it as `text/html`.  The reason given is that browsers are then forced into 'quirks mode' and presume it to be HTML4, complete with tag soup and subtly different interpretations.

Both these documents are quite old, so I was wonder what the current practice was?  Do most browsers correctly handle `application/xhtml+xml`?  Or do modern browsers accept `text/html` might not be quirky HTML 4 and make a more informed decision as to whether to treat it in quirks mode, or standards-compliance mode?

I am sending out validated XHTML 1.1, for the purposes of this query, so some of the arguments in the former paper (about the code not actually being valid XHTML) don't hold water.
