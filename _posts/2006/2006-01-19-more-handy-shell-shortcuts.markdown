---
layout: post
status: publish
published: true
title: More handy shell shortcuts
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 222
wordpress_url: http://woss.name/2006/01/19/more-handy-shell-shortcuts/
date: 2006-01-19 14:42:55.000000000 +00:00
categories:
- Geekery
tags: []
comments:
- id: 258
  author: Thaha
  author_email: muhd.thaha@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNC0xOCAxMjozMjowMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNC0xOCAxMTozMjowMCArMDEwMA==
  content: ! '<p>Useful one. Actually, I wanted to do this, but because of lack of
    knowledge in shell, I couldn''t.

    Thanks a lot.<&#47;p>'
---
Regularly when I'm working at the shell, I realise that I'm repeating the same sequence of commands over and over.  Or that doing something a little bit extra would be *so* useful.  Last night's effort was two-fold; one to run a command and give my Terminal window a title (useful for long-running applications where it helps to remember which iTerm tab they're hiding under) and one to start a Rails application locally:

    # General thing to set the window title to something or other before running
    # a program.  Intended for daemons that don't background so you know which
    # iTerm tab they are running in.
    title()
    {
        echo -ne "\033]0;$1\007"
        shift
        $@
    }

    # Just like my zoperun() shortcut, let's have one for Rails apps.  The only
    # real bonus is that it sets the window title to something that identifies it.
    railsrun()
    {
        (
            set -e
            local instance
            if [ ! -z "$1" ]; then
                cd $1
            fi
            instance=$(basename $(pwd))
            title "Rails: ${instance}" script&#47;server
        )
    }

Pretty easy really.  But now I can launch a new shell and type `railsrun ~&#47;src&#47;mine&#47;svn&#47;library` which will start up the `library` application and set the window title appropriately.  Neat.  Ish.
