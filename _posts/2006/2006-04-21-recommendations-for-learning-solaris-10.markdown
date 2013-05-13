---
layout: post
title: Recommendations for Learning Solaris 10?
date: 2006-04-21 09:37:46 +01:00
categories:
- Geekery
- Solaris
- Work
---
OK, I think I need a book.  How does one go about learning the ins and outs of Solaris 10?  My [Safari](http://safari.oreilly.com/) subscription is remarkably sparse on Solaris in general and there appears to be something in the region of bugger-all covering Solaris 10.  The recent experience I have is pretty much of Linux and FreeBSD, though in the past couple of years I've even shyed away from much sysadmin of them, preferring to use managed services or shared hosting instead.  So, what do I want to learn about?  Well, some of these topics:

* Probably a dummies intro to Solaris, from the perspective of an experienced Linux geek (ie a cheat-sheet which says, for example "when you want the equivalent of `ps ax`, type `ps -ef`").
* Configuring the system to acquire and apply patches.
* Setting up RAID 1 mirroring of the two disks in the machine.  I did this once, long ago, along with lots of other LVM shenanigans with a pair of Sparc Storage Arrays and Solstice Disk Suite.
* I'd like to play around with these Zone/Container things for separating application parts into their own domain.
* Locking the server down for going into production.  There are lots of strange services running and ports open and this gives me the heebie jeebies.  I'd like to know what they all do, what can safely be switched off, and how to firewall the rest from teh Intarweb.

I'd also like some sort of recommendation on best practices for installing additional software on Solaris.  I'm going to be wanting [Lighttpd](http://www.lighttpd.net/), [Ruby](http://www.ruby-lang.org/) (along with a bunch of gems, but I'm happy using Rubygems to manage them) and [MySQL](http://www.mysql.com/) amongst others.  Am I better building things myself and accepting that I'll have to be aware of updates to these packages and their dependencies?  Or is it better to go with some third party packaging system?  So far, I've found [OpenPKG](http://www.openpkg.org/).  Are they a good bet?  Are there other alternatives that would be better?

**Update:** Woo!  I've just found `/usr/sfw` with a whole load of useful stuff in it, like `gcc` for instance.  Though it took `find / -name wget` to find it!  Adding that to my path is making life feel a little less strange...
