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
comments:
- id: 540
  author: albert ramstedt
  author_email: soma@home.se
  author_url: http://albert.delamednoll.se
  date: !binary |-
    MjAwNi0wNy0xMiAxOToyNToxOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0xMiAxODoyNToxOCArMDEwMA==
  content: ! '<p>IRB FTW!</p>


    <p>Haha, this makes the complete transition to ruby a breezer :P</p>'
- id: 541
  author: Andy
  author_email: woss@kintaro.cx
  author_url: ''
  date: !binary |-
    MjAwNi0wNy0xMyAxNzoxMjoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0xMyAxNjoxMjoyMiArMDEwMA==
  content: ! '<p>I got this error message</p>





    NoMethodError: undefined method `install_system_commands'' for Shell:Class


    <p>I just used the posted code from shell_from_irb.rb</p>'
- id: 542
  author: Andy
  author_email: woss@kintaro.cx
  author_url: ''
  date: !binary |-
    MjAwNi0wNy0xMyAxNzoxNzoyNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0xMyAxNjoxNzoyNyArMDEwMA==
  content: ! '<p>Ok, got it.</p>





    require ''shell'''
- id: 543
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNy0xMyAxNzoyMDo1OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0xMyAxNjoyMDo1OSArMDEwMA==
  content: ! '<p>Andy:  Ah, oops, I forgot to include that bit (I''ve got <code>require
    ''shell''</code> way further up my <code>~/.irbrc</code>).  I''ve fixed the copy
    here now, too.  Thanks!</p>'
- id: 544
  author: Per Melin
  author_email: one.woss@melin.net
  author_url: ''
  date: !binary |-
    MjAwNi0wNy0xNiAxMDozNzozNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0xNiAwOTozNzozNyArMDEwMA==
  content: ! '<p>Apart from tab completion, I can''t see what this does that you can''t
    do with backticks?</p>


    <p>Take your example with modified svn files. This does the same thing:</p>


    <p><code>`svn stat`.grep(/^M/) { |x| x.sub(/^M */, '''').chomp }</code></p>'
- id: 545
  author: dam
  author_email: dam@cosinux.org
  author_url: http://blog.cosinux.org/
  date: !binary |-
    MjAwNi0wNy0xNyAxMTo0NjozOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0xNyAxMDo0NjozOCArMDEwMA==
  content: <p>you could simply use ^Z to pause the job and use the shell then getting
    back to it with %n</p>
- id: 546
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNy0xNyAxMTo1NDoxMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNy0xNyAxMDo1NDoxMCArMDEwMA==
  content: ! '<p>Per, Dam: Picky, picky.  My solution is sooo much prettier. :-)</p>'
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
