---
layout: post
title: How to annoy your web host
date: 2005-08-15 11:29:56 +01:00
categories:
- Geekery
---
<ul>
  <li>Install [websvn](http://websvn.tigris.org/) to provide a web interface to your subversion repository.</li>
  <li>Enable downloading of tarballs.</li>
  <li>Have your repository indexed by the Google and MSN bots...</li>
  <li>Note that websvn seems to not clean up after itself when it's created the tarball.</li>
  <li>See that websvn's temporary directory is taking up something in the region of 10GB, since it appears to contain a checked out copy and tarball for every possible directory tree under your repository.  (And maybe for every version -- I'm not hanging around that far over my quota for long enough to find out!)</li>
</ul>

Eek.  Just as well I checked my disk usage at [DreamHost](http://www.dreamhost.com/r.cgi?wossname) this morning. Hopefully, since I've only been over quota for a couple of days and it appears to be amortized over the month, I won't get charged for it!

Now to go report the bug to the websvn developers...

**Update** It's already been logged by somebody else as [issue 30](http://websvn.tigris.org/issues/show_bug.cgi?id=30).  Seems an easy enough fix, but I think I'll leave tarball generation switched off all the same...
