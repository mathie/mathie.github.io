---
layout: post
status: publish
published: true
title: ! 'Howto: Using Switchtower with Ruby on Rails and DreamHost'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 229
wordpress_url: http://woss.name/2006/01/22/using-switchtower-with-ruby-on-rails-and-dreamhost/
date: 2006-01-22 19:31:57.000000000 +00:00
categories:
- Geekery
tags: []
comments:
- id: 273
  author: bp
  author_email: spideryoung@gmail.com
  author_url: http://www.benpickles.com
  date: !binary |-
    MjAwNi0wMS0yMiAyMzowOTo0NSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0yMiAyMjowOTo0NSArMDAwMA==
  content: ! '<p>thanks for the article, i''m itching to get switchtower rolling!<&#47;p>


    <p>Actually, "As of July 27th 2005, new Rails applications on Dreamhost will be
    set by default to run under its Production environment." - http:&#47;&#47;wiki.dreamhost.com&#47;index.php&#47;Ruby_on_Rails<&#47;p>'
- id: 274
  author: topfunky
  author_email: boss@topfunky.com
  author_url: http://nubyonrails.com/pages/shovel_dreamhost
  date: !binary |-
    MjAwNi0wMS0yMyAxNjoyOToyMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0yMyAxNToyOToyMCArMDAwMA==
  content: ! '<p>Great article.<&#47;p>


    <p>I put together a similar how-to and recipe that you can download. I''m very
    happy with Switchtower on Dreamhost and am converting all my sites to use it.<&#47;p>


    <p>http:&#47;&#47;nubyonrails.com&#47;pages&#47;shovel_dreamhost<&#47;p>'
- id: 275
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wMS0yMyAxNjo0MTozMSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0yMyAxNTo0MTozMSArMDAwMA==
  content: ! '<p>bp: Well spotted, I''ll update the article shortly.<&#47;p>


    <p>topfunky: Doh, if only I''d found that first instead of working it out for
    myself. :-)  Good idea on modifying the restart task, BTW.  I shall be incoporating
    that into my recipes.<&#47;p>'
- id: 276
  author: Bob
  author_email: bob@example.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMy0wNSAwMTo0OTo1NCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0wNSAwMDo0OTo1NCArMDAwMA==
  content: ! '<p>mathie,<&#47;p>


    <p>I''m confused.  How does your system accomplish a restart without modifying
    the restart task like topfunky did?<&#47;p>


    <p>My understanding is that be default SwitchTower uses Spinner&#47;Spawner&#47;Reaper.  But
    that won''t work given that it appears that on DreamHost Apache is responsible
    for starting the FCGI processes (or at least that''s the best I can figure out).  So
    something along the lines of sending signals to the FCGI processes would seem
    to be necessary.<&#47;p>'
- id: 277
  author: Bob
  author_email: bob@example.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMy0wNiAwMDoyNDo0MCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0wNSAyMzoyNDo0MCArMDAwMA==
  content: ! '<p>I think an important step was skipped in the description above.  When
    you create the domain, and point it to host from a particular directory, it will
    create that directory.  So DreamHost will create the "current" directory and the
    "public" directory beneath it.  The trouble is is that Switchtower will want to
    make "current" a symbolic link.  Therefore one should remove both "current" and
    "public" before deploying with Switchtower.<&#47;p>


    <p>Therefore the following two commands should be included in the process:<&#47;p>


    <p>ssh mathie@stories.woss.name rmdir &#47;home&#47;mathie&#47;Sites&#47;stories.woss.name&#47;current&#47;public<&#47;p>


    <p>ssh mathie@stories.woss.name rmdir &#47;home&#47;mathie&#47;Sites&#47;stories.woss.name&#47;current<&#47;p>


    <p>NOTE: In the commands replace "mathie" with your DreamHost user id, and "stories.woss.name"
    with your domain.  Also, if you do not use the "Sites" convention as described
    in this HOW-TO, then remove "Sites&#47;" from both commands.<&#47;p>


    <p>NOTE: I chose to use two rmdir commands rather than the rm alternative to protect
    the reader from typos that could result in the loss of a huge number of files.<&#47;p>'
- id: 278
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wMy0wNiAwOTo1OToyMiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0wNiAwODo1OToyMiArMDAwMA==
  content: ! '<p>Bob: Yes, I have now incorporated the replacement <code>:restart<&#47;code>
    task, as topfunky suggests.  I should update this article with all of the excellent
    suggestions you and others have made in the comments.  Thanks!<&#47;p>'
- id: 279
  author: Dara
  author_email: dsand1@verizon.net
  author_url: ''
  date: !binary |-
    MjAwNi0wMy0xNiAwMjoxMDozOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0xNiAwMToxMDozOSArMDAwMA==
  content: ! '<p>At the risk of sounding like a complete fool... I simply cannot get
    this to work. I''m about ready to pull my hair out because I''ve been fighting
    with Dreamhost all day trying to deploy my application with no dice.<&#47;p>


    <p>I see that dreamhost has the switchtower gem installed but whenever I try to
    execute:<&#47;p>


    <p>switchtower --apply-to .<&#47;p>


    <p>in my svn.myhostname.com root folder I simply get:

    -bash: switchtower: command not found<&#47;p>


    <p>I''m stuck... again.  What am I doing wrong?  Any help is appreciated.<&#47;p>


    <p>Dara<&#47;p>'
- id: 280
  author: flevour
  author_email: spam@flevour.net
  author_url: http://www.flevour.net
  date: !binary |-
    MjAwNi0wMy0yMCAxMDozODo0NSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMy0yMCAwOTozODo0NSArMDAwMA==
  content: <p>Historically, Capistrano was originally called SwitchTower. The name
    was changed in March 2006 in response to a trademark conflict.<&#47;p>
- id: 281
  author: mark
  author_email: mark12b@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wNC0xNyAwOToyMDowMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0xNyAwODoyMDowMiArMDEwMA==
  content: <p>I'm having the same problem as Dara -- the switchtower command doesn't
    work. Neither does cap -- and gem install capistrano results in permission denied.
    I don't understand...<&#47;p>
- id: 282
  author: Fingerprints of Casper Fabricius &raquo; Deploying Rails with Edge and Engines
    to Dreamhost using Capistrano
  author_email: ''
  author_url: http://casperfabricius.com/blog/2006/05/21/rails-on-dreamhost/
  date: !binary |-
    MjAwNi0wNS0yMSAyMTowMDoyMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNS0yMSAyMDowMDoyMSArMDEwMA==
  content: ! '<p>[...] Howto: Using Switchtower with Ruby on Rails and DreamHost [...]<&#47;p>'
- id: 283
  author: Bruno
  author_email: bruno@bopia.com
  author_url: ''
  date: !binary |-
    MjAwNi0wOS0xOCAyMDozMjo0NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0xOCAxOTozMjo0NyArMDEwMA==
  content: ! '<p>I get a error when running cap deploy:<&#47;p>


    <p>D:&#47;Program Files&#47;ruby&#47;lib&#47;ruby&#47;gems&#47;1.8&#47;gems&#47;capistrano-1.2.0&#47;lib&#47;capistrano&#47;scm&#47;subversion.rb:24:in
    `latest_revision'': Could not determine latest revision (RuntimeError)<&#47;p>


    <p>Does it matter that my source is under:

    http:&#47;&#47;svn.blablabl.com&#47;share&#47;projectname<&#47;p>


    <p>and not<&#47;p>


    <p>http:&#47;&#47;svn.blablabl.com&#47;share&#47;projectname&#47;trunk<&#47;p>'
- id: 284
  author: fred
  author_email: email_fb-divers@yahoo.fr
  author_url: http://blog.fbollon.net
  date: !binary |-
    MjAwNi0wOS0yOSAyMDo1Mjo0OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0yOSAxOTo1Mjo0OCArMDEwMA==
  content: ! '<p>I have the same issue

    rake aborted!

    Could not determine latest revision<&#47;p>


    <p>I run different OS with different version of capistrano

    under ubuntu and with capistrano-1.2.0 and under suse with a previous version
    of capistrano i don''t have this error<&#47;p>


    <p>if I specify the revison number in my deploy.rb with for example "set :revision,
    26" all it''s ok<&#47;p>


    <p>is it a konwn issue with capistrano-1.2.0 and dreamhost ?<&#47;p>'
- id: 285
  author: Brad
  author_email: brad.forsyth@rogers.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0wNCAwNzozODozNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0wNCAwNjozODozNCArMDEwMA==
  content: <p>This is a great help Graeme.  One of the problems that I have run into
    (and I believe others have based on the comments above) is that the permissions
    on Dreamhost seem to be messed up during the deploy.  In particular, the dispatch.fcgi
    does not get the execute (x) permissions necessary for operation.  I also noticed
    that other permissions seemed to be too liberal, i.e. the world has read permissions
    on way too much of the rails app.  I am assuming that there is a way in Capistrano
    to set the permissions. However, there must be a good 'default' setting for a
    project.  Have you come across any good references and what do you do regarding
    setting permission?  Thanks.<&#47;p>
- id: 286
  author: Untrained (and Derailed)
  author_email: ''
  author_url: http://www.josesierra.com/programming/howto_using_switchtower_with_r.html
  date: !binary |-
    MjAwNi0xMC0wNSAxNzozNTo0MCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0wNSAxNjozNTo0MCArMDEwMA==
  content: ! '<p><strong>Howto: Using Switchtower with Ruby on Rails and DreamHost...<&#47;strong><&#47;p>


    <p>Switchtower is now known as Capistrano (as of March ''06), but the article
    is still very useful for those that haven''t upgraded to the most recent version
    of rails, and shows an interesting evolution from Switchtower to Capistrano. More
    recent......<&#47;p>'
- id: 287
  author: Anthony Ettinger
  author_email: aettinger@sdsualumni.org
  author_url: http://anthony.ettinger.name
  date: !binary |-
    MjAwOC0wNi0wMSAyMDoxMTo0OSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNi0wMSAxOToxMTo0OSArMDEwMA==
  content: ! '<p>If you''re using a remote svn server, and svn+ssh:&#47;&#47; urls,
    then you may get a "Killed by signal 15" message.<&#47;p>


    <p>Changing :deploy_via, :export to :deploy_via, :copy should get around this.<&#47;p>'
---
Finally, I've decided to investigate using [Switchtower][st] to deploy [Ruby on
Rails][ror] applications. And, since my hosting company of choice is
[DreamHost][dh], I thought I'd share my recipe in case it was useful to others.

First things first, let's create the [Subversion][svn] repository. I'm actually
hosting my repositories over at [CVSDude][cvsdude] these days -- I got bored
waiting for DH to make an svn offering that people are clamouring for and they
offered me free space so long as I link to their site from my blog. Hence the
frog on the sidebar. Anyway, so I've created a brand new repository just for
this project, Stories, with the usual trunk, tags and branches layout. Create a
skeleton rails project in there, adding the necessary bits to the repository.
(Actually, maybe that's a future article, exactly how I setup my svn repository
for each new rails app.)

Let's configure things on the DreamHost control panel, since it'll potentially take a while for things to propagate there.  Head to `Domains` -- `Manage Domains` -- `Add new domain &#47; sub-domain` and create your new domain.  For this example, I'm going to create [`stories.woss.name`](http:&#47;&#47;stories.woss.name&#47;).  Make sure to enable FastCGI support and, instead of accepting the default directory it suggests, append `&#47;current&#47;public`.  ie the web directory in my case is:

    &#47;home&#47;mathie&#47;Sites&#47;stories.woss.name&#47;current&#47;public

(I keep all my web sites in the `Sites&#47;` directory for tidiness.)  I always select to either add or remove the `www` from the address so that there's one canonical name, but that's just a personal preference.  Add the domain and that bit's ready to go.

There's nothing terribly exciting about configuring the database.  Head to `Goodies` -- `MySQL` and create a new database.  I called the database `stories_production` ('cos somebody has already nicked `stories`!), on `db.stories.woss.name`.  Sorted.

OK, while DH's pigeons are whirring away creating our shiny new domains and databases, let's head back to the Rails app.  Edit `config&#47;database.yml` and put appropriate development and test databases for your local machine.  I use MySQL locally, since that's what I'll be deploying with on DreamHost.  The production database should be the details you set up a few moments ago on DreamHost.  You will also have to edit `config&#47;environment.rb` and uncomment the line:

    ENV['RAILS_ENV'] ||= 'production'

so that, when deployed, we default to the production environment.  This is because the `RAILS_ENV` isn't explicitly set elsewhere in the deployed environment.  The only other change we need to make to Rails itself is to modify the she-bang lines pointing to Ruby.  Most of them (all the ones in the `scripts&#47;` directory) are fine, but the ones in `public&#47;dispatch.*` are wrong.  Fix them up so they're `#!&#47;usr&#47;bin&#47;env ruby` and we'll be fine.

Finally, we need to tweak `public&#47;.htaccess` a little.  Change the RewriteRule for the dispatcher (near the bottom) to use the FCGI dispatcher instead:

    RewriteRule ^(.*)$ dispatch.fcgi [QSA,L]

and add in a couple of rules immediately after `RewriteEngine On` to display a maintenance page if it exists on the file system:

    RewriteCond %{DOCUMENT_ROOT}&#47;system&#47;maintenance.html -f
    RewriteCond %{SCRIPT_FILENAME} !maintenance.html
    RewriteRule ^.*$ &#47;system&#47;maintenance.html [L]

Commit your changes -- the next lot is to add Switchtower support itself.

To add switchtower support, run the following from your `RAILS_ROOT`:

    switchtower --apply-to .
    svn add config&#47;deploy.rb lib&#47;tasks&#47;switchtower.rake

Edit `config&#47;deploy.rb`, in particular setting the `:application` and `:repository` values correctly.  All of the roles should point to the same machine: your newly created web host.  `:deploy_to` should point to the top-level of the web directory you set up earlier (ie without the `current&#47;public` bit at the end).  Since we're running on a shared host, we don't want to be using `sudo` to restart things (it probably throws nasty warning things up in DreamHost's security logs!), we set `:restart_via` to `:run`).  In fact, my complete, not-commented-out deploy.rb consists of:

    set :application, "stories"
    set :repository, "http:&#47;&#47;svn1.cvsdude.com&#47;wossname&#47;#{application}&#47;trunk"
    role :web, "stories.woss.name"
    role :app, "stories.woss.name"
    role :db,  "stories.woss.name", :primary => true
    set :deploy_to, "&#47;home&#47;mathie&#47;Sites&#47;stories.woss.name"
    set :restart_via, :run
    set :checkout, "export"

Dead simple.  Commit that because we're ready to deploy!  To set up the hosting platform, run:

    rake remote_exec ACTION=setup

and every time you want to deploy a new version, run:

    rake deploy

and it magically works!  The functionality to enable and disable the site with `rake remote_exec ACTION=disable_web` and `rake remote_exec ACTION=enable_web` also works out of the box, if you happen to have completely screwed up the site you've just deployed. :-)

[st]: http:&#47;&#47;manuals.rubyonrails.com&#47;read&#47;book&#47;17 "Switchtower manual"
[ror]: http:&#47;&#47;www.rubyonrails.org&#47; "Ruby on Rails"
[dh]: http:&#47;&#47;www.dreamhost.com&#47;r.cgi?wossname
[svn]: http:&#47;&#47;subversion.tigris.org&#47;
[cvsdude]: http:&#47;&#47;cvsdude.org&#47;
