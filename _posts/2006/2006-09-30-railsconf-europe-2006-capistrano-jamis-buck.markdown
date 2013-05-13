---
layout: post
status: publish
published: true
title: ! 'RailsConf Europe 2006: Capistrano - Jamis Buck'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 315
wordpress_url: http://woss.name/2006/09/30/railsconf-europe-2006-capistrano-jamis-buck/
date: 2006-09-30 16:56:38.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
comments: []
---
> This is the third in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](&#47;index.php?s=RailsConf+Europe+2006)
> category.

Jamis was keen to point out that capistrano is not just for deploying rails
applications. In fact, it's not just for deployment. That's a very constrained
view, it can do so much more. It really is a generic system for controlling
and monitoring things happening on multiple remote servers.

Version 1.2 has just been released and it has lots of cool new features. You
can pass in additional environment variables to:

* Constrain the hosts that a recipe&#47;command will run on (HOSTS).

* Constrain a command to a particular set of roles (ROLES).

* Run an arbitrary command on the remote systems (COMMAND=`cmd`). You can
  specify whether it should use sudo to elevate privileges too (SUDO=0|1).

Of course, you can mix and match these as you like. If you happen to set up a
`HOSTS=` environment, there's not even a need to have a cap configuration
file. Imagine:

    HOSTS=this.site.com,web2.0isbeta.com SUDO=1 CMD="rm -rf &#47;" cap invoke

Neat? Insane? He did mention a caveat: be *very* careful what you type!

Another improvement in 1.2 is that connections to remote machines will happen
in parallel instead of one after the other. This makes life much faster when
you're dealing with a dozen machine. Another caveat: previously `setup`,
`update_code`, etc were only run on the app, db & web roles; now they are run
on every role. If there's a role you definitely don't want code deployed onto,
you have to configure that explicitly.

One question brought up from the audience was about the use of environment
variables to control capistrano instead of command line switches. Jamis'
argument was that it was easier (env vars are like global variables
apparently). If somebody wants to submit a patch, though, it would be more
than welcome.
