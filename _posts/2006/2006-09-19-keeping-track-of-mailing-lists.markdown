---
layout: post
status: publish
published: true
title: Keeping track of mailing lists?
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-09-19 13:40:59.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- Geekery
- Ruby and Rails
- Work
comments:
- id: 581
  author: James Stewart
  author_email: james@jystewart.net
  author_url: http://jystewart.net/process/
  date: !binary |-
    MjAwNi0wOS0xOSAxNDo0NDo1NSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0xOSAxMzo0NDo1NSArMDEwMA==
  content: ! '<p>I have the rails list going into my gmail account and then pick it
    up using POP with Apple Mail and filter it into a local folder. I work primarily
    from my laptop, so that works pretty well, but I also have the option of using
    the gmail web interface if I wanted.</p>


    <p>Of course, that doesn''t help with actually getting through that volume of
    mail, but it does let me use multiple computers so long as I''m not too worried
    about keeping them truly in sync, and leaves gmail as an archive. I''m thinking
    about shifting all my other email lists over to that system too.</p>'
- id: 582
  author: Michael Biven
  author_email: michael.biven@gmail.com
  author_url: http://biven.org
  date: !binary |-
    MjAwNi0wOS0xOSAxNTo0MzoxMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0xOSAxNDo0MzoxMSArMDEwMA==
  content: <p>Like James, I have any lists that I'm on sent to my gmail account and
    then use the rss feed for different "labels" to view them in the feed reader of
    my choice.</p>
- id: 583
  author: Kevin Ansfield
  author_email: kev@digitalblueprint.co.uk
  author_url: http://www.digitalblueprint.co.uk
  date: !binary |-
    MjAwNi0wOS0yMCAxMToyNjo0OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0yMCAxMDoyNjo0OCArMDEwMA==
  content: ! '<p>I use the same technique as Michael. I have all my lists sent to
    my gmail and filtered into the relevant labels. Most of the lists I am on are
    fairly low volume though so I mostly use gmail to keep up with them and have them
    in my Firefox Sage RSS reader that I keep in a sidebar constantly.</p>


    <p>Something that helps with the Sage reader above is Google Browser Sync, I install
    that on all the computers i use regularly so any bookmarks i make for the sage
    reader are automatically synchronized.</p>'
- id: 584
  author: No gnus is bad gnus at Notes from a messy desk
  author_email: ''
  author_url: http://woss.name/2006/09/20/no-gnus-is-bad-gnus/
  date: !binary |-
    MjAwNi0wOS0yMSAwODo0MzowNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0yMSAwNzo0MzowNSArMDEwMA==
  content: <p>[...] As an addendum to my post about Keeping track of mailing lists,
    despite everybody&#8217;s suggestions about using Gmail, I&#8217;ve decided to
    try using Gnus in XEmacs again. Last night, I built 21.5.26 with Andrew Choi&#8217;s
    carbon patches, installed the latest sumo packages and tried it out. [...]</p>
- id: 585
  author: Nate Aune
  author_email: natea@jazkarta.com
  author_url: http://www.jazkarta.com
  date: !binary |-
    MjAwNi0xMC0xMSAyMDo1MDoxOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0xMSAxOTo1MDoxOSArMDEwMA==
  content: <p>Why not use Mozilla Thunderbird for reading newsgroups? It's free, it's
    cross-platform and while not perfect, it seems to do a reasonably good job for
    me.</p>
---
OK, so one of the things I got out of the Rails Conference (and in particular was mentioned in DHH's `Keynote::Rant`) is that I'd like to get more actively involved in the Rails community.  Of course, I read lots of blogs already and have a place in my workflow for that, but something I've been missing for a while is how to keep up with and interact with mailing lists.

Currently, I can't have them go straight into my inbox.  That way would just lie madness.  So I filtering them off into their own folder.  There are two problems there:  the folder is local (and I use two computers for mail on a regular basis) so it gets fragmented; and if I'm busy I wind up ignoring it until there are 1,500 messages in there and the only way to deal with that volume (to me) is `option-a, delete`.

I could go back to various other solutions involving server-side filtering (which relies on a good IMAP implementation both sides to be notified of updates to non-INBOX folders, and to do offline synchronisation) and pushing each mailing list into its own mailbox, but that's kind of missing the point.  I actually want to deal with email which is addressed to **me** in my mail application, not general list traffic.  It's a context thing.  So I want to find another application I'm comfortable with for dealing with mailing list traffic.

Unfortunately, so far I've found nothing which fits the bill.  I guess there's no easy way of having a second instance of Mail.app with a different set of accounts (it's easy enough to arrange another account for mailing list mail).  So it's a case of looking at other applications, which boils down to three options:

* Another mail client.
* A usenet news client, using gmane.
* An RSS client, again using gmane.

I have been concentrating my efforts on finding a usenet client for Mac OS X.  There doesn't appear to be one which doesn't suck.  The foremost usenet client for Mac OS X seems to be [Unison](http://www.panic.com/unison/) and I've tried it out a few times.  I tried to like it, honestly.  But it feels more like it's designed for l33t war3z kiddies than for actually carrying on a conversation.  It's MIME decoding skills aren't great, particularly with respect to character sets.

I could go back to [XEmacs](http://xemacs.org/) with [Gnus](http://gnus.org/) which I used for *many* years.  In fact, back then, whichever operating system I happened to be using (Linux, Solaris), just happened to be a host OS for my XEmacs -- I lived in there.  But I've been spoiled by pretty widgets from Cocoa, and the limited interaction would make life slightly less pleasant.  Also, I've finally mapped my fingers to the Mac shortcuts which makes my life faster in a text editor.  I wouldn't want to confuse the poor digits again.

So.  How do you read mailing lists?  How do you efficiently take part in mailing lists while still Getting Things Done?
