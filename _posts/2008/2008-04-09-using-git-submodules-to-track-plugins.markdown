---
layout: post
status: publish
published: true
title: Using git submodules to track plugins
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 476
wordpress_url: http://woss.name/?p=476
date: 2008-04-09 13:20:02.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- git
- rails
- ruby
- submodules
- vendor rails
comments:
- id: 982
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwOC0wNC0wOSAxMzozMDozOSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0wOSAxMjozMDozOSArMDEwMA==
  content: ! '<p>Instead of using git-pull it''s better practice to do distinct fetch
    and merge stages with something like:</p>


    <pre>

    git remote update origin

    git merge origin/master

    </pre>


    <p>especially if you''ve got a long-term remote like here. This keeps the remote
    data up to date and is more explicit about what''s going on and makes it easier
    to handle things if something goes wrong in the merge stage (like hideous conflicts).
    It also lets you do things like inspect the changes you''re about to merge in
    prior to doing so which can be useful if you''re being careful.</p>'
- id: 983
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwOC0wNC0wOSAxMzozNDoyNSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0wOSAxMjozNDoyNSArMDEwMA==
  content: <p>@Mark Thanks for the suggestion!  I wrote that sequence of commands
    down when you were doing your talk on git, then promptly lost the bit of paper
    I'd written it down on.  I'll update the post itself in a few minutes...</p>
- id: 984
  author: François Beausoleil
  author_email: francois@teksol.info
  author_url: http://blog.teksol.info/
  date: !binary |-
    MjAwOC0wNC0wOSAxNjo0MzozNyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0wOSAxNTo0MzozNyArMDEwMA==
  content: ! '<p>Graeme, I''m working on Piston to allow it to work using both Subversion
    and Git remote repositories and working copies.  The work isn''t complete, but
    it is possible to import repositories at the moment, and it seems to work quite
    well.  Actually, the more people try what will become Piston 2, the stabler it
    will be.</p>


    <p>Thanks !</p>'
- id: 985
  author: rachunkowosc
  author_email: sbobrowski@wp.pl
  author_url: http://www.rachunkowosc-zarzadcza.pl
  date: !binary |-
    MjAwOC0wNC0wOSAyMDo0MDowMyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0wOSAxOTo0MDowMyArMDEwMA==
  content: ! '<p>Hello,

    You promote rails and ruby, so why do you use wordpress engine to blogging?</p>'
- id: 986
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwOC0wNC0xMCAxNDoxMToxMSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xMCAxMzoxMToxMSArMDEwMA==
  content: <p>@François Good to know that you're working on Piston 2 incorporating
    git functionality too!  I'll take a look at it in the next few days.  I tried
    out braid a while back, but couldn't really get the hang of it, particularly when
    it kept throwing exceptions all over the place...</p>
- id: 987
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwOC0wNC0xMSAxMjowNTozNSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xMSAxMTowNTozNSArMDEwMA==
  content: <p>@rachunkowosc I use the best tool for the job.  Wordpress happens to
    be somewhat awesome, and none of the Rails blogging tools come close.  And I was
    using WordPress when Rails was still a twinkle in David's eye.</p>
- id: 988
  author: Thomas Ritz
  author_email: thomas@galaxy-ritz.de
  author_url: http://blog.galaxy-ritz.de
  date: !binary |-
    MjAwOC0wNC0xMiAwODozNzoxMyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xMiAwNzozNzoxMyArMDEwMA==
  content: ! '<p>Great post.</p>


    <p>I think the command listings are missing a few pieces:</p>


    <p>After touch log/.gitignore

    and before git commit -m "Import Rails skeleton."

    there should be git add .</p>


    <p>After you committed the rspec submodule you should have pushed that to github.
    Otherwise the following git clone from github doesn''t have the changes.</p>'
- id: 989
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwOC0wNC0xMiAwOTo0MDozNiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xMiAwODo0MDozNiArMDEwMA==
  content: <p>@Thomas Good catches.  I've updated the post now.  Thanks!</p>
- id: 990
  author: Tim Harper
  author_email: timcharper@gmail.com
  author_url: http://tim.theenchanter.com/
  date: !binary |-
    MjAwOC0wNC0yNCAyMDoyNDowOSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0yNCAxOToyNDowOSArMDEwMA==
  content: ! '<p>Great write-up Mathie.</p>


    <p>Submodule support in git is fantastic - I love the fact that it stores the
    revision your project is using.  I suppose you could do that with svn:externals
    and point your external to a tag... but this is so much cooler</p>


    <p>The interface for git submodules is a bit warty, at the time.  One thing that
    I run into is when you switch branches, merge, or pull, git doesn''t automatically
    update your submodules for you.  If the branch you switch to or merge from contains
    a different pointer, the submodule will stay at the same version.  When you do
    a status, it will show that your submodule version has been modified.  This is
    simply not the case - it just happens that the switch/merge isn''t complete.</p>


    <p>I suppose this is a feature to prevent you from accidently losing any commits
    you may have made while not on a branch.</p>


    <p>That said - you should probably get in the habit of running "git submodule
    update" each time you merge, pull, or checkout another branche.</p>


    <p>Submodule support has been added recently to the Git textmate bundle, if you
    use TextMate it may assist you in the interface warts of git dealing with submodules.  It
    detects if the project is using submodules, and if so, issues the init and update
    command, ensuring that your submodules are always on the correct version.</p>


    <p>(if I am wrong in my logic and there is a better way, please, contact me :)
    )</p>'
- id: 991
  author: fred
  author_email: fred.the.master@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNS0wNSAyMTowODo1MCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0wNSAyMDowODo1MCArMDEwMA==
  content: ! '<p>This is a GREAT tutorial !

    Thank you so much.</p>'
- id: 992
  author: Mark Dodwell
  author_email: seo@mkdynamic.co.uk
  author_url: http://www.mkdynamic.co.uk
  date: !binary |-
    MjAwOC0wNS0yMiAyMDoyNzo1MyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0yMiAxOToyNzo1MyArMDEwMA==
  content: <p>When you checkout another branch which doesn't contain those submodules
    it doesn't remove those files (even if you run git submodule update) -- is there
    a way around this does anyone know?</p>
- id: 993
  author: Jef
  author_email: jeff@animikii.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNy0yMyAwNjo1NDozMCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNy0yMyAwNTo1NDozMCArMDEwMA==
  content: <p>What if you in that submodule, you only want a specific folder and not
    necessarily the entire git repo?</p>
---
Since the core Ruby on Rails team is finally actually moving to git, and a
whole slew of other projects are following in their wake, now seems like a
good time to write up my experiences with using git sub-modules to track
external dependencies. Back in the world of Subversion, I had been using
[Piston](http://piston.rubyforge.org/) to track external dependencies. This
allowed me to import third party dependencies from their subversion repository
into my own application's repository, keep track of specific versions and even
make my own local changes.

We can do the same sort of stuff, really easily, with git. For some reason,
though, until I tried it, I couldn't quite get my head around it (and we'll go
into the reason why later on). Since Rails hasn't actually moved to git (yet,
I'll update this page when it does), we'll use the RSpec plugins for a
concrete example. So, let's get started. First we'll create a new Rails
application and create a git repository for it. (I'm going to whizz through
this bit -- if you want more detail, check out Craig's introduction on
[Getting Started with Rails 2.0](http://barkingiguana.com/2008/03/24/getting-started-with-rails-20).)

    mathie@tullibardine:src$ rails books
      create [ ... ]
    mathie@tullibardine:src$ cd books
    mathie@tullibardine:books$ git init
    Initialized empty Git repository in .git/
    mathie@tullibardine:books$ cat > .gitignore
    log/*.log
    db/*.sqlite3
    tmp/**/*
    doc/api
    doc/app
    doc/plugins
    mathie@tullibardine:books$ touch log/.gitignore
    mathie@tullibardine:books$ git add .
    mathie@tullibardine:books$ git commit -m "Import Rails skeleton."
    Created initial commit 07c3d38: Import Rails skeleton.
     44 files changed, 8345 insertions(+), 0 deletions(-)
     [ ... ]

So we've now got a local git repository with our sample Rails application.
We've done the usual dance of ignoring a pile of files, and making sure it
does track the `log` directory.  Sweet.

Now let's publish our repository up to [GitHub](http://www.github.com/) so
that we can share our hard work with others. This is not strictly necessary
for the submodule support, but it will allow me to demonstrate something
useful later. First of all, create the project in GitHub (still in private
beta, BTW, but it should be available shortly -- in the meantime, if you want
an invite, get in touch). I've created mine here:
<http://github.com/mathie/books/tree/master> though I won't guarantee that
hanging around forever.

Once we've done that, we follow the instructions that GitHub kindly provides for an existing repository:

    mathie@tullibardine:books$ git remote add origin git@github.com:mathie/books.git
    mathie@tullibardine:books$ git push origin master
    Counting objects: 61, done.
    Compressing objects: 100% (54/54), done.
    Writing objects: 100% (61/61), 72.97 KiB, done.
    Total 61 (delta 14), reused 0 (delta 0)
    refs/heads/master: 0000000000000000000000000000000000000000 -> 07c3d38d4caef7c9c694e267add23210d89f5ffc
    To git@github.com:mathie/books.git
     * [new branch]      master -> master

So we now have our repository up on GitHub. My next step is usually to verify
that pulling the repository back down works OK and work from that instead:

    mathie@tullibardine:books$ cd ..
    mathie@tullibardine:src$ mv books books-pre-push
    mathie@tullibardine:src$ git clone git@github.com:mathie/books.git
    Initialized empty Git repository in /Users/mathie/tmp/src/books/.git/
    remote: Generating pack...
    remote: Done counting 61 objects.
    remote: Deltifying 61 objects...
    remote:  100% (61/61) remote: done
    remote: Total 61 (delta 14), reused 0 (delta 0)
    Receiving objects: 100% (61/61), 72.71 KiB | 43 KiB/s, done.
    Resolving deltas: 100% (14/14), done.
    mathie@tullibardine:src$ cd books

Awesome. Right, now we're done with the boring bits, we can get to creating
submodules to follow external dependencies. There are two scenarios here. One
is where you're just tracking a remote repository that you're unlikely to
change. Let's cover that first because it's the simplest scenario. First
figure out the public clone URL of the remote repository. For RSpec itself,
the clone URL is `git://github.com/dchelimsky/rspec.git`. Let's add that as a
submodule in our repository stored in `vendor/plugins/rspec`:

    mathie@tullibardine:books$ git submodule add git://github.com/dchelimsky/rspec.git vendor/plugins/rspec
    Initialized empty Git repository in /Users/mathie/tmp/src/books/vendor/plugins/rspec/.git/
    remote: Generating pack...
    remote: Counting objects: 26728
    remote: Done counting 46266 objects.
    remote: Deltifying 46266 objects...
    remote:  100% (46266/46266) done
    remote: Total 46266 (delta 33095), reused 46266 (delta 33095)
    Receiving objects: 100% (46266/46266), 5.92 MiB | 26 KiB/s, done.
    Resolving deltas: 100% (33095/33095), done.

Now, if we do a `git status`:

    mathie@tullibardine:books$ git status
    # On branch master
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #	new file:   .gitmodules
    #	new file:   vendor/plugins/rspec
    #

we see that there are a couple of (already staged) changes. We can look at the
staged changes by running `git diff --cached`:

    mathie@tullibardine:books$ git diff --cached
    diff --git a/.gitmodules b/.gitmodules
    new file mode 100644
    index 0000000..51b1311
    --- /dev/null
    +++ b/.gitmodules
    @@ -0,0 +1,3 @@
    +[submodule "vendor/plugins/rspec"]
    +       path = vendor/plugins/rspec
    +       url = git://github.com/dchelimsky/rspec.git
    diff --git a/vendor/plugins/rspec b/vendor/plugins/rspec
    new file mode 160000
    index 0000000..3eb65c0
    --- /dev/null
    +++ b/vendor/plugins/rspec
    @@ -0,0 +1 @@
    +Subproject commit 3eb65c0c35269cf3bda4e537aa1dfdb83c9eff48

So, what's happened? It has created a file in the root of our project called
`.gitmodules` which contains information on what the remote repository's URL
is and what local path we're storing it under. It also represents the
submodule itself in the repository as a file containing one line: the commit
ID of the commit that you're currently tracking.

Let's commit that and push it upstream to share out work:

    mathie@tullibardine:books$ git commit -m "Import the RSpec plugin's current HEAD as a submodule."
    Created commit 6867d25: Import the RSpec plugin's current HEAD as a submodule.
    [ ... ]
    mathie@tullibardine:books$ git push origin master

Before we get interesting, let's cover one last basic; checking out a
repository with submodules. So we'll blow away that repository and pull it
from scratch again:

    mathie@tullibardine:books$ cd ..
    mathie@tullibardine:src$ rm -rf books

And clone a fresh copy:

    mathie@tullibardine:src$ git clone git@github.com:mathie/books.git
    [ ... ]
    mathie@tullibardine:src$ cd books

But if you have a look around in the `vendor/plugins` directory, you'll see
that the rspec plugin directory is empty! What happened to the plugin we
imported?! Before we can actually use our repository, we have to initialise
and update all the submodules. That's achieved with:

    mathie@tullibardine:books$ git submodule init
    Submodule 'vendor/plugins/rspec' (git://github.com/dchelimsky/rspec.git) registered for path 'vendor/plugins/rspec'
    mathie@tullibardine:books$ git submodule update
    Initialized empty Git repository in /Users/mathie/tmp/src/books/vendor/plugins/rspec/.git/
    [ ... ]

You only need to do the `init` the first time you do a fresh checkout or when
somebody else adds a new submodule. The `update` only has to be done the first
time you do a fresh checkout or when somebody else changes the version of a
submodule you are tracking.

So we've covered how to pull in a submodule initially, and we've covered what
you'll need to do when you check out a repository. Let's cover something more
interesting. When you add a submodule to your repository, you are adding *the
state the repository was in at the time you added it*. This is not like the
default behaviour of `svn:externals` where it will track the latest revision
at the time. With git, you are tracking the state of the tree *at the
particular commit you added as a submodule*. I've said that three times now,
because it's important. :-)

On the other hand, sometimes you *are* going to want to track a more recent
revision. How do you do that? Well, just the same as we do with another git
repository (because this is a fully fledged git repository!):

    mathie@tullibardine:books$ cd vendor/plugins/rspec/
    mathie@tullibardine:rspec$ git remote update
    Updating origin
    mathie@tullibardine:rspec$ git merge origin/master
    Already up-to-date.

(Unfortunately, I'm writing this in realtime and there were no changes to pull since I started writing it!)  That will pull the latest version of RSpec from github and update your local repository.  Once you've done that, change back into the root of your project and do a git stat:

    mathie@tullibardine:rspec$ cd ../../..
    mathie@tullibardine:books$ git stat
    # On branch master
    # Changed but not updated:
    #   (use "git add <file>..." to update what will be committed)
    #
    #	modified:   vendor/plugins/rspec
    #
    no changes added to commit (use "git add" and/or "git commit -a")

You'll see that the main git module knows that the submodule is now pointing
to a different commit. We can stage that, commit it and push it upstream to
share the fact that we're following a new version of RSpec:

    mathie@tullibardine:books$ git commit -a -m "Follow the newest revision of RSpec."
    Created commit 9374e2d: Follow the newest revision of RSpec.
     1 files changed, 1 insertions(+), 1 deletions(-)
    mathie@tullibardine:books$ git push
    [ ... ]

Sometimes we don't want to follow the bleeding edge of a plugin; but instead
follow a particular tag, or even pull a particular revision. The case for
following a tag would be to do:

    mathie@tullibardine:books$ cd vendor/plugins/rspec/
    mathie@tullibardine:rspec$ git co release-1.1.3

and then stage, commit & push. (This example won't work because there isn't a
tag called `release-1.1.3` on the rspec tree, but you get the idea.) If we
wanted to follow a particular revision, just do `git log` to find the
appropriate commit id and supply that commit id. Say we've decided we want to
drop back to the following commit:

    commit eefc5c3cea3e97733eee08c02fa28fe686c34113
    Author: Pat Maddox <pat.maddox@gmail.com>
    Date:   Sat Apr 5 20:14:24 2008 -0700

        Deprecation warnings for specs that assume auto-inclusion of modules
        Closes lighthouse ticket #326 (patch from scott taylor)

because all the rest of them beyond that are broken in some horrible way.
Let's do that:

    mathie@tullibardine:books$ cd vendor/plugins/rspec/
    mathie@tullibardine:rspec$ git co eefc5c3cea3e97733eee08c02fa28fe686c34113

then stage, commit and push as usual.

While I promised at the start of the article I would cover the second use case
with piston -- making and tracking your own changes to an upstream repository
-- I lied. This article is long enough as it is, and I'll cover that topic as
a separate post in a couple of days.
