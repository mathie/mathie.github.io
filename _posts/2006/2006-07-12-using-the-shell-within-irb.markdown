---
layout: post
title: Using the shell within irb
date: 2006-07-12 11:50:39 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- bash
- Geekery
- irb
- rails
- ruby
- Ruby and Rails
- ruby-on-rails
- shell
---
A couple of weeks ago, I had a little diversion, playing around with the shell bits and pieces in Ruby core.  And it sounded like it could be quite handy for when you're in that IRB session and don't want to quit/reload (or switch to another terminal, I guess).  So I added a few widgets to by `~/.irbrc` to make it work well for me.  You can find the relevant parts in [`shell_from_irb.rb`](/dist/shell_from_irb.rb).  Probably the easiest thing to do is copy and paste the contents into your own `~/.irbrc`.

So, how do you use it?  From the irb shell:

    irb(main):003:0> shell.echo 'hello world'
    => hello world

Or, something more useful which will return you an array of files you've modified since your last commit to subversion:

    irb(main):016:0> shell.svn(:stat).grep(/^M/).collect do |line|
    irb(main):017:1*     line.gsub(/^M */, '').chomp
    irb(main):018:1>   end
    => ["app/helpers/application_helper.rb",
         "app/controllers/application.rb",
         "config/photography_config.rb",
         "public/javascripts/lightbox.js",
         "public/stylesheets/lightbox.css"]

Oh, and since all the shell commands in your path are now effectively methods, if you have readline and completion switched on, you can do what you'd usually do in the shell:

    irb(main):019:0> shell.sv[tab][tab]
    shell.svk             shell.svnadmin        shell.svnserve
    shell.svm             shell.svndiffshim_py  shell.svnversion
    shell.svn             shell.svndumpfilter
    shell.svn_backup_sh   shell.svnlook
    irb(main):019:0> shell.sv

I've made a few modifications to the default behaviour of the `shell` widget in Ruby core.  I'm installing the commands with no prefix, so that it's easier to use.  By default, however, that would override the implementation of a function with the latest one found.  The default behaviour of the shell is to use the *first* match, so I've fiddled things so that it also uses the first match.  This has the added benefit that it doesn't override `Shell`'s internal implemtation of things like `pwd` which otherwise causes the thing to completely break (since it's also *used* internally).  That's what `FixAddDelegateCommandToShell` does, for those of you playing along at home.

I've also allowed you to specify arguments to system commands as symbols.  It feels more natural to me to type `shell.svn :stat` than `shell.svn 'stat'`.  I guess YMMV.

Lastly, it's all wrapped up in a singleton widget which lazily loads the shell functionality.  That makes it available any time, but pushes the time hit (where it scans `$PATH` and creates all those methods for each command) to the first use, rather than when you launch `irb`.

So there you go.  I've found it useful, so I thought I'd share.
