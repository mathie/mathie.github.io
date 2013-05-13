---
layout: post
status: publish
published: true
title: ! 'RailsConf Europe 2006: First Plenary -- DHH'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 313
wordpress_url: http://woss.name/2006/09/30/railsconf-europe-2006-first-plenary-dhh/
date: 2006-09-30 16:37:02.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- rails
- railsconf
- railsconfeurope
- Ruby and Rails
- rubyonrails
comments:
- id: 598
  author: Taylor Singletary
  author_email: taylorsingletary@gmail.com
  author_url: http://www.realitytechnicians.com
  date: !binary |-
    MjAwNi0wOS0zMCAyMTowMDozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOS0zMCAyMDowMDozMyArMDEwMA==
  content: <p>I've been trying to develop a REST-implementation strategy on an application
    I'm developing, but can't seem to get my head around how best to tie all of these
    things together, regarding how best to create wizard-like functionality (should
    every "commit" of data simply be calls out to your own RESTful API?) and handling
    relationships of data (like Saving but a Product and its Image, at the same time)
    .. so far little documentation I've seen expands on how to create and maintain
    relationships between data..  One example I have found of this kind of documentation
    is to create models that aren't tied to ActiveRecord, and have its save methods
    perform the multi-model sequence of savings. Any thoughts on this "big picture"
    stuff?</p>
- id: 599
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0wMSAxMTo0NToxMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0wMSAxMDo0NToxMSArMDEwMA==
  content: ! '<p>Taylor: I''m afraid I haven''t actually played with the RESTful stuff
    at all myself.  Yet.  I''ve an application that''s due to be deployed in the next
    week or so and, once it''s out there, my next task will be to clean things up
    (yeah, that''s probably the wrong way round, but I''m running to a tight deadline!).  One
    of those tasks is to make the controllers more RESTful, and I''ll be tackling
    some of the issues you''re talking about.</p>'
---
> This is the first in a series of articles of me writing up my notes from RailsConf Europe 2006.  They are all first drafts, probably technically inaccurate and slanderously misquoting people.  Let me know and I'll fix them.  You can follow this series of posts by looking at articles in the [RailsConf Europe](/index.php?s=RailsConf+Europe+2006) category.

Exciting news: Rails 1.2 is nearly ready for release. A release candidate
should be up on gems.rubyonrails.org by now. New features include:

* The dependency system has been changed and is apparently now more coherent.
  One useful outcome is that modules will now reload too when they change in
  development.

* The routing code has been rewritten. Speaking from the perspective of
  somebody who's tried to work through the existing routing code, I say "yay!"

* Restful stuff for the controllers.

* A deprecation system. And anything that's marked as deprecated in 1.2 will
  be removed in 2.0. Very opinionated, but a really good idea IMHO.

The next release after 1.2 will be 2.0. 1.1 was about getting ActiveRecord
'right' and imposing conventions so that people all use their models in a
consistent manner. 1.2 is doing the same to the controller. 2.0 will be
tackling the view.

##### Simply Restful

Nice URLs and full use of HTTP verbs turned out to be a minor feature of the
simply restful work. The main feature was that controllers now have a
convention imposed upon them, meaning they will all look the same (or at least
similar) and developers can focus on more important things.

There's going to be a new scaffold (don't know if it's landed yet, but DHH did
demo) in 1.2 which uses the new restful style. It still looks butt-ugly, but
that's the point! Scaffolds are just that, a quick starting place for getting
in data. You're meant to customise, or completely replace them as you develop
a site. `script/generate resources_scaffold` will generate a controller, model
and migration for you, and add a resource map to `config/routes.rb`.

The scaffolding code also uses `respond_to` and will generate XML out of the
box. In addition to the current `respond_to` behaviour where it looks at the
HTTP Accept: header, it will interpret extensions as wanting a particular
type. For example, asking for <http://localhost/posts.xml> will call the
`index` action on `PostController` and `respond_to` will indicate that you're
looking for an XML response.

There are unresolved decisions with respect to the restful controllers. In
particular, what should the convention be for searching? A separate action? Or
parameters passed to the `index` action?

##### Active Resource

It's just like ActiveRecord, except it uses an HTTP backend, talking to
another web service. If you follow the restful conventions on your controllers
in the application providing the data, then you'll get this functionality *for
free*. It was extracted from 37Signals' desire to have their applications
interact with each other, and with other internal admin apps. Active Resource
will not ship in the 1.2 core, but will be available as a plugin. CDBaby.com
are already using it in production and 37Signals will be shortly.

##### Simply Helpful

This was a completely new one to me. Simply Helpful is all about adding
conventions, and cleaning up, the view. It's not designed to get the yellow
fade technique on every site in the world ever. (Like they need help making
that happen!) A lot of the work is about DRYing up the repetition in views.
For example, a `div` showing a post might look somethingg along the lines of:

    <div id="post_<%= @post.id %>" class="post">
      ...
    </div>

It's a common idiom because you'll want to style your post with CSS (hence the
class) and you might want to manipulate the post with JS (hence the id). So
how about we DRY that up:

    <% div_for @post %>
      ...
    <% end %>

That way the view code looks cleaner and it can be more about the model again.
There are new conventions for partials too:

    <% render :partial => @company %>

which is equivalent to:

    <% render :partial => 'company/company', :object => @company %>

in current code. It certainly makes code more readable and imposes more
conventions on naming of partials. There are similar improvements for
rendering collections and forms. This code already works, is available as the
`simply_helpful` plugin and is being used by 37Signals in their new Sunrise
product. It does rely on code in edge (well, 1.2 when it's released) Rails,
though. It will be part of the core in 2.0.

##### My opinion

Just a random thing I picked up from all of these things: It seems that the
convention we're being told to adopt tends towards more of a 1:1 mapping
between controllers and models. This isn't a bad thing, but it's not something
I'd considered to be the case before.
