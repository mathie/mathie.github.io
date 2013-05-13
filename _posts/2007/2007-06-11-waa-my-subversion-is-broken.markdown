---
layout: post
status: publish
published: true
title: Waa, my subversion is broken!
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 437
wordpress_url: http://woss.name/2007/06/11/waa-my-subversion-is-broken/
date: 2007-06-11 11:24:12.000000000 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
comments:
- id: 872
  author: Eric Leventhal Arthen
  author_email: elarthen@kivasystems.com
  author_url: http://www.kivasystems.com
  date: !binary |-
    MjAwNy0wOS0wNiAyMTo0MTozNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOS0wNiAyMDo0MTozNiArMDEwMA==
  content: ! '<p>Thank you, this not helped me fix a similar problem.<&#47;p>


    <p>In my case though, it was not a file checked into Subversion that caused the
    problem. Rather we have a logs directory that is checked in, even though the log
    files themselves are never checked in. Still, after some configuration changes
    some of the logs exceeded 2 gig, so svn updated failed to run on our cruisecontrol
    system, so the changes to the code where not checked out.<&#47;p>


    <p>By moving the large log files to a non-svn subdirectory, it started working
    again.<&#47;p>'
- id: 873
  author: Lars G.
  author_email: larsoo@start.no
  author_url: ''
  date: !binary |-
    MjAwNy0xMC0xNyAxNzo0MDoxNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0xNyAxNjo0MDoxNyArMDEwMA==
  content: ! '<p>I am running svn through cygwin, I got the same error because there
    was a filename containing non-standard characters.<&#47;p>


    <p>Easily fixed once figured out.<&#47;p>'
- id: 874
  author: RobM
  author_email: robert.meerman@gmail.com
  author_url: http://robmeerman.co.uk
  date: !binary |-
    MjAwOC0wNC0yMyAxNDoyMTowNyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0yMyAxMzoyMTowNyArMDEwMA==
  content: ! '<p>Had this problem on Cygwin, turned out to be a problem with a hidden
    swap file from vim. Running "ls -a" gave an error about the problem file not existing
    (despite being in the listing).<&#47;p>


    <p>Once I fixed this (by closing vim) svn st worked fine again. Thanks to your
    post I had an idea what to look for!<&#47;p>'
- id: 875
  author: Johan
  author_email: asdljkf@asjdflk.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNS0wNiAxNDoyODo1MSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0wNiAxMzoyODo1MSArMDEwMA==
  content: ! '<p>Just a quick thanks for posting this.<&#47;p>


    <p>&#47;J<&#47;p>'
---
OK, this is mostly a note-to-self because Google wasn't being helpful enough in finding the solution.  When I tried running an `svn stat` in my home directory, I was getting the following:

    mathie@kilchoman:~$ svn stat
    svn: Can't read directory '.': Partial results are valid but processing is incomplete

"Very strange," I thought, "that was working yesterday."  It turns out that some Googling did reveal the message to be `APR_INCOMPLETE` generated from libapr.  A quick truss revealed that it's getting upset while doing a `stat` on one particular file in my home directory.  Ah, yes, I did grab that file last night and, yeah, it's a 3.3GB tarball.  Move it (and all the other large tarballs that appeared in my home directory for testing purposes) out that way and suddenly things start working again.

So, the solution: it would appear that the current subversion build (or APR-something-or-other) in Blastwave on Solaris 10 gets upset when it encounters files which are larger than 2GB or so.

Not a problem, or anything -- who's going to store files that large in Subversion? -- but it's good to know that's what the error means. :-)
