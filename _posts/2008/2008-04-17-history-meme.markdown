---
layout: post
status: publish
published: true
title: History meme
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 482
wordpress_url: http://woss.name/?p=482
date: 2008-04-17 11:01:39.000000000 +01:00
categories:
- Uncategorized
tags: []
comments: []
---
I see from [Mark](http:&#47;&#47;diveintomark.org&#47;archives&#47;2008&#47;04&#47;15&#47;history-meme)
and [Tim](http:&#47;&#47;www.tbray.org&#47;ongoing&#47;When&#47;200x&#47;2008&#47;04&#47;15&#47;History-Meme)
there's this history meme floating around. So, let's see:

    mathie@tullibardine:~$ history|awk '{a[$2]++} END{for(i in a){printf "%5d\t%s \n",a[i],i}}'|sort -rn|head
      636	git
       63	cd
       55	ls
       42	rake
       27	mate
       19	script&#47;console
       16	port
       16	cap
       11	script&#47;server
        7	sudo

Geez, that's a lot of git! Come to think of it, since I keep 1,000 lines of
history, that means nearly 64% of my command line activity recently has
involved git! So the posts here are reflecting reality. :-)

Oh, and I tag [Mark](http:&#47;&#47;www.sirena.org.uk&#47;log&#47;) and
[Craig](http:&#47;&#47;barkingiguana.com&#47;).
