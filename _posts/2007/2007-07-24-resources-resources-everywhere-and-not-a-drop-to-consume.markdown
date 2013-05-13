---
layout: post
status: publish
published: true
title: Resources, resources everywhere (and not a drop to consume?)
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 457
wordpress_url: http://woss.name/2007/07/24/resources-resources-everywhere-and-not-a-drop-to-consume/
date: 2007-07-24 15:47:02.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
comments:
- id: 942
  author: Ryan Bates
  author_email: ryan@railscasts.com
  author_url: http://railscasts.com
  date: !binary |-
    MjAwNy0wNy0yNCAxNjo0NTo1MiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yNCAxNTo0NTo1MiArMDEwMA==
  content: ! '<p>I think it comes down to the interface. If the current WidgetsController
    index action looks very similar to the users widgets list, then I would stick
    with nested resources approach which uses the WidgetsController index action.
    If they differ significantly, than this can lead to a lot of "if" conditions.</p>


    <p>Many times I want the interface to be very specific about the user - kind of
    a user profile page which happens to list the widgets. In that case I think the
    UsersController "show" action is suitable (assuming it''s not already used).</p>


    <p>Other than that, I don''t know of a good solution. I''m intrigued by the UserWidgetsController
    approach. This seems like the proper way to do it from a RESTful design standpoint,
    but it also seems impractical.</p>'
- id: 943
  author: Jared
  author_email: jaredbpd@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0yNCAxODoyNzoyOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yNCAxNzoyNzoyOCArMDEwMA==
  content: ! '<p>One thing I''ve noticed on Edge Rails, if I use a namespaced controller,
    such as User::WidgetsController, I lose the ability to use simply_helpful''s links
    and form_for conveniences.  I''m still trying to run down the WHY that goes along
    with it, but it looks like Edge''s default behavior of prefixing the named route
    with the parent (user_widgets_path, for example) is not playing nicely with

    form_for @widget do |f|

    Due to the fact that it''s not able to parse out the @widget being nested to user.</p>


    <p>What I''ve been doing is similar to your "Method 2" above; I use a before_filter
    to call "expose_models", which populates @widgets with @user.widgets unless params[:user_id].blank?,
    otherwise, populates @widgets with Widget.find(:all).</p>'
- id: 944
  author: Graeme Mathieson
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNy0yNCAyMDoxMjo0MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yNCAxOToxMjo0MyArMDEwMA==
  content: ! "<p>Jared: In that case, in order to use the <code>simply_helpful</code>
    stylee, you'd have to do:</p>\n\n<pre><code>form_for [@user, @widget] do |f|\n
    \  # ...\nend\n</code></pre>\n\n<p>Otherwise it's not possible to determine how
    to get to the widget in question.  It can't automatically determine how widget
    is related to user.  There are a number of plugins out there that attempt to solve
    that problem -- the one I chose to use on a previous project was <a href=\"http://www.bofh.org.uk/articles/tag/acts_as_resource\"
    rel=\"nofollow\">acts_as_resource</a>.</p>\n\n<p>I've since come to decide that
    if you need something like that to help you out, you're probably fundamentally
    misunderstanding how RESTful resources should work.  (Umm, IMO!)</p>"
- id: 945
  author: Jared
  author_email: jaredbpd@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNy0yNSAwMTo0NToxNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yNSAwMDo0NToxNCArMDEwMA==
  content: ! '<p>As much as I love simply_helpful for things like dom_id(), that form_for
    syntax just feels like a bit too much voodoo, so I have no problem specifying
    my action urls directly, using named routes.</p>


    <p>I''m still at a loss as for how to set up controllers, views and routing for
    polymorphic nested resources, though.</p>'
- id: 946
  author: Evgeny
  author_email: evgeny.zislis@gmail.com
  author_url: http://blog.kesor.net/
  date: !binary |-
    MjAwNy0wNy0yNSAxODo1NToyNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNy0yNSAxNzo1NToyNSArMDEwMA==
  content: ! '<p>If you try to follow the Law of Demeter as much as possible, to save
    yourself too much coupling and ease on your refactoring on the long run. Then
    creating a method ''widgets'' for a user instance is the right way.</p>


    <p>You could also use the Rails ''delegate'' method to map widgets to a user.
    For example, do @user.widgets_count instead of @user.widgets.count, and @user.widget_visible?(id)
    instead of @user.widget.find(id).visible?.</p>


    <p>Actually other than the ''delegate'' method that Rails has, Ruby Core has its
    own def_delegator and def_delegators methods, you just need to ''include Forwadable''.</p>


    <p>I think that reading a little bit about the Law of Detemer can explain these
    concepts much better than me in this comment. And one controller/model less, is
    IMHO a good thing.</p>'
- id: 947
  author: Piers Cawley
  author_email: pdcawley@bofh.org.uk
  author_url: http://www.bofh.org.uk
  date: !binary |-
    MjAwNy0wOC0wNiAwMDo0MToxNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0wNSAyMzo0MToxNyArMDEwMA==
  content: ! '<p>Grr... I''ll give you "fundamentally misunderstanding how RESTful
    resources should work"!</p>


    <p>Then again, things can very hairy in the presence of polymorphic nested routes.
    In my current project I''ve ended up overloading url_for and added a ''to_params''
    method to all my resources which returns the resource path to get to the particular
    instance.</p>


    <p>But I could be fundamentally misunderstanding stuff again...</p>'
- id: 948
  author: Graeme Mathieson
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wOC0wNiAwOTowNjoxNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0wNiAwODowNjoxNSArMDEwMA==
  content: ! '<p>Piers: Let me rephrase that slightly more tactfully. :-)  <code>acts_as_resource</code>
    was a huge help when we started the project I''ve been working on for most of
    this year.  Unfortunately, it <em>encouraged</em> (at least in our mindset at
    the time) deeply nested (including polymorphic) resources.  Yeah, those get hairy.</p>


    <p>I am now of the opinion that a flatter URL space is far more conducive to RESTful
    sanity.  I should really write this up as a post, but let''s try a first draft
    off the top of my head.  We have courses that have many sections that has one
    section test that has many questions, that have many answers.  (Questions can
    also belong to a final exam, so we''ve got bonus polymorphism there too!)  So
    to create a new answer, we wind up with a <code>POST</code> to:</p>


    <pre><code>/courses/1/sections/1/section_test/questions/1/answers

    </code></pre>


    <p>and to retrieve that answer, a <code>GET</code> to:</p>


    <pre><code>/courses/1/sections/1/section_test/questions/1/answers/1

    </code></pre>


    <p>Ugh.  There are a couple of problems with that for me:</p>


    <ul>

    <li>Exposing implementation details.  What''s that <code>section_test</code> part
    of the URL all about, for example?  The URLs are all going to change if I happen
    to want to refactor that piece of code a little.</li>

    <li>Irritatingly long URLs.</li>

    <li>More complicated controllers &amp; views, unless you use <code>acts_as_resource</code>
    to simplify things.</li>

    </ul>


    <p>But there''s an easier way.  From the perspective of the person accessing this
    resource, who cares that it''s showing the association as part of the URL?  For
    a new application I''m working on, the equivalent URLs would be a <code>POST</code>
    to:</p>


    <pre><code>/questions/1/answers

    </code></pre>


    <p>to create a new answer for that question, and a <code>GET</code> to:</p>


    <pre><code>/answers/1

    </code></pre>


    <p>to pick up the answer itself.</p>


    <p>To make that work, I have a very lightweight <code>Questions::AnswersController</code>
    which just does <code>new</code> and <code>create</code> for creating associated
    resources.  Everything else is handled by the top-level <code>AnswersController</code>.</p>


    <p>Well, more or less.  The nested one sometimes acts on <code>index</code> too,
    with an RJS action...</p>


    <p>Now that I''ve actually implemented what I was talking about in this post,
    I shall write it up properly with examples.  In the next day or two.</p>'
- id: 949
  author: Jared
  author_email: jared@alloycode.com
  author_url: http://www.alloycode.com/
  date: !binary |-
    MjAwNy0wOC0wNyAxNDo0ODoxMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0wNyAxMzo0ODoxMyArMDEwMA==
  content: ! '<p>I''ll be interested to see the new article.  I''m using something
    similar that Jamis Buck posted a while back:</p>


    <p>http://weblog.jamisbuck.org/2007/2/5/nesting-resources</p>


    <p>This way, I keep just the most relevant part of the nesting for my applications,
    and the user gets a little bit of context in the URL.</p>'
- id: 950
  author: Piers Cawley
  author_email: pdcawley@bofh.org.uk
  author_url: http://www.bofh.org.uk
  date: !binary |-
    MjAwNy0wOC0wOSAwNzowNDoxNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wOC0wOSAwNjowNDoxNCArMDEwMA==
  content: ! '<p>In my current work project we''re still using deeply nested URLs,
    and we''re likely to continue doing so, we''ve been very careful to make sure
    that all the intermediate resource identifiers have meaningful identifiers.</p>


    <p>Essentially, I think the hierarchy is an important piece of information about
    a resource structure that can, and should, be exposed in the URL scheme (where
    you have a natural hierarchy, obviously, when you''ve got a net of resources you''re
    much better with the kind of URL scheme that Rails favours). However, that''s
    at odds with DHH''s opinion, which can make for some interesting programming to
    make an end run around it. In the current project, I''ve introduced a <code>to_params</code>
    method to my resources which returns a hash that can be merged with the rest of
    a <code>url_for</code> argument hash to specify a resource''s location. After
    that, it''s a simple matter of overloading <code>url_for</code> to let it take
    a resource as an argument, and polymorphic  routes get generated quite easily.</p>


    <p>The real trick, once you have meaningful identifiers in your routes, is distinguishing
    between <code>/resources/representation_not_id</code> and <code>/resources/id_not_representation</code>.
    Dogma has it that you should restrict yourself to a small number of possible collection
    representations, but I say nuts to that. I think in the next project I''ll be
    writing a <code>resources</code> like route helper that deals with the problematic
    paths like so:</p>


    <pre><code>

    /resources/representation_of_a_collection

    /resource/a_particular_resource

    </code></pre>


    <p>I''ve already written a <code>datestamped_resource</code> routing helper for
    Typo that generates ''hackable'' urls like: <code>/articles/2007/08/08/some-article</code>
    where each suffix of the url can be removed and you''ll get the obvious index
    (assuming you''ve written the controller that way). Writing resource subtypes
    is a little harder than it could be because of the way the behaviour has been
    decomposed in Rails, but it''s still not exactly hard. It''s just a little bit
    tedious.</p>'
---
OK, lazyweb time.  I've got this application which has several widgets.  So I have a resource `WidgetsController` which maps to `/widgets` in the normal RESTful Rails fashion.  That's lovely.  We can create, read, update & destroy widgets to our heart's content.

We have users too.  Users are on a resourceful `UsersController` which maps to `/users`.  Users both have and belong to many widgets (actually, a user `has_many :widgets, :through => :membership`).

Now here's the thing.  How do we represent the list of widgets that a user has.  It seems to me the natural place to put it is `/users/username/widgets`.  We're only ever interested in the list of widgets that a user owns, since we have a canonical place to perform most of the rest of the operations, `/widgets`.  But our index is searchable because, well, it has to be.

What I was hoping to do was something along the lines of, in config/routes.rb:

    map.resources :users, :has_many => :widgets

However, that's going to map to the `WidgetsController` which is already handling `/widgets`.  So, to make this work, I need to do one of two things:

* Reference a different controller, maybe `UserWidgetsController`, or `User::WidgetsController`.

* Refactor the `WidgetsController` so that it either operates on `Widget` or `@user.widgets`, depending upon how it's being accessed.

There is a third way:

* Implement a `widgets` member action on the `UsersController`, but that feels a bit wrong because you're mixing up resources there somehow.

So.  What's the Edge Rails Way?  Feel free to point out that my thoughts are completely wrong in the first place and that there is a better way. :-)

Now that I've written it out, I feel I know which way I prefer, but it would be good to know what's correct?

**Update** I've decided that the 'right' way is `Users::WidgetsController` and written it up as a [bug in trac (#9085)](http://dev.rubyonrails.org/ticket/9085).  What do y'all think?
