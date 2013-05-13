---
layout: post
status: publish
published: true
title: MailManager migration woes
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 170
wordpress_url: http://woss.name/?p=170
date: 2005-11-03 18:55:28.000000000 +00:00
categories:
- Geekery
- Python
- Work
tags: []
comments: []
---
Here I am, trying to convince <a href="http://www.logicalware.com/">MailManager</a> to cleanly migrate from version 1.1 (which used the ZODB backend to store message data) straight to 2.0.3 on MySQL.  And you know, incredibly, I think I've just convinced it to work!  Now it just needs tidied up enough to commit (and to check the PostgreSQL migrations still work).  There were a couple of problems:

<ul>
  <li>We forgot to offer MySQL as a migration path.  Oops. :-)</li>
  <li>The MySQL text search indexes are updated by addTicket() on the fly, so they need to be created at the start of the migration (not at the end, as happens with PostgreSQL, for performance reasons).</li>
  <li>The MySQL tables were created with their default encoding which, on my laptop was ASCII, not UTF-8.</li>
  <li>The ZMySQLDA (the database adapter between Zope and MySQL) has its encoding set to ASCII.  There are apparently various possibilities for convincing it to talk UTF-8 (as discussed in <a href="http://mail.zope.org/pipermail/zope-db/2005-March/003989.html">this thread on zope-db</a>) but the only one that has worked for me is to insert the following in <code>sitecustomise.py</code>:

[code lang="python"]import sys
sys.setdefaultencoding('utf-8')[/code]

which changes the setting globally for your entire Python installation.  Not ideal, but now our application works and who cares about every other Python program on the system? :-)</li>
</ul>

And now there's a weird one.  During the migration, somehow attachments are downloaded to the browser!  This was most entertaining while I was testing with an old dataset of our own and it was crashing after having processed only one attachment. As it crashed, Preview would pop up with a 3 page PDF quote from <a href="http://www.rackspace.co.uk/">Rackspace</a> for one of the servers we ordered a while back!  This was a repeatable feature!  Now it just seems to download all the attachments as one lump, dumping them into a file called <code>migrate</code>.  But the first time was really freaky!

I should mention, by the way, that these 'features' only affect a tiny subset of MailManager users: those who are upgrading from 1.1 to 2.0.x and want to use MySQL as the database backend.  (And hopefully this should be fixed by 2.0.3's release!)  Folks who have just deployed a new instance on MySQL aren't affected and those who are sensible enough to use PostgreSQL wouldn't have any bother at all!  (I wonder if I'm allowed to say bad things about MySQL now that we're a <a href="http://solutions.mysql.com/technology/?item=806">certified gold partner</a>? :-)  I certainly doubt it's going to encourage them to fix the spelling of my surname! )
