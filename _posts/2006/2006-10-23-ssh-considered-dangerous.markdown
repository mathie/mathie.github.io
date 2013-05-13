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
comments:
- id: 637
  author: Mike Quin
  author_email: mike@elite.uk.com
  author_url: http://MikeQuin
  date: !binary |-
    MjAwNi0xMC0yMyAxNTozNjoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yMyAxNDozNjoyMiArMDEwMA==
  content: <p>Could have been worse, you could have typed 'shutdown' :)</p>
- id: 638
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0yMyAxNTo0MzoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yMyAxNDo0MzoyMiArMDEwMA==
  content: ! '<p>mike: Been there, done that, only it was brigadier (the primary NIS
    server for Tardis at the time) I accidentally shutdown instead of the web server
    I was decommissioning. :-)  That time it was an old spider serial console and
    a wyse terminal instead of ssh though...</p>'
- id: 639
  author: Colin
  author_email: lildood@gmail.com
  author_url: http://www.lildude.co.uk
  date: !binary |-
    MjAwNi0xMC0yMyAxNjoxNDowOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yMyAxNToxNDowOSArMDEwMA==
  content: <p>Heh heh heh. I've sat on the phone diagnosing a problem with a customer
    for hours when he suddenly realised he'd done the same thing.  Oh and I'd be interested
    to know more about how you've setup your home env with SVN.</p>
- id: 640
  author: Shot
  author_email: shot@hot.pl
  author_url: http://shot.pl/1/125/
  date: !binary |-
    MjAwNi0xMC0yMyAxNzowMzoyMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yMyAxNjowMzoyMCArMDEwMA==
  content: <p>I use differently-coloured prompts for different machines â€“ green
    for my laptop, yellow for my server, red for the uni and work servers I administer;
    my mind learned this pattern quickly and I almost never hesitate (I never administer
    the â€˜redâ€™ servers at the same time).</p>
- id: 641
  author: James Dickens
  author_email: jamesd.wi@gmail.com
  author_url: http://uadmin.blogspot.com
  date: !binary |-
    MjAwNi0xMC0yMyAxNzowODowMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yMyAxNjowODowMyArMDEwMA==
  content: <p>YES, I would love details on using svn for your home directory.</p>
- id: 642
  author: Jamey
  author_email: jcribbs@netpromi.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0yMyAxNzo1NTowMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yMyAxNjo1NTowMiArMDEwMA==
  content: <p>I'd also be interested in how you have your home directory set up in
    Subversion.  I have a similar need as I have a work desktop and a home desktop
    and the need to have all of my projects available on both.  Currently I have a
    usb hard drive and I just copy my "work" directory to the usb drive (when I can
    remember to do it), but your solution sounds much more elegant.</p>
- id: 643
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0xMC0yNSAxMDoyNjozOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNSAwOToyNjozOCArMDEwMA==
  content: <p><a href='http://kitenet.net/~joey/svnhome.html' rel="nofollow">This
    article ("Keeping your life in SVN")</a> by Joey Hess might be interesting to
    those of you looking for a SVNed homedir.</p>
- id: 644
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0yNSAxMDozMTo0NCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNSAwOTozMTo0NCArMDEwMA==
  content: ! '<p>brooonie: Yeah, it was Joey''s <a href="http://kitenet.net/~joey/cvshome.html"
    rel="nofollow">cvshome</a> article that (kind of) inspired me to migrate from
    using RCS on individual hosts to using CVS instead.  I do things quite differently
    though, so I <em>will</em> get around to writing it up at some point in the next
    few days.  It ain''t gonna be today though...</p>'
- id: 645
  author: John Turner
  author_email: john.turner@norgg.org
  author_url: http://http:/norgg.org
  date: !binary |-
    MjAwNi0xMC0yNSAxMDo0ODo1NCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNSAwOTo0ODo1NCArMDEwMA==
  content: ! '<p>So, as a step further from just having ''remote'' in red on your
    prompt, it would be interesting to colour the hostname in your prompt differently
    for each host(hash the hostname, map to a colour).  Possibly reserving your usual
    fg colour for localhost.</p>


    <p>My bash-fu isn''t really good enough to actually code this though...</p>'
- id: 646
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0yNSAxMTo0MTo1MCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNSAxMDo0MTo1MCArMDEwMA==
  content: ! "<p>John:  You git!  Here I am trying to get some work done and you go
    and challenge me to do something which is clearly more interesting, so I spend
    half an hour figuring out how to escape stuff correctly in the shell.  Here's
    an updated snippet:</p>\n\n<pre><code>PS1='\\u@\\h:\\W\\$ '\nif [ ! -z \"$SSH_CONNECTION\"
    ]; then\n    case ${TERM} in\n    xterm-color)\n        ruby_str='puts \"\\\\[\\\\033[01;#{(`hostname`.chomp.unpack(\"c*\").inject(0)
    { |sum,x| sum x } % 7)   31}m\\\\]\"'\n        hostcolor=$(ruby -e \"$ruby_str\")\n
    \       PS1=\"${hostcolor}${PS1}\\[\\033[00m\\]\"\n        ;;\n    *)\n        PS1=\"*remote*
    ${PS1}\"\n        ;;\n    esac\nfi\nexport PS1\n</code></pre>\n\n<p>The extra
    bits are that it'll do a bit of Ruby (you don't have to have bash-fu, you can
    call something else to do the hard work!) to sum the characters in the hostname
    and mod-7 the result (since there are 7 possible colours, assuming we don't want
    to futz with the background colour and don't want black text).</p>\n\n<p>It still
    won't futz with the prompt on localhost, and it will fall back to having *remote*
    in the prompt if we don't <em>know</em> the terminal will support color (that
    first case probably ought to have more variants in it, but it works for me).</p>\n\n<p>And,
    handily enough, that makes it red when I ssh into my home machine.</p>"
- id: 647
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0xMC0yNSAxODowNjo1MiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNSAxNzowNjo1MiArMDEwMA==
  content: <p>Note that he's also got a bunch of links to other people doing this
    (including a mailing list for discussing it) at the bottom of the SVN article.</p>
- id: 648
  author: Carra
  author_email: carra@bussa.com
  author_url: http://www.bussa.com
  date: !binary |-
    MjAwNi0xMS0wMSAwNzo0NzowNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0wMSAwNjo0NzowNiArMDAwMA==
  content: ! "<p>OK, I stumbled across this while looking for a rsync/ssh/unicode
    answer.</p>\n\n<p>I'm an old perl hack; I want to learn ruby, but am stuck with
    supporting NetWare/OES/MS Exchange at work.  Anyway, I hate seeing the big guns
    pulled out (perl, ruby, anything not in /bin :-) ) just for an easy problem.   So
    here's the corresponding bash script, running whole nanoseconds faster than it
    takes to load ruby from cache:</p>\n\n<pre><code>t=0; n=$RANDOM`uname -n`\nwhile
    [ x$n != x ]; do\n  c=${n:0:1}; n=${n:1};\n  case \"$c\" in\n    [[:alnum:]] )\n
    \     cc=$((36#$c))\n      t=$((t cc))\n      ;;\n  esac\ndone\nt=$((t%8))\n\nhostcolor=\"33[1;3${t}m\"\nPS1=\"${hostcolor}${PS1}[33[00m]\"\nunset
    t n c cc hostcolor\nexport PS1</code></pre>\n\n<p>I haven't actually placed that
    in the login script yet, but the above works just fine on the command line by
    placing it in a script (~/fixme) and running over and over:</p>\n\n<pre><code>export
    PS1='[\\u@\\h \\W]\\$ '; . fixme</code></pre>\n\n<p>NOTE:  DROP $RANDOM FROM:
    <code>n=$RANDOM`uname -n`;</code> OR THE COLORS WILL NEVER STABILIZE.</p>\n\n<p>NOTE:
    if you don't like dark gray, change <code>t=$((t%8));</code> to <code>t=$((t%8
    1));</code></p>\n\n<p>Thanks for a neat idea!</p>"
- id: 649
  author: anon.
  author_email: nick.p.doyle____is_hilarious@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNC0wMyAxMDowNToyMyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0wMyAwOTowNToyMyArMDEwMA==
  content: <p>(shouts from balcony) NERDS!!!!</p>
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
