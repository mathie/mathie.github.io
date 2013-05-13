---
layout: post
title: ssh considered dangerous
date: 2006-10-23 14:50:06 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
---
(Or maybe the title should be 'mathie considered too dumb to code today'.)

A bit of background:  I have a very rigourous setup for my home directory, so every host I work with feels about the same.  This comes from having my home directory stored in a subversion repository and checked out on multiple hosts (which is a story it turns out I've never told here -- comment if you'd like details on how it's set up).  So, on every host I'm working with, there is the directory `~/src/rubaidh/svn` which contains checked out copies of the projects I'm working on for [Rubaidh](http://www.rubaidh.com/).  Usually there will be the same projects both on my laptop and my desktop at home.

So, I'm working away today and I'm having this really weird error.  I can't log into a rails application I'm developing.  I think "ah, I have been fiddling around with the auth system, testing the password changing/resetting feature, maybe I changed it to something I can't remember.  So I fire up `script/console` and reset it to something known.  But I still can't log in.  So I'm tracing through the code to find out what's broken, putting in breakpoints, wondering why I'm not able to log in.  Yeah, `params` has the right data, but `User.authenticate` is returning `nil`.  It works fine when I execute exactly the same call in `script/console`!  Why?!?

OK, from the background, you've probably already guessed the problem.  The web server for my development was running on my laptop, but the window I happened to be typing stuff into at the time was an ssh session to my desktop computer at home...  No wonder it wasn't working.

While I've been writing up my morning's adventures, I've had a cunning plan.  What I need is something obvious to tell me that I'm not on my local system.  I do have the hostname in the prompt but, perhaps slightly shortsightedly, my desktop and laptop have similar looking names (laphroaig and lagavulin) when quickly glanced.  So now I have an addition to my environment:

    # Set the prompt to normal if we're on the localhost, put 'remote' in
    # red if we're ssh'd to somewhere else.
    PS1='\u@\h:\W\$ '
    if [ ! -z "$SSH_CONNECTION" ]; then
        case ${TERM} in
        xterm-color)
            PS1="\[\033[01;31m\]remote\[\033[00m\] ${PS1}"
            ;;
        *)
            PS1="*remote* ${PS1}"
            ;;
        esac
    fi
    export PS1

That way, when I'm logged into a remote machine through ssh, on every line of my prompt I'll see <span style="color: red;"><strong>remote</strong></span>, reminding me I'm on a remote machine.  It's still not perfect -- chances are I'll still ignore it sometimes, and I won't see it if I'm in an app rather than the shell -- but it's better.

**Update**: See [this comment](http://woss.name/2006/10/23/ssh-considered-dangerous/#comment-12764) for a tweaked version which will (potentially -- we've only got 7 colours to work with!) colour your prompt in different colours for different hosts.
