---
layout: post
title: Automating the creation of rails apps in svn
date: 2006-04-05 14:33:54 +01:00
categories:
- Geekery
- Work
---
So I seem to create new rails apps often enough, whether for a new client, to demonstrate a particular feature, or just to try something out in a clean environment.  And I *always* use Subversion to keep my source code (heck, I even keep my home directory in an svn repository!).  So I've created a script which will setup the repository layout, add in rails, capistrano & exception\_notification, configure a few bits, ignore all the generated content, fix any stray shebang lines and create the appropriate databases.  Just in case it's useful to any anybody else, you can grab it here: [new\_rails\_project.sh](http://woss.name/dist/new_rails_project.sh)

What have I missed configuring?
