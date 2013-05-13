---
layout: post
status: publish
published: true
title: Quake III Source Released
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 72
wordpress_url: http://woss.name/?p=72
date: 2005-08-22 12:47:52.000000000 +01:00
categories:
- Geekery
tags: []
comments:
- id: 58
  author: annabel
  author_email: annabel@durasonline.com
  author_url: ''
  date: !binary |-
    MjAwNS0wOC0yMiAxNjowNjo0NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0yMiAxNTowNjo0NiArMDEwMA==
  content: ! 'The one major thing I noticed is the tingly feeling in my stomach while
    I was scanning through those lines of C



    awww.... my gorgeous geek-boy, so sweet :o)'
- id: 59
  author: Mike
  author_email: m.rovardi@blueyonder.co.uk
  author_url: http://www.livejournal.com/users/digitalwanderer/
  date: !binary |-
    MjAwNS0wOC0yMyAyMzoxNDo0MiArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0yMyAyMjoxNDo0MiArMDEwMA==
  content: ! 'Do you two want to be left alone with the code for a while...?  :-)



    Mike'
---
The source to <a href="http://www.idsoftware.com/games/quake/quake3-arena/" title="id Software: Quake III Arena">Quake III</a> has been released.  The canonical forum for discussions seems to be the <a href="http://www.quakesrc.org/forums/viewforum.php?f=20">Quake Standards Group</a> (and there's a couple of posts there about mirrors since the id FTP site is permanently busy!).

So I've got the source.  It has a Mac OS X PowerBuilder project already, so it's ready to go in Xcode.  When you initially open it up, it will mention that it needs to convert the project format and write it out, calling it <code>Quake3.xcodeproj</code> instead of <code>Quake3.pbproj</code>.  That's fine and lovely.  Building straight from Xcode works OK.  Building from the command line can be achieved by:

[code]mathie@Tandoori:mathie$ cd path/to/quake3-1.32b/code/macosx/
mathie@Tandoori:macosx$ xcodebuild -target All -configuration Development[/code]

where configuration could be replaced by <code>Deployment</code> if you want debugging symbols left out and additional optimisations activated.  However, this isn't working for me right now -- as far as I could tell, the <code>ID_INLINE</code> macro wasn't being set correctly somehow, but I ran out of time playing with it.

The one major thing I noticed is the tingly feeling in my stomach while I was scanning through those lines of C.  I really miss doing hardcore C/C++ programming.  I need something to get my teeth into in my spare time, just to keep those <code>l33t k0d1ng 5k1lLs</code> up to scratch while I'm spending my daytime working with <em>lightweight</em> (and I mean that in the pejorative sense -- like describing somebody who can't hold their beer!) languages like Python. :-)
