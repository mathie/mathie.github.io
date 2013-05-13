---
layout: post
status: publish
published: true
title: How to annoy your web host
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 51
wordpress_url: http://woss.name/?p=51
date: 2005-08-15 11:29:56.000000000 +01:00
categories:
- Geekery
tags: []
comments: []
---
<ul>
  <li>Install <a href="http:&#47;&#47;websvn.tigris.org&#47;">websvn<&#47;a> to provide a web interface to your subversion repository.<&#47;li>
  <li>Enable downloading of tarballs.<&#47;li>
  <li>Have your repository indexed by the Google and MSN bots...<&#47;li>
  <li>Note that websvn seems to not clean up after itself when it's created the tarball.<&#47;li>
  <li>See that websvn's temporary directory is taking up something in the region of 10GB, since it appears to contain a checked out copy and tarball for every possible directory tree under your repository.  (And maybe for every version -- I'm not hanging around that far over my quota for long enough to find out!)<&#47;li>
<&#47;ul>

Eek.  Just as well I checked my disk usage at <a href="http:&#47;&#47;www.dreamhost.com&#47;r.cgi?wossname">DreamHost<&#47;a> this morning. Hopefully, since I've only been over quota for a couple of days and it appears to be amortized over the month, I won't get charged for it!

Now to go report the bug to the websvn developers...

<strong>Update<&#47;strong> It's already been logged by somebody else as <a href="http:&#47;&#47;websvn.tigris.org&#47;issues&#47;show_bug.cgi?id=30">issue 30<&#47;a>.  Seems an easy enough fix, but I think I'll leave tarball generation switched off all the same...
