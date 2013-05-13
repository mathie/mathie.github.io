---
layout: post
title: Subversion and NFS file locking
date: 2005-08-25 14:13:03 +01:00
categories:
- Geekery
---
I should prefix this with a warning:  I know <em>next to nothing</em> about file locking and the implications of what I've just done.  However, it now appears to work, and I'm not <em>too</em> worried about simultaneous access to my subversion repository since I'm the only one that uses it.  (Even the <a href="http://woss.name/svn/">web interface</a> is currently running from a read-only mirror of the repository.)

Since <a href="http://www.dreamhost.com/rewards.cgi?wossname">DreamHost</a> have upgraded my shell machine to Sarge, my subversion repository has stopped working.  Which is not entirely unexpected, since one of the libraries the <code>svn</code> binary dynamically linked to (<code>libgdbm</code>) had shifted its SO_NAME from 1 to 3 in the upgrade.  OK, so a rebuild was done and the binaries were working.  Except for one major problem:

[code]mathie@Tandoori:mathie$ svn up
svn: Error opening db lockfile
svn: Can't get shared lock on file '/home/mathie/svnroot/locks/db.lock': No locks available[/code]

It couldn't successfully lock the repository.  Now my subversion repository uses the fs_fs backend (rather than Berkeley DB), and it's on an NFS mount.  It would appear that file locking isn't working over NFS in this particular situation.  Looking at <code>apr/file_io/unix/flock.c</code>, I see there's code to use either <code>fcntl()</code> or <code>flock()</code> to do the locking, but given the choice, it'll use <code>fcntl()</code>.  So I tried out a wee test: <a href="http://woss.name/wp-content/readlock.c">readlock.c</a>  This attempts to create a read lock on a file using both methods.  Both methods work fine on a local filesystem with my laptop (Mac OS X 10.4) and on the shell server (Debian GNU/Linux 3.1).  However the <code>fcntl()</code> method fails on the latter machine when it's on an NFS mount.  <code>flock()</code> does work.  Yee ha.  Solution?  Edit <code>apr/include/arch/unix/apr_private.h</code> and comment out the line that reads:

[code]#define HAVE_FCNTL_H 1[/code]

Rebuild apr with a <code>make clean && make && make install</code> and your copy of subversion now 'works' (as in doesn't fail in the obvious way!) on an NFS-mounted filesystem.

Your job is to tell me how much I risk screwing up my repository having made this change...
