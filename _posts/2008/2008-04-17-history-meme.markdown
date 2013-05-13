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
I see from [Mark](http://diveintomark.org/archives/2008/04/15/history-meme)
and [Tim](http://www.tbray.org/ongoing/When/200x/2008/04/15/History-Meme)
there's this history meme floating around. So, let's see:

    mathie@tullibardine:~$ history|awk '{a[$2]++} END{for(i in a){printf "%5d\t%s \n",a[i],i}}'|sort -rn|head
      636	git
       63	cd
       55	ls
       42	rake
       27	mate
       19	script/console
       16	port
       16	cap
       11	script/server
        7	sudo

Geez, that's a lot of git! Come to think of it, since I keep 1,000 lines of
history, that means nearly 64% of my command line activity recently has
involved git! So the posts here are reflecting reality. :-)

Oh, and I tag [Mark](http://www.sirena.org.uk/log/) and
[Craig](http://barkingiguana.com/).
