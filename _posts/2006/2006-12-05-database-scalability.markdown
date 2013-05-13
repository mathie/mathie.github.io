---
layout: post
status: publish
published: true
title: Database scalability
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 365
wordpress_url: http://woss.name/2006/12/05/database-scalability/
date: 2006-12-05 15:12:48.000000000 +00:00
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
comments:
- id: 736
  author: Jon
  author_email: jon.nairn@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNSAxNjozNjozOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxNTozNjozOSArMDAwMA==
  content: ! '<p>&lt;37signals&gt;Our setup: MySQL, lighttpd/fcgi, Balance/Pen, NFS,
    FreeBSD, and Red Hat Linux. We run our Rails apps on a 3-tier, 14-machine cluster
    (mainly AMD64)

    They seem happy enough with the reliability but if you find soemthing better let
    me know!</p>'
- id: 737
  author: Igor
  author_email: i_m@verizon.net
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNSAxNjozODo1MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxNTozODo1MSArMDAwMA==
  content: <p>Use PostgreSQL 8.2 (it DOES scale as opposed to MySQL - see for example
    http://pda.tweakers.net/?reviews/657 for details) and save yourself a lot of trouble.</p>
- id: 738
  author: Ned Baldessin
  author_email: ned@baldessin.fr
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNSAxNjo1Nzo0OSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxNTo1Nzo0OSArMDAwMA==
  content: ! '<p>We are doing replication for http://madame.lefigaro.fr but there
    are two major problems at the moment, as far as I know:

    1. ActiveRecord doesn''t do connection pooling, so hitting multiple db servers
    is a huge hassle, and

    2. there is no simple way to have failover (automatic switching from one dead
    db server to a healthy one) with a Rails MySQL setup, for the time being.</p>


    <p>I''d also be very interested to hear other people''s experiences.</p>'
- id: 739
  author: Neil Wilson
  author_email: neil@aldur.co.uk
  author_url: http://www.3spoken.co.uk
  date: !binary |-
    MjAwNi0xMi0wNSAxNzowNzo1MiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxNjowNzo1MiArMDAwMA==
  content: ! '<p>How much do you absolutely need it? The main problem is overengineering
    a solution - which introduces unreliability in the form of complexity.</p>


    <p>The simplest solution is to have a spare machine sat there and the MYSQL database
    checkpointed and backed up onto it at regular intervals (depending upon the size
    of the dataset). Then if you have a problem, you restore the database and switch
    the addressing on the spare machine and you are back to the last checkpoint.</p>


    <p>I find that once you put the additional cost (particularly the running cost)
    of anything more complex to the client they suddenly find they don''t need it.</p>


    <p>IME it is very rare indeed that you absolutely require a fault tolerent database
    backend beyond that provided by a simple backup and restore system.</p>'
- id: 740
  author: zdzichu
  author_email: zdzichu@gmail.com
  author_url: http://zdzichubg.jogger.pl
  date: !binary |-
    MjAwNi0xMi0wNSAxNzoxMzowOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxNjoxMzowOCArMDAwMA==
  content: <p>I would go with PostgreSQL. Hey, it's even supported by Sun on Solaris!</p>
- id: 741
  author: Felix
  author_email: sorry@anon.net
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNSAxNzozMzoxMSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxNjozMzoxMSArMDAwMA==
  content: <p>interesting question ... i am thinking about the same. there must be
    a simple way to combine slave replication and rails - but i havent seen it yet</p>
- id: 742
  author: trickie
  author_email: trickie@gmail.com
  author_url: http://trickie.org
  date: !binary |-
    MjAwNi0xMi0wNSAxNzo1Nzo0NiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxNjo1Nzo0NiArMDAwMA==
  content: ! '<p>Use http://www.keepalived.org/ and when one db goes down, you can
    switch dns and master/slave threads. You then just connect to the db server from
    the web server via local dns</p>


    <p>Thats my approach to fail-over and mysql replication.</p>'
- id: 743
  author: Paul Robinson
  author_email: paul@vagueware.com
  author_url: http://vagueware.com
  date: !binary |-
    MjAwNi0xMi0wNSAxODo0OTo1OCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxNzo0OTo1OCArMDAwMA==
  content: ! '<p>Your single points of failure are more numerous than just MySQL -
    your most likely point of failure is the hardware itself, and that includes the
    switches your boxes are plugged into. How much redundancy do you need?</p>


    <p>For me, MySQL scales well enough, but the Postgres/MySQL flamewar could go
    on for ages. All I''d say is compile your kernel, database and as much code as
    possible with local optimisations and benchmark as much as possible. It always
    the case that YMMV.</p>


    <p>And keep in mind that hardware is the weak point in your chain here...</p>'
- id: 744
  author: Jeff de Vries
  author_email: jdevries@pfrog.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNSAxOTozMDo0NCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxODozMDo0NCArMDAwMA==
  content: <p>Have you looked at Sequoia? (http://sequoia.continuent.org/HomePage)  I
    believe it addresses your concerns, and works with MySQL and (better) PostgreSQL.  I
    haven't actually tried it out yet.</p>
- id: 745
  author: Zorel
  author_email: aurelien.dehay@mac.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNSAxOTo0Njo1NCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxODo0Njo1NCArMDAwMA==
  content: ! '<p>Hello.</p>


    <p>If I ever need really high database availibility, I would use sqlrelay ( http://sqlrelay.sourceforge.net/index.html
    ) with a replication system on the database backends. This system works if the
    update rate is not very high. If you overload a backend with updates, you should
    consideer a real cluster (and I only know the Oracle''s one).</p>'
- id: 746
  author: Sheeri
  author_email: awfief@gmail.com
  author_url: http://www.sheeri.com
  date: !binary |-
    MjAwNi0xMi0wNSAyMDozNjowNyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAxOTozNjowNyArMDAwMA==
  content: <p>Oracle doesn't have a real cluster -- it uses a shared disk and multiple
    heads, so it has a very large glaring hole in redundancy.  The disk being a single
    point of failure is really bad design.</p>
- id: 747
  author: Aaron
  author_email: worshama@bnpmedia.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNSAyMToxOTowNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAyMDoxOTowNSArMDAwMA==
  content: ! '<p>Sheeri,</p>


    <p>Oracle''s decision to do a shared storage approach makes sense to their customers,
    of which I am one.  The multi-head can scale and is fault-resistant easily by
    adding servers, the connections can scale and is fault-resistant by adding dual
    Fiber channel switchs and the Drive space can scale and is fault-resistant by
    adding a SAN solution, which oracle bundles into their 10g app.  I don''t believe
    this is the right solution for everyone, since it costs as much as a house.  MySQL
    and MS SQL are both better clustering solutions for most needs.  However it is
    incorrect to say that Oracle does not have a real cluster, they do.</p>'
- id: 748
  author: Marston
  author_email: marston@sugarstats.com
  author_url: http://www.marstononline.com/
  date: !binary |-
    MjAwNi0xMi0wNSAyMToyMDo0NCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAyMDoyMDo0NCArMDAwMA==
  content: <p>Wow, that sqlrelay looks like a great solution.  Thanks for the tip.</p>
- id: 749
  author: David
  author_email: david@davidsmalley.com
  author_url: http://davidsmalley.com
  date: !binary |-
    MjAwNi0xMi0wNSAyMjoyNDoxNCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAyMToyNDoxNCArMDAwMA==
  content: ! '<p>Don''t go too over-board and over-engineer as Neil says above.</p>


    <p>A solution I''ve used successfully so far is to simply get mysql to produce
    a snapshot every X hours and rsync to another server.</p>


    <p>At the same time we also run MySQL Master/Slave replication. If the master
    server goes down then there will be a delay while you switch the backup server
    to be your master.</p>


    <p>This won''t be the most fault tolerant setup in the world, but it will have
    a regular snapshot of good data in case of corruption and a live up to the minute
    replica in case of hardware failure.</p>


    <p>The longest part of this setup for me has always been getting the firewall
    people to open the right ports for the two servers to speak to each other :)</p>'
- id: 750
  author: Felix
  author_email: sorry@anon.net
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNiAxMDo1NjozOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNiAwOTo1NjozOCArMDAwMA==
  content: <p>but the question stays the same ... how to configure ActiveRecord? how
    can i switch between some queries for the master and some for the slaves?</p>
- id: 751
  author: Jeremy Cole
  author_email: jeremy@provenscaling.com
  author_url: http://www.provenscaling.com/
  date: !binary |-
    MjAwNi0xMi0wNyAyMzo1MDoxMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNyAyMjo1MDoxMCArMDAwMA==
  content: ! '<p>Hi,</p>


    <p>Just followed your blog entry from PlanetMySQL, and thought I would comment
    that my company, Proven Scaling, offers consulting and architecture/design for
    building scalable and reliable MySQL-based systems.  Our preferred design uses
    MySQL replication in combination with IP-takeover based failover.  If you''re
    interested in more details, feel free to contact us.</p>


    <p>Regards,</p>


    <p>Jeremy</p>'
- id: 752
  author: Jon
  author_email: jon.nairn@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0xMSAxNTo1OToxNyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0xMSAxNDo1OToxNyArMDAwMA==
  content: ! '<p>@Felix

    http://schf.uc.org/articles/2006/12/06/multiple-concurrent-database-connections-with-activerecord</p>'
- id: 753
  author: hosiawak
  author_email: hosiawak@gmail.com
  author_url: http://www.blik.it
  date: !binary |-
    MjAwOC0wNS0wNiAxNzowMzoxMiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0wNiAxNjowMzoxMiArMDEwMA==
  content: ! '<p>Felix: SQLRelay will do it for you. You configure Rails to connect
    to SQLRelay and SQLRelay figures out where which query should be sent.</p>'
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
