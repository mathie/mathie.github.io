---
layout: post
status: publish
published: true
title: Using launchd on Mac OS X
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2005-11-22 18:57:07.000000000 +00:00
categories:
- Geekery
tags: []
comments:
- id: 226
  author: Philip
  author_email: globalgorrilla@fastmail.fm
  author_url: ''
  date: !binary |-
    MjAwNS0xMS0yMyAwNToxMzoyOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0yMyAwNDoxMzoyOSArMDAwMA==
  content: Thanks mate! Am going to checkout the postgres plist since i'm using pykota
    and postgres with cups 10.4 server.
- id: 227
  author: Derrick Spell
  author_email: derrick.spell@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMy0xMCAxODo1MjoyOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0xMCAxNzo1MjoyOCArMDAwMA==
  content: <p>What about the OnDemand key to get the databases to start and stop only
    when you want.  I haven't looked into it very closely, but I saw someone using
    a lighttpd server set OnDemand to false to ensure an auto-load.</p>
- id: 228
  author: John Tebbutt
  author_email: tebbutt@nist.gov
  author_url: ''
  date: !binary |-
    MjAwNy0wNS0wNyAyMjo0NzozNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0wNyAyMTo0NzozNiArMDEwMA==
  content: <p>Thanks for this! There are quite a few false leads out there, but when
    I tried your solution it worked like a charm first time. Certainly saved me a
    lot of time and frustration.</p>
- id: 229
  author: Martyn Wilkinson
  author_email: mgw@picdar.com
  author_url: http://www.picdar.com
  date: !binary |-
    MjAwNy0wNi0xMyAxNzozMjo1NiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMyAxNjozMjo1NiArMDEwMA==
  content: ! '<p>There''s no dependancy checking with launchd, but this is because
    it doesn''t need it. To quote from Apple''s "Getting Started with launchd" <a
    href="http://developer.apple.com/macosx/launchd.html" rel="nofollow">http://developer.apple.com/macosx/launchd.html</a>:</p>


    <p>"You cannot specify dependencies and ordering for launchd jobs; instead, design
    daemons to wait for needed resources, or trigger them automatically. For instance,
    on a Linux system, you must specify that the portmap service is launched before
    the NFS server. The Mac OS X approach is to have portmap spawned automatically
    when a server tries to register with it."</p>


    <p>If you set up launchd to run MySQL and Postgres on demand, you shouldn''t have
    to worry about getting them to run in the right order.</p>'
- id: 230
  author: Olivier Amblet
  author_email: olivier@miettes.ch
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0yMSAwODo1NTo0OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0yMSAwNzo1NTo0OSArMDEwMA==
  content: <p>Thank you for the tip, really usefull.</p>
- id: 231
  author: VelociPeek - Eric&#8217;s weblog on tech &raquo; OS X Leopard Startup Script
    for MySQL
  author_email: ''
  author_url: http://velocipeek.com/2007/11/12/os-x-leopard-startup-script-for-mysql/
  date: !binary |-
    MjAwNy0xMS0xMiAyMDoxODoxNyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0xMS0xMiAxOToxODoxNyArMDAwMA==
  content: ! '<p>[...] Interestingly, after writing a quick solution based upon my
    Joggame Server plist for the iPhone, I found this  older blog entry on the net.
    It still appears mostly valid, but the user doesn&#8217;t mention the OnDemand
    key as a part of the service. The OnDemand otpion allows one to either allow a
    daemon to keep running continuously or to allow starts and stops from the launchctl
    interface. From the launchd.plist manpage:  OnDemand [...]</p>'
- id: 232
  author: Dan
  author_email: Dan@DWright.org
  author_url: ''
  date: !binary |-
    MjAwOC0wMi0wNiAyMTowNTo1MiArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMi0wNiAyMTowNTo1MiArMDAwMA==
  content: <p>Looks like the .plist files are no longer available.   Unfortunate because
    I'm trying to solve a similar problem.</p>
- id: 233
  author: kanenas
  author_email: kanenas@comcast.net
  author_url: ''
  date: !binary |-
    MjAwOC0xMC0wNiAxNzoyODo0MCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0wNiAxNjoyODo0MCArMDEwMA==
  content: ! "<p>On demand loading of daemons can be accomplished with the \"Socket\"
    launchd key.  The following example (added to the launchd plist) will monitor
    a network socket at port 3306 and the Unix socket used under the MacPorts install
    of MySQL:</p>\n\n<pre><code>&lt;key&gt;Sockets&lt;/key&gt;\n&lt;dict&gt;\n    &lt;key&gt;MySQL-unix&lt;/key&gt;\n
    \   &lt;dict&gt;\n        &lt;key&gt;SockFamily&lt;/key&gt;\n        &lt;string&gt;Unix&lt;/string&gt;\n
    \       &lt;key&gt;SockPathName&lt;/key&gt;\n        &lt;string&gt;/opt/local/var/run/mysql5/mysqld.sock&lt;/string&gt;\n
    \   &lt;/dict&gt;\n    &lt;key&gt;MySQL-net&lt;/key&gt;\n    &lt;dict&gt;\n        &lt;key&gt;SockFamily&lt;/key&gt;\n
    \       &lt;string&gt;IPv4&lt;/string&gt;\n        &lt;key&gt;SockServiceName&lt;/key&gt;\n
    \       &lt;string&gt;mysql&lt;/string&gt;\n    &lt;/dict&gt;\n&lt;/dict&gt;\n</code></pre>\n\n<p>See
    http://www.macosxhints.com/article.php?story=20080128103022907 for another plist.</p>"
---
<code>launchd</code> is Mac OS X 10.4's replacement for <code>init</code>, <code>cron</code>, (<code>x</code>)<code>inetd</code> and all the various startup bits like <code>/etc/init.d</code> or <code>/Library/StartupItems</code> (as was the preferred way in Mac OS X up to 10.3.x).  It's all replaced with one supervisor daemon which controls the startup (and restart upon failure) of daemons, schedules regular running of tasks and other hoopy things.  I've been reading a little about it at <a href="http://www.macdevcenter.com/lpt/a/6332">Introduction to Tiger Terminal part 5</a> and <a href="http://developer.apple.com/macosx/launchd.html">Getting started with <code>launchd</code></a> trying to figure out how to make it work for me.  And I came up with settings, that will launch the <a href="http://www.darwinports.com/">Darwin Ports</a> copies of both MySQL and PostgreSQL on demand, which you can download here: <a href="http://woss.name/dist/mysql4.plist">mysql4.plist</a> and <a href="http://woss.name/dist/postgresql.plist">postgresql.plist</a>.  Place those files in <code>/Library/LaunchDaemons</code> and, to get <code>launchd</code> to notice them, run the following:

[code]mathie@Tandoori:mathie$ sudo launchctl unload /Library/LaunchDaemons
Password:
mathie@Tandoori:mathie$ sudo launchctl load /Library/LaunchDaemons[/code]

You should now have a couple of extra launch services to control, which you can see with:

[code]mathie@Tandoori:mathie$ sudo launchctl list
[ ... ]
mysql4
postgresql[/code]

In order to start MySQL and PostgreSQL, run the following:

[code]mathie@Tandoori:mathie$ sudo launchctl start mysql4
mathie@Tandoori:mathie$ sudo launchctl start postgresql[/code]

And to stop them, replace the <code>start</code> in the above example with <code>stop</code>.  If either of the daemons happen to die horribly, they ought to be automatically restarted.  It's even smart about giving up restarting them if they fail 10 times in a short period.  If you want to always start these daemons automatically at boot (I don't, really, I just want to use them on demand occasionally), add the following inside the top-level dict in each of the plist files:

[code lang="xml"]<key>RunAtLoad</key>
<true/>[/code]

You'll need to repeat the <code>unload</code>/<code>load</code> sequence from above to reload the plist files, but you'll notice that the MySQL and PostgreSQL daemons both start when the <code>load</code> command is issued (and also at system boot time).

Next, I would like to actually get MySQL and PostgreSQL to both start <em>entirely on demand</em>.  It looks kinda like this should be possible with <code>launchd</code>, using the <code>WatchPaths</code> key.  If I could tell it to watch for clients attempting to connect to the daemon's socket, then magically start the daemon in question on demand, quitting it after it's not needed, I could save quite a bit of system resources (particularly since I only really use PostgreSQL in a work capacity -- most of my personal development projects use MySQL since that's what my hosting company provides).

Unfortunately, I can't quite see how to achieve this.  Both the database daemons create sockets on the file system when they are launched.  I had hoped that simply specifying this file name as a <code>WatchPath</code> would be enough.  But since the sockets are only created when the daemons start, they aren't pervasive on the file system and don't exist for <code>launchd</code> to watch them the rest of the time.  I do wonder if just creating an empty file and having <code>launchd</code> watch that would be enough, but I suspect not.

It would also appear the <code>launchd</code> doesn't support any sort of dependency checking for daemons.  Which is unfortunate, since the next task I was going to get it to do is manage the Zope instances on my laptop.  However, in order to do this nicely, it would have been good to describe which instances use MySQL and which use PostgreSQL, then start up the relevant database before starting up the instance.  Likewise, if the instance also needed a ZEO for the back end ZODB.  But no, it doesn't appear that we can do that -- <code>StartupItems</code> provides that functionality instead.  So <code>launchd</code> isn't a <em>complete</em> replacement for its predecessors after all.  Oh well.
