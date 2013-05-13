---
layout: post
status: publish
published: true
title: Coming back to git-svn
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 484
wordpress_url: http://woss.name/?p=484
date: 2008-04-25 10:41:09.000000000 +01:00
categories:
- Geekery
- Software Configuration Management
tags: []
comments:
- id: 1013
  author: Joe
  author_email: joeharris76@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNC0yNSAxMToyNjowNCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0yNSAxMDoyNjowNCArMDEwMA==
  content: <p>What's with the partial feeds? I'm switching to Fav.or.it so I'll be
    dumping all partials. {if your bothered...}</p>
- id: 1014
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwOC0wNC0yNSAxMTo1Nzo0MiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0yNSAxMDo1Nzo0MiArMDEwMA==
  content: ! '<p>@Joe I''m syndicated in lots and lots of places, and I''d quite like
    to drive traffic in to my site.  Of course, it''s not just a ploy to generate
    ad revenue or anything. :-)</p>


    <p>Really, I just get a warm fuzzy glow when I read my Feedburner/Analytics stats
    and see how many people actually care enough to read my articles that they follow
    the link to the full article.</p>'
- id: 1015
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwOC0wNC0yNSAyMDo0MzowMSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0yNSAxOTo0MzowMSArMDEwMA==
  content: ! '<p>The major win with git-svn in my limited use is that it lets you
    work with git in remote patch queue mode when your data source is svn - it''s
    just the same flow as if you were checking in tarballs by hand and maintaining
    patch queues on top of them, with automated stuff for getting the "tarball" from
    svn.</p>


    <p>FWIW I very rarely follow partial RSS feeds at all; partial posts on planets
    are a particular annoyance when they have automated breaks since they tend to
    leave something incoherent on the planet which isn''t so easy to ignore. If you''re
    going to do partial feeds I''d suggest paying attention to the slug that gets
    posted and ensuring that it''s a coherent teaser article in itself and that it''s
    obvious that the article continues elsewhere (I know <em>one</em> person who does
    this well).</p>'
- id: 1016
  author: Joe Fiorini
  author_email: joe@faithfulgeek.org
  author_url: http://www.faithfulgeek.org
  date: !binary |-
    MjAwOC0xMC0zMSAxNzoyOToyMCArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0zMSAxNjoyOToyMCArMDAwMA==
  content: <p>I've been using git-svn for about a month now at work. It is SO frustrating
    when I try committing changes and have to svn rebase first. I'm constantly resolving
    merge conflicts, even in files I've never touched. Have you had a lot of merge
    conflict problems? Are you using it in a team or by yourself?</p>
---
When I first started with git, like most folks, I suspect, I came from a
subversion background. And most of the repositories I interacted with on a
daily basis were subversion repositories which weren't going to change any
time soon. To be honest, I didn't get a great impression of git and git-svn
from that experience.

What really convinced me git was great was actually using it natively without
the bridging layer at all. And git-svn still left a bit of a bad taste in my
mouth so I've been avoiding it ever since. (I talk like an old timer here --
I've been using git full time for less than a month still -- but you would
have to prise git from my cold, dead, paws.)

I've just started working on a project for a lovely new client, extending
their existing Rails application to have the usual shopping cart bits and
bobs. They're pretty entrenched with Subversion still and have no intention of
changing any time soon. So I figured this was the time to revisit git-svn and
see if I could make it work better for me. *And it does.* It seems to be that
you have to have the *"git mentality"* already sussed in your brain for
git-svn to make sense. And once you do, you're sorted.

So if you've tried git-svn before your transition, and didn't like it, come
back again later after you've used git natively for a while. It will feel more
natural eventually.

Oh, and check back in the next couple of days for an example of my workflow
with git-svn, comparing it to native git remote operations, to see what I
mean.
