---
layout: post
status: publish
published: true
title: Bunch of unrelated questions
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-05-25 09:53:06.000000000 +01:00
categories:
- Geekery
- Photography
- Ruby and Rails
- Solaris
tags: []
comments:
- id: 470
  author: Annabel
  author_email: annabel@rubaidh.com
  author_url: ''
  date: !binary |-
    MjAwNi0wNS0yNSAxMTozNjo1OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0yNSAxMDozNjo1OCArMDEwMA==
  content: <p>hey! arent you sposed to be wurkin?!</p>
- id: 471
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNS0yNSAxMTo0MToyNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0yNSAxMDo0MToyNCArMDEwMA==
  content: ! '<p>annabel: that''s all work-related stuff!  Particularly the twiddling
    of iTunes! :-P</p>'
- id: 472
  author: Chris Plough
  author_email: chris.plough@mavenwire.com
  author_url: http://www.mavenwire.com
  date: !binary |-
    MjAwNi0wNS0yNSAxNDoyNDoxMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0yNSAxMzoyNDoxMiArMDEwMA==
  content: ! '<p>Not 100% sure why Solaris keeps dropping your connection - though
    you may want to look at the following (in case you haven''t already):</p>


    <p>1) Keep an eye on the interface stats, collisions and errors with "netstat
    -i" - the output will look like:

    Name    Mtu     Net/Dest    Address     Ipkts   Ierrs   Opkts   Oerrs   Collis  Queue

    lo0     8232    loopback    localhost   77814   0   77814   0   0   0

    hme0    1500    server1     server1     10658566    3   4832511     0   279257  0

    (hope this isn''t too garbled in the blog)</p>


    <p>2) Setup another tool to maintain a constant connection, even (gasp) telnet.  See
    if the two connections drop at the same time to determine whether it is truly
    a networking issue or just an issue with the sshd daemon.</p>


    <p>3) Break out the sniffer (yup - not pretty, nor easy) and look/log the packets
    near the time of disconnection.  Ethereal and tcpdump install pretty easily on
    Solaris.</p>


    <p>Sorry I don''t have any easy answers, but I hope this helps :)</p>


    <p>BTW, ptools do indeed rock!</p>


    <p>--Chris</p>'
- id: 473
  author: Tim Kerby
  author_email: tim@pentaprism.org
  author_url: ''
  date: !binary |-
    MjAwNi0wNS0zMCAwNzo1NTo0NCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0zMCAwNjo1NTo0NCArMDEwMA==
  content: ! '<p>Have you tried Jhead?  It should give a text output including all
    the extra data.  You may then be able to script this to add the data back in some
    other form</p>


    <p>http://www.sentex.net/~mwandel/jhead/</p>'
---
I had started writing a post about photography and galleries and stuff, but I've since been distracted by a number of other things, so here's hoping somebody can answer a couple of unrelated questions:

* How do Photoshop CS2 know (presumably from the EXIF data) which lens I used to take a photograph, yet Aperture doesn't, nor does [libexif](http://libexif.sourceforge.net/)?  Is it some custom extension to EXIF that Canon use and Adobe understand, but nobody else has bothered with?  What I'm actually looking to do is create smart albums for each lens, as another way of drilling down through my photograph collection.  I suppose the other way to do it is to search on the focal length, hand-sieve and tag with keywords.

* Why is [lighttpd](http://www.lighttpd.net/) getting stuck in `sendfile()`  See [open files](http://woss.name/dist/lighttpd.pfiles.txt) and [stack trace](http://woss.name/dist/lighttpd.pstack.txt).

* On a (possibly) related note, any idea why Solaris (Nevada b37) periodically just drops my ssh session on the floor?  It doesn't seem to be a network conectivity issue since I'm not having similar problems with ssh sessions to another machine wired to the same network.  It's gotten bad enough that I've started using `screen` to get around it.

* Did I ever mention that Solaris' `ptools` totally rock?  Well, once you get used to them and remember they exist.

* And oh dear, Aperture can be a bit slow sometimes.  I've only got ~7,500 images, but searching across the collection regularly reacquaints me with the spinning beachball of death for up to half a minute.  I wouldn't mind so much, but I'm running Aperture on the fastest PowerPC Apple will ever release...

* And what's with iTunes' Party Shuffle this morning?  It seems to be biased towards Oasis and Queen this morning.  I'm having a cunning idea about how to fix that, but that's a topic for another post...
