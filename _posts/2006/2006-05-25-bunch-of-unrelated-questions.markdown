---
layout: post
title: Bunch of unrelated questions
date: 2006-05-25 09:53:06 +01:00
categories:
- Geekery
- Photography
- Ruby and Rails
- Solaris
---
I had started writing a post about photography and galleries and stuff, but I've since been distracted by a number of other things, so here's hoping somebody can answer a couple of unrelated questions:

* How do Photoshop CS2 know (presumably from the EXIF data) which lens I used to take a photograph, yet Aperture doesn't, nor does [libexif](http://libexif.sourceforge.net/)?  Is it some custom extension to EXIF that Canon use and Adobe understand, but nobody else has bothered with?  What I'm actually looking to do is create smart albums for each lens, as another way of drilling down through my photograph collection.  I suppose the other way to do it is to search on the focal length, hand-sieve and tag with keywords.

* Why is [lighttpd](http://www.lighttpd.net/) getting stuck in `sendfile()`  See [open files](http://woss.name/dist/lighttpd.pfiles.txt) and [stack trace](http://woss.name/dist/lighttpd.pstack.txt).

* On a (possibly) related note, any idea why Solaris (Nevada b37) periodically just drops my ssh session on the floor?  It doesn't seem to be a network conectivity issue since I'm not having similar problems with ssh sessions to another machine wired to the same network.  It's gotten bad enough that I've started using `screen` to get around it.

* Did I ever mention that Solaris' `ptools` totally rock?  Well, once you get used to them and remember they exist.

* And oh dear, Aperture can be a bit slow sometimes.  I've only got ~7,500 images, but searching across the collection regularly reacquaints me with the spinning beachball of death for up to half a minute.  I wouldn't mind so much, but I'm running Aperture on the fastest PowerPC Apple will ever release...

* And what's with iTunes' Party Shuffle this morning?  It seems to be biased towards Oasis and Queen this morning.  I'm having a cunning idea about how to fix that, but that's a topic for another post...
