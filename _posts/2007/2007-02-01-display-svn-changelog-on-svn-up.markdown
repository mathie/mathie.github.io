---
layout: post
title: Display svn changelog on `svn up`
date: 2007-02-01 14:22:53 +00:00
categories:
- Geekery
- Python
- Ruby and Rails
- Solaris
tags:
- Geekery
- Python
- Ruby and Rails
- Solaris
---
I'm working on a project with a team of people.  And when I do an `svn up` after other people have committed stuff, it's handy to get an overview of what's changed while I'm in the context of getting the updates.  (I also get an email everytime something is committed, but reading that involves switching to a different context from my development environment.)  So I came up with the following bash functions:

    # Get the current revision of a repository
    svn_revision()
    {
      svn info $@ | awk '/^Revision:/ {print $2}'
    }

    # Does an svn up and then displays the changelog between your previous
    # version and what you just updated to.
    svn_up_and_log()
    {
      local old_revision=`svn_revision $@`
      local first_update=$((${old_revision} + 1))
      svn up -q $@
      if [ $(svn_revision $@) -gt ${old_revision} ]; then
        svn log -v -rHEAD:${first_update} $@
      else
        echo "No changes."
      fi
    }

Now, instead of typing `svn up` to get changes from others, I type `svn_up_and_log`.  If there are changes to incorporate, it spits out the changelog, noting which files have been changed.  If not, it just says 'No changes.'  Neat, huh?
