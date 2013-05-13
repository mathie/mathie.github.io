---
layout: post
status: publish
published: true
title: Harnessing Capistrano
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2007-05-18 00:24:11.000000000 +01:00
categories:
- Uncategorized
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconf
- RailsConf Europe
- railsconf07
- Ruby and Rails
comments:
- id: 811
  author: Taylor Singletary
  author_email: taylorsingletary@gmail.com
  author_url: http://realitytechnicians.com
  date: !binary |-
    MjAwNy0wNS0xOCAxNToyMjowMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0xOCAxNDoyMjowMyArMDEwMA==
  content: <p>This tutorial was great. I was pretty much able to knock out a whole
    Capfile for a project I'm working on, complete with observation and server manipulation
    tasks, over the course of the tutorial.  Engaging speaker. Good stuff.</p>
- id: 812
  author: Mark Imbriaco
  author_email: mark@37signals.com
  author_url: http://37signals.com/
  date: !binary |-
    MjAwNy0wNS0xOSAwMzoxMDoyOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0xOSAwMjoxMDoyOCArMDEwMA==
  content: <p>Nice writeup, Graeme.  We use runit at 37signals for process supervision.  I
    highly recommend using it over mongrel_cluster for managing individual Mongrel
    processes.  We've been using that approach with Highrise and it's been working
    great.</p>
- id: 813
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNS0xOSAxNzoxODoxNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0xOSAxNjoxODoxNCArMDEwMA==
  content: ! '<p>Mark: Thanks for the pointer to runit.  I''ve been using <a href="http://www.tildeslash.com/monit/"
    rel="nofollow">monit</a> lately to keep track of my mongrels, but I''m always
    on the lookout for better alternatives.</p>


    <p>I don''t suppose you''d like to share your capistrano customisations for integrating
    with runit?</p>'
- id: 814
  author: Mark Imbriaco
  author_email: mark@37signals.com
  author_url: http://37signals.com/
  date: !binary |-
    MjAwNy0wNS0xOSAxOToxMTo1OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0xOSAxODoxMTo1OSArMDEwMA==
  content: ! "<p>I actually have a script called 'mongrelctl' that stops/starts/restarts
    my Mongrels using the basic runit commands, and I just call that from Capistrano:</p>\n\n<p>%w(start
    stop status restart).each do |action|\n  desc \"#{action.capitalize} Mongrel\"\n
    \ task \"#{action}\", :roles =&gt; :app do\n    sudo \"#{current_path}/script/mongrelctl
    production #{action}; true\"\n  end\nend</p>\n\n<p>mongrelctl is really simple,
    the only reason it exists is to make it easier to manage production vs. staging
    environments:</p>\n\n!/bin/sh\n\n<p>cd /var/service/highrise-$1\nfor f in mongrel-*
    ; do\n  if [ $1 = 'staging' ]; then\n    sv $2 highrise-staging/$f\n  else\n    sv
    $2 highrise/$f\n  fi\ndone</p>\n\n<p>Hope that helps.</p>"
- id: 815
  author: Mark Imbriaco
  author_email: mark@37signals.com
  author_url: http://37signals.com/
  date: !binary |-
    MjAwNy0wNS0xOSAxOTo0MToyNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0xOSAxODo0MToyNCArMDEwMA==
  content: ! "<p>That mongrelctl script isn't quite right.\nThat mongrelctl I pasted
    isn't quite right.  Should look more like:</p>\n\n<pre>\n#!/bin/sh\n\nif [ $1
    = 'staging' ]; then\n  SVCDIR=/var/service/highrise-staging\nelse\n  SVCDIR=/var/service/highrise\nfi\n\ncd
    $SVCDIR\nfor f in mongrel-* ; do\n  if [ $1 = 'staging' ]; then\n    sv $2 highrise-staging/$f\n
    \ else\n    sv $2 highrise/$f\n  fi\ndone\n</pre>"
---
These are my notes from Jamis Buck's tutorial on Harnessing Capistrano, all in bullet form.

* Focus here is on Capistrano 2.

* Capistrano came from a need. Basecamp was running on one machine and scaling to a second machine made deployment painful.

* Adhoc monitoring -- for checking uptime, disk space, grep logs, status of db slaves -- on every server on the cluster.

* Server maintenance: package management, synchronising configuration files.

* 2.0 preview: `gem install -s http://gems.rubyonrails.com/ capistrano` but you must have the prerequisites installed first (net-ssh, net-sftp & highline).

* Requires a POSIX (*nix) target, ssh access & ssh keys (or identical passwords on all your servers).

* Capistrano config is now called 'Capfile', is a ruby DSL similar to Rake's DSL, but it's not the same.

* `set :gateway, 'internet.accessible.machine'` will allow you to talk to servers behind a gateway, so the actual app servers aren't necessarily directly accessible.

* `cap -T` (which used to be `cap show_tasks`) doesn't show tasks which don't have a description. So we can hide 'internal' tasks which are only called by other tasks.

* Use `cap invoke` to run arbitrary commands on remote systems. Doesn't even need a `Capfile` if you specify everything on the command line. For example `cap HOSTS="app1,app2" COMMAND="tail /var/log/syslog" SUDO=1 invoke`.

* For running multiple `cap invoke` commands sequentially, use `cap shell` instead because it will cache the connection.

* Capistrano 2 introduces namespaces. Woo! Syntax is the same as Rake.  Introduces default tasks for a namespace called 'default'. Eg, the `deploy` namespace has `deploy:default` which can be called by doing `cap deploy`.

* If `set` is passed a block, that block is lazily evaluated the first time it is asked for by calling the block. The result is then cached for future uses.

* `cap -s foo=bar` is equivalent to having `set :foo, "bar"` *after* all your recipes are loaded.  `cap -S foo=bar` does so *before* recipes are loaded.

* We have transactions. If a task fails, then the `on_rollback` handler is called for each of the executed tasks in reverse order. If the rollback handler fails, the whole world ends. Patches accepted!

* Capistrano overrides 'load' and provides similar semantics, but it searches the directories in the `load_paths` variable. `cap -f` will load a specified file, but then won't autoload the Capfile.

* By default, capistrano is very verbose (`-vvv`). You can shut it up with `-q`.

* Capistrano now has a "core team" with Mike Bailey & Ezra Z.

#### Deployment recipes

* Assumptions: using source code control, you're deploying a rails application, your production environment is all ready to go (dbs, web server, etc) and you're using standalone fastcgi listeners.

* `capify .` creates a minimal Capfile and a basic `config/deploy.rb`. The `Capfile` only loads the deployment recipes and the `config/deploy.rb`.

* The deployment recipes in cap 2 are now opt-in so that there's less noise for folks using it in non-deployment scenarios.

* Capistrano 2 can check for dependencies before deploying -- do the appropriate directories exist, is subversion installed? -- done with `cap deploy:check`. Some deps are local, some are remote. We can customise these. Wow, this is neat: `depend :remote, :gem, 'tzinfo', '>=0.3.3'`

* For fcgi listeners, still need `script/spin` to tell capistrano how to start up your app from cold. Can just call script/process/spawner with the appropriate args.

* 37Signals have started using process supervision (didn't specify whether it was init/svscan/runit) to keep an eye on their fcgi listeners. Recommends you get your app working before you start messing with it, 'cos it requires a bit more upfront configuration.

* Cap 2 introduces deployment strategies which encapsulates the mechanism by which the source code is acquired. Default is 'checkout' which will check out a copy from your scm repository. 'remote cache' sounds pretty useful to me, which uses the scm repository but caches what's checked out, so the checkout becomes `svn up` which should be a bit faster. Controlled by `set :deploy_via, :whatever`.

* Volunteers sought to write a CVS scm backend instead of just promising to. Or maybe nobody *really* uses CVS any longer. :)

#### Advanced Techniques

* In cap 1.4 we had single hook tasks before and after each task, eg `after_symlink`. Trouble was that third party libraries stomped over each other's `after_symlink`. Now we have `before :task, :do_stuff` and `after :task, :do_stuff`. Better still, these are just wrappers around the generic callback mechanism `on`. I guess `before` is `on :before, :do_stuff, :only => [ :task ]` or something like that?

* Nick the configuration for staging environments from the slides! Yeah, that looks pretty neat.

#### Upgrading to Cap 2.0

* With cap 1 & 2 installed, to use cap 1, do `cap _1.4.1_`.

* 3rd party extensions and libraries need to be rewritten. For example, `mongrel_cluster` ain't gonna work yet.

* Actor has disappeared and has been subsumed into the Configuration class.

* If you've overriden or extended tasks, you'll need to figure them in with namespaces. If you used `before_task` and `after_task` you should be mostly OK, though.

* Compat mode to aid the transition. Do `cap -Ff compat` or `load 'compat'` to load it. Mostly it's there to help you learn what the new namespaced task names are.

* `cap -Ff upgrade` gives you the `upgrade:revisions` task which will create `#{release_path}/REVISION` retrospectively for existing deployments.

* The `render` helper has disappeared.
