---
layout: post
title: Using git to fix up other projects
date: 2008-03-29 12:54:40 +00:00
categories:
- Geekery
- Ruby and Rails
- Work
comments:
- id: 978
  author: Tom Lazar
  author_email: tom@tomster.org
  author_url: http://tomster.org
  date: !binary |-
    MjAwOC0wMy0yOSAxOTozMDowNSArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMy0yOSAxOTozMDowNSArMDAwMA==
  content: <p>very nice! thanks for taking the time and documenting this. one more
    reason to finally give git a try...</p>
- id: 979
  author: benr
  author_email: benr@cuddletech.com
  author_url: ''
  date: !binary |-
    MjAwOC0wMy0zMCAyMDo1MDo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wMy0zMCAyMDo1MDo1NyArMDEwMA==
  content: <p>Great walkthrough of the practicality of day-to-day tasks with Git or
    even Mercurial.  I hadn't thought to use it for such simplistic tasks, but can
    clearly see the benefits.   Thanks!</p>
- id: 980
  author: geshido
  author_email: geshido@gmail.com
  author_url: http://www.moinet.ru
  date: !binary |-
    MjAwOC0wMy0zMSAxNTo1Njo1MyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wMy0zMSAxNDo1Njo1MyArMDEwMA==
  content: ! '<p>Yes, git is very exciting thing. I have been using it for not so
    long time but I already see a bunch of advantages comparing to other scm systems
    like svn.

    But using git in some cases makes you to "switch" your mind away of cvs-like scm
    systems :)</p>


    <p>Thanks for the wolkthrough, "git merge --squash" -- nice thing, I didn''t know
    about this.</p>'
- id: 981
  author: K. Adam Christensen
  author_email: pope@shifteleven.com
  author_url: http://shifteleven.com
  date: !binary |-
    MjAwOC0wNi0yMCAwMTo1MDoxMCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNi0yMCAwMDo1MDoxMCArMDEwMA==
  content: ! '<p>So where can one find this patch?  I would like to add it to my copy
    so I can get it to work.</p>


    <p>Cheers</p>'
---
One of the huge wins for me with [git](http://git.or.cz/) is that it's *very* cheap to set up a repository, even for a small, transient task.  Here's a story of how I used git this morning.  I was having trouble installing the [oniguruma](http://oniguruma.rubyforge.org/) ruby gem on my laptop.  Oniguruma itself was installed on my Macbook Pro using [MacPorts](http://macports.org/) and so it was installed in `/opt/local`.  No amount of passing in `CPPFLAGS` and `LDFLAGS` was making it install correctly via `gem install oniguruma` so I figured I'd tool around with the package to see what was happening.

First thing I did was to unpack the offending gem somewhere:

    mathie@tullibardine:src$ gem unpack /Library/Ruby/Gems/1.8/cache/oniguruma-1.1.0.gem
    Unpacked gem: '/private/var/tmp/mathie/src/oniguruma-1.1.0'

then change into the directory and import the pristine contents into a brand new git repository:

    mathie@tullibardine:src$ cd oniguruma-1.1.0/
    mathie@tullibardine:oniguruma-1.1.0$ git init
    mathie@tullibardine:oniguruma-1.1.0$ git add .
    mathie@tullibardine:oniguruma-1.1.0$ git commit -m "Import pristine oniguruma 1.1.0 gem."
    Created initial commit 12dceaa: Import pristine oniguruma 1.1.0 gem.
     9 files changed, 2169 insertions(+), 0 deletions(-)
     [ ... ]

That way I know that any changes I make are going to be tracked.  This is particularly useful because, in hunting down the problem, I'm just as likely to poke at the wrong thing, then have to revert my changes and try something else.  Before we get started tracking down the problem though, I'm going to avoid some extra noise by creating a `.gitignore` which ignores the files I already know are going to be created.  I can figure out what's likely to be created at this stage by running some rake tasks and seeing what actually is created.  Let's just say I know already:

    mathie@tullibardine:oniguruma-1.1.0$ echo pkg > .gitignore
    mathie@tullibardine:oniguruma-1.1.0$ echo doc >> .gitignore
    mathie@tullibardine:oniguruma-1.1.0$ git add .gitignore
    mathie@tullibardine:oniguruma-1.1.0$ git commit -m "Ignore generated files."
    Created commit e78bff8: Ignore generated files.
     1 files changed, 2 insertions(+), 0 deletions(-)
     create mode 100644 .gitignore

So we're ignoring the `doc/` and `pkg/` directories.  I think we're now ready to start figuring out the problem.  Let's do that on a branch:

    mathie@tullibardine:oniguruma-1.1.0$ git checkout -b allow-gem-to-be-installed
    Switched to a new branch "allow-gem-to-be-installed"

Now I happen to know what will fix the problem &mdash; adding `dir_config('onig')` to `ext/extconf.rb` will allow us to specify at install time where it can find the oniguruma C library &mdash; so let's just fix it in our favourite editor:

    mathie@tullibardine:oniguruma-1.1.0$ mate .
    [ ... make and review the appropriate changes ... ]
    mathie@tullibardine:oniguruma-1.1.0$ git add History.txt ext/extconf.rb
    mathie@tullibardine:oniguruma-1.1.0$ git commit # with a detailed message
    Created commit 48afb3f: [ message ]
     2 files changed, 4 insertions(+), 0 deletions(-)

That's the change sorted.  Having said that, we haven't actually documented our change.  Let's update README.txt with some documentation on how to install with a non-standard oniguruma location:

    [ ... Edit README.txt in your favourite editor ... ]
    mathie@tullibardine:oniguruma-1.1.0$ git add README.txt
    mathie@tullibardine:oniguruma-1.1.0$ git commit # with a detailed message
    Created commit 22b003a: [ message ]
     1 files changed, 7 insertions(+), 1 deletions(-)

We've finished changing the code, but we really ought to give it a final test just to make sure it works:

    mathie@tullibardine:oniguruma-1.1.0$ rake gem
    (in /private/var/tmp/mathie/src/oniguruma-1.1.0)
      Successfully built RubyGem
      Name: oniguruma
      Version: 1.1.1
      File: oniguruma-1.1.1.gem
    mathie@tullibardine:oniguruma-1.1.0$ sudo gem install pkg/oniguruma-1.1.1.gem -- --with-onig-dir=/opt/local
    Building native extensions.  This could take a while...
    Successfully installed oniguruma-1.1.1

Now we've seen it works, we should produce a patch which we can submit to the package maintainers for them to apply to their code in whatever SCM they happen to be using (or as it turns out, in this case, there's a patch already in the bug tracker which has been ignored so far!).  We may have taken several commits and attempts to get the fix just right, as we did above, so the first thing to do is probably to flatten the changes back onto the master branch:

    mathie@tullibardine:oniguruma-1.1.0$ git checkout master
    Switched to branch "master"
    mathie@tullibardine:oniguruma-1.1.0$ git merge --squash allow-gem-to-be-installed
    Updating e78bff8..22b003a
    Fast forward
    Squash commit -- not updating HEAD
     History.txt    |    3 +++
     README.txt     |    8 +++++++-
     ext/extconf.rb |    1 +
     3 files changed, 11 insertions(+), 1 deletions(-)
    mathie@tullibardine:oniguruma-1.1.0$ git commit
    Created commit aa18a21: Allow non-default oniguruma library locations.
     3 files changed, 11 insertions(+), 1 deletions(-)

The `git commit` that is the last command there helpfully pops up in your editor with a pre-populated commit message containing the information from the commits on the branch.  You can choose to keep that message, add to it, or modify it in any way.  You should probably at least add a summary of the commit at the top.

So we're merged back into the `master` branch.  Finally we can produce the patch:

    mathie@tullibardine:oniguruma-1.1.0$ git format-patch HEAD~1
    0001-Allow-non-default-oniguruma-library-locations.patch

We can then take that patch file and email it to the maintainer or submit it to their package's bug tracking system.  If the maintainer doesn't mind, you can even fire the patch straight over to them with git:

    mathie@tullibardine:oniguruma-1.1.0$ git send-email 0001-Allow-non-default-oniguruma-library-locations.patch

It will interactively ask for your from address, the maintainer's email address and whether it should say it's `In-Reply-To` any particular message id.  It will then use sendmail to send the email, which appears to have just worked out of the box on Mac OS X Leopard.  Awesome. :-)
