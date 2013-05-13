---
layout: post
title: ! 'Howto: Using Switchtower with Ruby on Rails and DreamHost'
date: 2006-01-22 19:31:57 +00:00
categories:
- Geekery
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

Let's configure things on the DreamHost control panel, since it'll potentially take a while for things to propagate there.  Head to `Domains` -- `Manage Domains` -- `Add new domain / sub-domain` and create your new domain.  For this example, I'm going to create [`stories.woss.name`](http://stories.woss.name/).  Make sure to enable FastCGI support and, instead of accepting the default directory it suggests, append `/current/public`.  ie the web directory in my case is:

    /home/mathie/Sites/stories.woss.name/current/public

(I keep all my web sites in the `Sites/` directory for tidiness.)  I always select to either add or remove the `www` from the address so that there's one canonical name, but that's just a personal preference.  Add the domain and that bit's ready to go.

There's nothing terribly exciting about configuring the database.  Head to `Goodies` -- `MySQL` and create a new database.  I called the database `stories_production` ('cos somebody has already nicked `stories`!), on `db.stories.woss.name`.  Sorted.

OK, while DH's pigeons are whirring away creating our shiny new domains and databases, let's head back to the Rails app.  Edit `config/database.yml` and put appropriate development and test databases for your local machine.  I use MySQL locally, since that's what I'll be deploying with on DreamHost.  The production database should be the details you set up a few moments ago on DreamHost.  You will also have to edit `config/environment.rb` and uncomment the line:

    ENV['RAILS_ENV'] ||= 'production'

so that, when deployed, we default to the production environment.  This is because the `RAILS_ENV` isn't explicitly set elsewhere in the deployed environment.  The only other change we need to make to Rails itself is to modify the she-bang lines pointing to Ruby.  Most of them (all the ones in the `scripts/` directory) are fine, but the ones in `public/dispatch.*` are wrong.  Fix them up so they're `#!/usr/bin/env ruby` and we'll be fine.

Finally, we need to tweak `public/.htaccess` a little.  Change the RewriteRule for the dispatcher (near the bottom) to use the FCGI dispatcher instead:

    RewriteRule ^(.*)$ dispatch.fcgi [QSA,L]

and add in a couple of rules immediately after `RewriteEngine On` to display a maintenance page if it exists on the file system:

    RewriteCond %{DOCUMENT_ROOT}/system/maintenance.html -f
    RewriteCond %{SCRIPT_FILENAME} !maintenance.html
    RewriteRule ^.*$ /system/maintenance.html [L]

Commit your changes -- the next lot is to add Switchtower support itself.

To add switchtower support, run the following from your `RAILS_ROOT`:

    switchtower --apply-to .
    svn add config/deploy.rb lib/tasks/switchtower.rake

Edit `config/deploy.rb`, in particular setting the `:application` and `:repository` values correctly.  All of the roles should point to the same machine: your newly created web host.  `:deploy_to` should point to the top-level of the web directory you set up earlier (ie without the `current/public` bit at the end).  Since we're running on a shared host, we don't want to be using `sudo` to restart things (it probably throws nasty warning things up in DreamHost's security logs!), we set `:restart_via` to `:run`).  In fact, my complete, not-commented-out deploy.rb consists of:

    set :application, "stories"
    set :repository, "http://svn1.cvsdude.com/wossname/#{application}/trunk"
    role :web, "stories.woss.name"
    role :app, "stories.woss.name"
    role :db,  "stories.woss.name", :primary => true
    set :deploy_to, "/home/mathie/Sites/stories.woss.name"
    set :restart_via, :run
    set :checkout, "export"

Dead simple.  Commit that because we're ready to deploy!  To set up the hosting platform, run:

    rake remote_exec ACTION=setup

and every time you want to deploy a new version, run:

    rake deploy

and it magically works!  The functionality to enable and disable the site with `rake remote_exec ACTION=disable_web` and `rake remote_exec ACTION=enable_web` also works out of the box, if you happen to have completely screwed up the site you've just deployed. :-)

[st]: http://manuals.rubyonrails.com/read/book/17 "Switchtower manual"
[ror]: http://www.rubyonrails.org/ "Ruby on Rails"
[dh]: http://www.dreamhost.com/r.cgi?wossname
[svn]: http://subversion.tigris.org/
[cvsdude]: http://cvsdude.org/
