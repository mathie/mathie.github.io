---
layout: post
title: Subversion and NFS file locking
date: 2005-08-25 14:13:03 +01:00
categories:
- Geekery
comments:
- id: 61
  author: nate dreamhost
  author_email: nate@hq.newdream.net
  author_url: http://dreamhost.com
  date: !binary |-
    MjAwNS0wOC0yNSAxODozNjoxMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0yNSAxNzozNjoxMSArMDEwMA==
  content: ! 'We''ll see what the standard Debian Sarge package does in terms of flock()/fcntl().
    I had always thought it was the other way around in terms of NFS-safeness, but
    whatever works!


    We''re in the middle of upgrading our couple hundred machines to Debian Sarge
    now, which has a package, I think for svn, so we''ll make sure that package is
    working and threadsafe!


    If you wanna talk about it more just send a message to support and mention my
    name in the subject, and they''ll send it my way.'
- id: 62
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: ''
  date: !binary |-
    MjAwNS0wOC0yNSAyMDowMTo0OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0yNSAxOTowMTo0OCArMDEwMA==
  content: NFS doesn't support locking so any non-advisory scheme can't be implemented
    on it. The only thing that will go wrong here is that the locking won't entirely
    be there but you say that's not an issue for you so...
- id: 63
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0wOC0yNiAxMTowODo1OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOC0yNiAxMDowODo1OCArMDEwMA==
  content: ! 'nate: Thanks for the comment - that''s what I call proactive support!
    :-)  I''ve been chatting with Jeff &amp; Jeremy about it over at DH support --
    I just figured that it might be a nice idea to post my findings somewhere googleable.
    :-)


    broonie: NFS doesn''t support file locking at all?  I thought NFSv3 did?  And
    both those methods are for advisory locks anyway, aren''t they?  The fcntl() man
    page on Mac OS X certainly describes the F_SETLK and F_SETLKW commands as advisory
    locks.  And flock() is described by its man page (again on Mac OS X admittedly)
    as flock -- apply or remove an advisory lock on an open file.


    I don''t really understand why they appear to be the same thing from a userland
    API point of view, but clearly map to something different underneath...  Maybe
    I should go consult the SUS...'
- id: 64
  author: Dan
  author_email: spoiler@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNS0wOS0wMiAxNjozNjowNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0wMiAxNTozNjowNyArMDEwMA==
  content: ! 'I followed these instrustions and rebuilt my subversion and I still
    get the following errors:


    svn: Unable to open an ra_local session to URL

    svn: Unable to open repository ''path/to/repo''

    svn: Error opening db lockfile

    svn: Can''t get shared lock on file ''path/to/repo'': No locks available


    I will get this working.  I''m determined to have subversion working'
- id: 65
  author: Kai Hendry
  author_email: hendry@iki.fi
  author_url: http://natalian.org
  date: !binary |-
    MjAwNS0xMC0xOSAwMTo0MzoyMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0xOSAwMDo0MzoyMCArMDEwMA==
  content: ! 'svn: Commit failed (details follow):

    svn: Error opening db lockfile

    svn: Can''t get shared lock on file ''/home/hendry/repo/public/locks/db.lock'':
    No locks available



    I am getting the now too on my Dream Host account. :(


    Any ETA when Dreamhost might FIX this??


    http://wiki.dreamhost.com/index.php/Subversion'
- id: 66
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0xMC0xOSAwOToyMzoyMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0xOSAwODoyMzoyMyArMDEwMA==
  content: ! 'Kai: Obviously I don''t speak for DreamHost.  However, the only real
    fix is to arrange for the repositories to be on a local file system, which I suspect
    doesn''t really fit in well with DH''s network architecture (at a guess, most
    of the home directory storage is going to be sitting on NetApp servers?).  So
    it could be a while.


    Go vote for everything subversion related in the suggestions page on the control
    panel, just to let them know that we''d really like proper subversion hosting
    support.  (Including all the bells and whistles -- anonymous http access, trac
    as a repository front end, that kind of thing!)'
- id: 67
  author: Kai Hendry
  author_email: hendry@iki.fi
  author_url: http://natalian.org
  date: !binary |-
    MjAwNS0xMC0yMCAwMjowMToyNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0xMC0yMCAwMTowMToyNSArMDEwMA==
  content: ! 'I don''t see DH moving away from NFS. I don''t have time to wait. Isn''t
    there a work around?


    I''ve hosted my repo with fsfs on NFS without these issues. :/'
- id: 68
  author: Craig Campbell
  author_email: criagc@wil.com
  author_url: ''
  date: !binary |-
    MjAwNS0xMS0xNSAxNjoyMDo1NSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0xNSAxNToyMDo1NSArMDAwMA==
  content: ! 'I''m not sure if this is helpful or not, and the Linux here is Redhat,
    but a quick man on flock mentions (at the bottom)


    "flock(2) does not lock files over nfs.  Use fcntl(2) instead:  that does work
    over nsf, ..."


    I am actually using a call to lockf(3) which end up (aledgedly) calling fcntl(2).


    Take a look and good luck.


    -craig'
- id: 69
  author: Byung-chul Lee
  author_email: io2oi@yahoo.co.kr
  author_url: ''
  date: !binary |-
    MjAwNi0wMi0xNSAwNzo1Mjo0NyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0xNSAwNjo1Mjo0NyArMDAwMA==
  content: ! '<p>I solved this problem with changing the nfs mount option.

    When the "svn: Unable to open an ra_local session to URL

    svn: Unable to open repository â€˜path/to/repoâ€™

    svn: Error opening db lockfile

    svn: Canâ€™t get shared lock on file â€˜path/to/repoâ€™: No locks available" message
    occured, I changed the NFS mount option from default to "hard,intr,bg,nolock,rw"
    and remount the nfs directory to my local mount point.</p>


    <p>I sugget you apply this solution to your systems.</p>'
- id: 70
  author: Chameleon
  author_email: pauledwards@gmail.com
  author_url: http://chameleon.homelinux.net/
  date: !binary |-
    MjAwNi0wMi0xOSAwODo1NDoyMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMi0xOSAwNzo1NDoyMCArMDAwMA==
  content: ! '<p>I agree that Byung-chul Lee''s solution does work.</p>


    <p>Subversion 1.2.1 running on a Fedora Core 3 server accessed from Ubuntu 5.10
    Breezy Badger workstation with eSVN 0.6.8 and svn command-line client version
    1.2.0.</p>'
- id: 71
  author: Jramak
  author_email: maseriyer@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0yNCAwNTo0MTo0NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yNCAwNDo0MTo0NyArMDEwMA==
  content: <p>wow, many thanks - Byung-chul Lee. It is a simple, elegant solution
    -- certainly saved a lot of head pounding! thanks again.</p>
- id: 72
  author: GDK
  author_email: happygdk@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNS0wOSAyMTo0MTo0NCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0wOSAyMDo0MTo0NCArMDEwMA==
  content: <p>Thanks for the NFS mount option solution.  Suddenly, I could no longer
    access repositories or create new ones across drives (but could still create locally).  Your
    solution saved the day.</p>
- id: 73
  author: Nicolas
  author_email: nick@hellonicolas.com
  author_url: http://www.hellonicolas.com
  date: !binary |-
    MjAwOC0wNS0yMCAxOTowODozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0yMCAxODowODozMyArMDEwMA==
  content: ! '<p>I am probably doing something wrong, but at our work we run the SVN
    server off a Windows Server machine (The best hardware for the job at the time),
    but I get that same error when I try to commit files when I work from a Mac. When
    I work from a PC I get no errors, only the Mac throws the "Can''t get exclusive
    ock" error. Any suggestions?</p>


    <p>(I wish Byung-chul Lee''s suggestion applied to me, but I don''t think it does)</p>'
- id: 74
  author: Cedric
  author_email: cedric.craze@pollux.com.br
  author_url: http://www.pollux.com.br
  date: !binary |-
    MjAwOC0wNS0yNyAxNDoyMzowOCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0yNyAxMzoyMzowOCArMDEwMA==
  content: ! '<p>I have the same issue than Nicolas. I recently bought a MacBook Air,
    and now develop PHP on it. I tried to use Eclipse with the PHP and SVN plugins
    and the SCPlugin which is the equivalent of the Tortoise SVN for Mac OS.

    In both cases I have the "Can''t get exclusive lock" error when trying to commit.

    Some suggestion?</p>'
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
