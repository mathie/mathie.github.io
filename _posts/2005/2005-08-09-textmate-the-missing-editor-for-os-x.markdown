---
layout: post
title: ! 'TextMate: The Missing Editor for OS X'
date: 2005-08-09 17:48:56 +01:00
categories:
- Geekery
---
I've spent today using <a href="http://macromates.com/" title="TextMate: The Missing Editor for OS X">TextMate</a> in anger for the first time.  I think I downloaded it quite a while back and gave it a five minute spin, but never used it in anger.  Today, after seeing it mentioned on this <a href="http://maczealots.com/articles/shareware/2005/" title="MacZealots - Top 10 Shareware Apps of 2005">top 10 shareware apps</a> list, I decided to give it a proper shot.  So I've been writing Python, Zope Page Templates and XHTML in it for the day.

I'm impressed.

It's going to take me a while to get used to -- those XEmacs shortcut keys are deeply ingrained in my fingers -- but I think it might be worth the effort.  All the features of XEmacs I use feel like they're probably there, I just haven't found them all yet.  The syntax highlighting works well and supports all the languages I use on a regular basis.  I like the 'project manager', which is basically a file listing from the root of your project, in a panel on the side of the editor window.  It does auto-completion (though I really want to bind it to M-/!) of arbitrary words, just like XEmacs (and no other editor I've seen).  I've already discovered some of the automation features I've always meant to figure out in XEmacs but never quite gotten around to -- templates and code snippets, for example.

It's just really easy and natural to use.  It integrates well with other command line applications (like being able to push the current buffer through a python script, then back in to the buffer again).  There's a command line program <code>tm_wait</code> which behaves in such a way that it can be used as <code>$EDITOR</code> (or <code>$VISUAL</code>) for writing CVS/Subversion commit messages, because it stays in the foreground 'til the file is edited and closed.

I need to read the manual, mostly to figure out what navigation keys I'm missing.  I'd miss things like M-f to move forward a word, M-b to move back a word, M-d to delete the word in front, the kind of thing that allows you to navigate the buffer quickly, more than one word at a time.  So far, I see that C-a and C-e work for start and end of line, but that's all...

But I shall definitely be persevering.
