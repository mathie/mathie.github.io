---
layout: post
status: publish
published: true
title: Switching to Ruby from DarwinPorts
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 116
wordpress_url: http://woss.name/?p=116
date: 2005-09-13 11:08:49.000000000 +01:00
categories:
- Geekery
tags: []
comments: []
---
OK, so last night I got fed up with the copy of <a href="http://www.ruby-lang.org" title="Ruby programming language">Ruby</a> that ships with Mac OS X Tiger.  There are a number of problems with it,  and people have been fixing them with varying degrees of success.  The one that finally broke the camel's back (no that doesn't mean I'm switching back to Perl!) was that readline support has been omitted, and so most of the Rails irb-related scripts don't work.

So, how do you go about switching to the version in <a href="http://darwinports.opendarwin.org/">DarwinPorts</a>?  Well, here's how I did it:

<ul>
  <li>Remove the old gems.  Run <code>sudo gem uninstall .\*</code> and choose the last option, <q>All versions</q>.  You'll be warned that you're uninstalling dependencies of other gems, but agree to continue each time anyway, since you're uninstalling <em>all</em> the gems anyway.</li>
  <li>Scripts will still be left in <code>/usr/bin</code> relating to these gems.  Look for any file with the phrase <code>require 'rubygems'</code> and delete it, with something along the lines of <code>grep -l "require 'rubygems'" /usr/bin/*|xargs sudo rm -i</code>.</li>
  <li>Rename the shipped ruby to something else to make sure we don't run it accidentally in future: <code>sudo mv /usr/bin/ruby /usr/bin/ruby-apple</code></li>
  <li>Install the port: <code>sudo port install ruby</code>  That will chug away for a while as it installs Ruby and all its dependencies.</li>
  <li>Install the rubygems port: <code>sudo port install rb-rubygems</code></li>
  <li>Reinstall all your gems again, with <code>sudo gem install &lt;gem&gt;</code></li>
</ul>

And now you should be able to use all those neat features of Ruby that Apple kindly elided.

In order to install the PostgreSQL gem, I had to do the following (having already installed PostgreSQL 8 through DarwinPorts): <code>POSTGRES_INCLUDE=/opt/local/include/pgsql8/ POSTGRES_LIB=/opt/local/lib/pgsql8/ sudo gem install postgres</code>  This was so that the PostgreSQL gem knew where to find the right include files and libraries.

The one remaining task I had was to update my existing rails code base to tell it that ruby was no longer <code>/usr/bin/ruby</code> but <code>/opt/local/bin/ruby</code>.  I'm afraid I resort to Perl for this bit, so you might want to look away now! :-)

[code]find . -type f ! -path \*/.svn\* | \
  xargs perl -pi~ \
  -e 's~^#!/usr/bin/ruby$~#!/usr/bin/env ruby~'[/code]

So now we find ruby from the path, rather than assuming it's in <code>/usr/bin</code>.  And my rails app now does just as much as it used to.  Which isn't much, really. :-)
