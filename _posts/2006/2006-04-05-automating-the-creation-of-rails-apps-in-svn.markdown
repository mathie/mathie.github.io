---
layout: post
status: publish
published: true
title: Automating the creation of rails apps in svn
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 254
wordpress_url: http://woss.name/2006/04/05/automating-the-creation-of-rails-apps-in-svn/
date: 2006-04-05 14:33:54.000000000 +01:00
categories:
- Geekery
- Work
tags: []
comments:
- id: 365
  author: Jordan Arentsen
  author_email: blissdev@gmail.com
  author_url: http://blissdev.com
  date: !binary |-
    MjAwNi0wNC0wNSAyMjoxMzozNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0wNSAyMToxMzozNSArMDEwMA==
  content: <p>Any info on how to use this? Maybe a tutorial I could use?</p>
- id: 366
  author: Jeroen Janssen
  author_email: japj@xs4all.nl
  author_url: ''
  date: !binary |-
    MjAwNi0wNC0wNiAxMTo0ODo0MiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0wNiAxMDo0ODo0MiArMDEwMA==
  content: ! '<p>Well,</p>


    <p>After a short look at the source of the shell script, you (ofcourse) need to
    modify it before you can use it.</p>


    <p>Change "svnroot" to the root path of your own subversion repository (line 23).</p>


    <p>Note that you will end up with the following setup:

    //trunk

    //branches

    //tags</p>


    <p>So each project will have its own ''environment''.</p>


    <p>Then, according to the ''usage'':</p>


    <p>new_rails_project.sh  [path]</p>


    <p>where  is the name of the project you want to create in the subversion repository
    and [path] is an (optional) checkout path (if you want something different than
    the default "${HOME}/src/mine/svn").</p>


    <p>Note that you probably also want to change the exception notifier email addresses.</p>'
---
So I seem to create new rails apps often enough, whether for a new client, to demonstrate a particular feature, or just to try something out in a clean environment.  And I *always* use Subversion to keep my source code (heck, I even keep my home directory in an svn repository!).  So I've created a script which will setup the repository layout, add in rails, capistrano & exception\_notification, configure a few bits, ignore all the generated content, fix any stray shebang lines and create the appropriate databases.  Just in case it's useful to any anybody else, you can grab it here: [new\_rails\_project.sh](http://woss.name/dist/new_rails_project.sh)

What have I missed configuring?
