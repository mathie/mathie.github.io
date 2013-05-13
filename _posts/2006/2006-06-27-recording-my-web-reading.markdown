---
layout: post
status: publish
published: true
title: Recording my web reading?
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-06-27 11:31:43.000000000 +01:00
categories:
- Geekery
- Web surfing
tags:
- aperture
- bookmarking
- Geekery
- reddit
- social-bookmarking
- Web surfing
- del.icio.us
comments:
- id: 502
  author: Schwuk
  author_email: schwuk@schwuk.com
  author_url: http://schwuk.com
  date: !binary |-
    MjAwNi0wNi0yNyAxMzowNjo0MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0yNyAxMjowNjo0MyArMDEwMA==
  content: ! '<p>I use a combination of del.icio.us and Google Notebook.</p>


    <p>Anything I read that I''ll want to read again, or I think others should read
    I tag with del.icio.us. In Firefox on all my machines I have a Live bookmark pointed
    at my del.icio.us RSS feed so I can access my ''bookmarks'' from any machine I
    work on.</p>


    <p>I also use del.icio.us to track pages I want to read later, but I''m not using
    any tags to do so. I tried using a Backpack page to track items, but I don''t
    like keeping the page open. I''m currently playing with Google Notebook to capture
    stuff I want to review and keeping del.icio.us for stuff I want to remember/recommend.</p>'
- id: 503
  author: Christian Romney
  author_email: xmlblog@gmail.com
  author_url: http://www.xml-blog.com
  date: !binary |-
    MjAwNi0wNi0yNyAxNTo1NjowNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0yNyAxNDo1NjowNiArMDEwMA==
  content: ! '<p>Mathie,

    Great write-up. Check out www.markaboo.com. We''re still in early stages, but
    we''ve got some innovative features like bookmarking files and user-created content
    (notes) in addition to urls. I really like your idea about saving stuff you''ve
    read. I''ve been thinking a LOT about this for months and I agree that an extension
    that acts as an agent is the way to go. I''d like to see it be configurable with
    whitelists and blacklists of sites to auto-capture and not auto-capture, with
    different tagging strategies (always use these tags on these sites vs. read meta
    tags vs. parse for context and make a guesstimate). Ideally, this content should
    be saved and searchable, preferably to an online service. This is the direction
    I plan to take markaboo in. Lastly, the project is open source (find the code
    on Rubyforge) so you''re welcome to lend us a hand!</p>


    <p>Cheers,

    Christian</p>'
- id: 504
  author: Kai Hendry
  author_email: hendry@iki.fi
  author_url: http://hendry.iki.fi
  date: !binary |-
    MjAwNi0wNi0yOCAwODowOToxNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0yOCAwNzowOToxNiArMDEwMA==
  content: ! '<p>I have been thinking of implementing my own one with web.py.</p>


    <p>I still haven''t quite figured out how to get all my bookmarks out of del.icio.us.
    Have you?</p>


    <p>I wonder if keyboard binds can be made to execute something like a del.icio.us
    post. Extension hacking looks scary.</p>'
- id: 505
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNi0yOCAwOTo0NDoyMSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0yOCAwODo0NDoyMSArMDEwMA==
  content: ! '<p>schwuk: I''ll check out Google Notebook.  It seems to have passed
    me by so far...</p>


    <p>christian: Thinking about it, I''m not so sure the auto-capture idea is that
    great.  Usually I want to capture what I''ve actually read, not the path I got
    there by (for example, an interesting article linked by one of the blogs I read,
    or finally drilling down to the documentation for something after hours of google
    searching).</p>


    <p>kai: Well, you can export your bookmarks into HTML with http://del.icio.us/settings/<code>$USER</code>/export
    .</p>'
- id: 506
  author: Ian Fieldhouse
  author_email: fieldy1973@mac.com
  author_url: http://www.wholewidget.com
  date: !binary |-
    MjAwNi0wNi0yOCAxNjoyMDoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNi0yOCAxNToyMDoyNiArMDEwMA==
  content: ! '<p>I used to use del.icio.us for all my bookmarking needs but migrated
    across to ma.gnolia [ http://ma.gnolia.com/ ] once it launched.</p>


    <p>This was for three main reasons:

    - ma.gnolia saves a copy of the page you bookmark so if the site dies you can
    still access the information

    - ma.gnolia allows you to bookmark more than just web pages as it supports the
    following protocols. http://, https://, feed://, ftp://, rtp://, rtsp://, mms://,
    itms://, webcal://, textmate://

    - purely for aesthetic reasons -- ma.gnolia looks lovely</p>


    <p>I also mark things that might be of interest to me -- but that I haven''t had
    time to read -- with a ''not-read'' tag so that I can quickly access some interesting
    reading material whenever I get a spare moment. These ''not-read'' items are accessed
    via a bookmark on my Safari bookmarks bar.</p>


    <p>Ma.gnolia, like del.icio.us, offers you a bookmarklet so that you can easily
    add items to you account.</p>'
---
In the dim and distant past, I was using [del.icio.us][], mostly as a way of keeping track of interesting sites and articles I've read.  Basically it was a mechanism for sharing bookmarks amongst the plethora of browsers and platforms I use -- rather than using the social components.  My use of it has tailed off, but I'm looking to start organising myself a little better again.

I'm looking for two components to my 'ideal' bookmarking solution:

* Mark interesting articles by tagging/categorising them so that I can find them again in the future.  This is more or less how I was using [del.icio.us][], though perhaps I could have done with being more judicious since I didn't then use the stock of bookmarks to retrieve items again.

* Record everything I've read.  Well, maybe not absolutely everything, but most things that I do read.  This one has to be *really* easy to use -- ideally something I can automate in Firefox in some way (ctrl-l marks it as "read and liked", ctrl-k marks it as "read and thought was utter tripe").

I'm reasonably happy with using [del.icio.us][] for the former (though I do wonder if any of the other social bookmarking services would offer anything different/better?).  I was having a wee look at [reddit](http://www.reddit.com/) for the latter, since I'd somehow inferred that it would be a good match, but their [reddiquette](http://reddit.com/help/reddiquette) says that I should look for dupes before posting something.  Ah, it's more of a social rating site like [digg](http://www.digg.com/) then...  So I wonder if I should be using [del.icio.us][] as my "I've read it" along with a very simple tag structure (@read, @toread, @like, @dislike) and use something else for the bookmarking?

I'll give you an example of where the latter is useful.  I know that, at some point during my blog reading in the past week, I read about customising the books that [Aperture](http://www.aperture.com/) creates.  I wish I could find it now, since Annabel was working on a wedding album book at the weekend, but I didn't, so I can't.  If I'd marked it as "I've read this", then I'd be able to find it again.  (And my browser's history isn't much good, because it could have been on one of two computers and I'd have to filter out all the rubbish, what with doing web development all day...)

So, what would you suggest?  Or are there better ways of tackling the plethora of material I read every day in such a way as to make interesting stuff easy to find in the future, and the "ooh, I *know* I read that somewhere" at all findable?

[del.icio.us]: http://del.icio.us/ "del.icio.us social bookmarking"
[rubaidh ltd]: http://www.rubaidh.com/ "Rubaidh Ltd -- Scottish for Ruby on Rails"
[ruby]: http://www.ruby-lang.org/ "Ruby programming language"
[rails]: http://www.rubyonrails.org/ "Ruby on Rails"
