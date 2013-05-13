---
layout: post
title: Waa, my subversion is broken!
date: 2007-06-11 11:24:12 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
---
OK, this is mostly a note-to-self because Google wasn't being helpful enough in finding the solution.  When I tried running an `svn stat` in my home directory, I was getting the following:

    mathie@kilchoman:~$ svn stat
    svn: Can't read directory '.': Partial results are valid but processing is incomplete

"Very strange," I thought, "that was working yesterday."  It turns out that some Googling did reveal the message to be `APR_INCOMPLETE` generated from libapr.  A quick truss revealed that it's getting upset while doing a `stat` on one particular file in my home directory.  Ah, yes, I did grab that file last night and, yeah, it's a 3.3GB tarball.  Move it (and all the other large tarballs that appeared in my home directory for testing purposes) out that way and suddenly things start working again.

So, the solution: it would appear that the current subversion build (or APR-something-or-other) in Blastwave on Solaris 10 gets upset when it encounters files which are larger than 2GB or so.

Not a problem, or anything -- who's going to store files that large in Subversion? -- but it's good to know that's what the error means. :-)
