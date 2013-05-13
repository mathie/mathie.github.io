---
layout: post
title: Database scalability
date: 2006-12-05 15:12:48 +00:00
categories:
- Geekery
- Ruby and Rails
- Solaris
- Work
tags:
- Geekery
- Ruby and Rails
- Solaris
- Work
---
We're having a discussion with a new client about how to scale the database
back end. Really, we're not *too* worried about performance -- we don't see
that being a limiting factor at this point. What we *absolutely need* is
reliability. If the database server goes down, the site goes down. It's a
single point of failure. So how does one stop it being a single point of
failure with a Rails application?

We're currently using MySQL and, before I got involved in the project, they
were trying out MySQL replication and clustering. And having very little
success. I haven't actually looked at the setup in any detail yet, so I don't
know what's going wrong, but I'm wondering if these are the best options to
persevere with?

I'm not particularly wedded to MySQL, but we don't particularly want to go
down the route of Oracle if we can avoid it. (Mostly because it sounds big and
scary and the only places I've worked with that used Oracle had a full-time
DBA to manage it!)

So, if you were building a system from the ground up and you absolutely needed
a reliable, fault-tolerant database back end, how would you implement it with
Rails?

Does anybody happen to know how [37Signals](http://www.37signals.com/) do their database backend...?
