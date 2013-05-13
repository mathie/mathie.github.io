---
layout: post
status: publish
published: true
title: No gnus is bad gnus
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-09-20 14:20:37.000000000 +01:00
categories:
- Geekery
tags:
- carbon-xemacs
- Geekery
- gnus
- home-directory
- subversion
- usenet
- xemacs
comments:
- id: 594
  author: Boyd Adamson
  author_email: boyd-adamson@usa.net
  author_url: ''
  date: !binary |-
    MjAwNi0wOS0yMSAwMjowNDo1OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0yMSAwMTowNDo1OSArMDEwMA==
  content: <p>Another alternative for emacs on the mac is Aquamacs (http://aquamacs.org/)
    It's a kind of frankensteinesque program that's pat mac and part emacs. Seems
    to suit my muscle memory well.</p>
- id: 595
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wOS0yMSAwOToxNTo0OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0yMSAwODoxNTo0OCArMDEwMA==
  content: ! '<p>Boyd: From your recommendation, I gave it a quick shot.  It does
    just feel, well, wrong.  My muscle memory seems to be able to do one or t''other,
    but not mix both.  I had the following conversation with zippy:</p>


    > hello

    >

    > > How do you do?  What brings you to see me?

    >

    > I don''t think I really like aquamacs.

    >

    > > Why do you say you do not think you really like aquamacs?

    >

    > It feels, well, wrong.

    >

    > > Is it because of your plans that you say it feels well wrong?

    >

    > Well, my main reason for investigating it was to run Gnus, but there have been
    so many things that jarred so far (C-j didn''t execute a line of elisp in the
    scratch buffer for example) that I don''t think I can continue to use it.

    >

    > > Is it because there have been so many things that jarred so far c j didn''t
    execute a line of elisp in the scratch buffer for example that you do not think
    you can continue to use it that you came to me?

    >

    > Well, yes.  I was looking at the help menu and I thought that some psychoanalysis
    might help.

    >

    > > Does it bother you that some psychoanalysis might help?

    >

    > No, not really, because I don''t think it will.

    >

    > > When did you first know that you do not think it will?

    >

    > About two sentences ago when you misparsed C-j...

    >

    > > What happened when I misparsed c j?

    >

    > You gave away the fact that you''re not quite like all the other \*macs.

    >

    > > Is the fact that I am not quite like all the other \*macs the real reason?

    >

    > Oh, yes.  You just somehow feel wrong.  Like the bastard lovechild of Mac OS
    X and Emacs.  I bet you''ll disappear when I do apple-w instead of C-x k...

    >

    > > What would happen if you do apple w instead of c x k?

    >

    > You''ll die, die for ever and be eternally wiped from my hard drive! Mwuahahaha!

    >

    > > This is not a healthy way of thinking.

    >

    > Buh-byee. :-)'
- id: 596
  author: david reitter
  author_email: david.reitter@gmail.com
  author_url: http://www.david-reitter.com
  date: !binary |-
    MjAwNi0xMi0wNiAxOToyMDozMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNiAxODoyMDozMyArMDAwMA==
  content: ! '<p>i liked this!</p>


    <p>(Scratch buffers in Aquamacs are in text-mode by default because I expect that
    its users will mostly write something contentful rather than keeping themselves
    busy hacking elisp.

    M-x lisp-interaction-mode would have solved your problem!</p>'
---
As an addendum to my post about [Keeping track of mailing lists](http://woss.name/2006/09/19/keeping-track-of-mailing-lists/), despite everybody's suggestions about using Gmail, I've decided to try using [Gnus](http://gnus.org/) in [XEmacs](http://www.xemacs.org/) again.  Last night, I built 21.5.26 with [Andrew Choi's carbon patches](http://members.shaw.ca/akochoi-xemacs/), installed the latest sumo packages and tried it out.

My fingers strangely still remember a number of the shortcuts, so it wasn't an altogether painful experience.  In fact, my fingers still remember a bunch of the stuff I'd set up myself, that I miss, so I'm now digging through my subversion-backed home directory's history to find my old gnus configuration.

I feel it helps to have a separate application for mailing lists, because it is very much a separate task (or context?) to reading email.  It's something I only want to do once or twice a day, when I've got a little downtime or am looking for a distraction.

Incidentally, I previously [built a binary for XEmacs](http://woss.name/2005/08/04/build-of-carbon-xemacs-21520-beta-2-for-mac-os-x-104/) and now that I'm using it again, I'd be happy to knock a more up to date one together if there was any demand for such a thing?

One other thing.  I don't suppose anybody around here still happens to run a usenet news server these days?  I'd like access to `comp.lang.ruby` and I'd quite like to reacquaint myself with another couple of groups I used to hang around in...

**update** And this is why one keeps one's home directory in subversion:

    mathie@Lagavulin:mathie$ svn log -v|less

to discover in which revision I removed the XEmacs configuration, then:

    mathie@Lagavulin:mathie$ svn merge -r1358:1357 .

and it restores all my config.  OK, so there are a couple of conflicts to resolve, but that was really quite painless. :-)
