---
layout: post
status: publish
published: true
title: Rendering collections of objects
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 396
wordpress_url: http://woss.name/2007/02/21/rendering-collections-of-objects/
date: 2007-02-21 15:31:51.000000000 +00:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- Geekery
- Ruby and Rails
- Work
comments:
- id: 784
  author: Andrew Vit
  author_email: andrew@avit.ca
  author_url: http://avit.ca
  date: !binary |-
    MjAwNy0wMi0yMSAxODowNTo0MiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0yMSAxNzowNTo0MiArMDAwMA==
  content: <p>Isn't this something like the Nested Layouts plugin? (Which I personally
    think should be a part of core Rails functionality...)<&#47;p>
- id: 785
  author: James Adam
  author_email: james@lazyatom.com
  author_url: http://interblah.net
  date: !binary |-
    MjAwNy0wMi0yMiAxMTowNjo0MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0yMiAxMDowNjo0MSArMDAwMA==
  content: ! '<p>I kinda feel like this is a better candidate for a helper, than something
    which works with partials. Think something along the lines of:<&#47;p>


    <p><%= table_for @objects, :attributes => [:name, :age, :etc] %><&#47;p>


    <p>Obviously this would only work in the simplest cases, but that''s probably
    good enough for 80%. And it also sets the precident for the undoubtedly-more-useful<&#47;p>


    <p><%= unordered_list_of @objects %><&#47;p>


    <p>Where it simply creates a UL element and then renders the _object.rhtml (or
    is that _object.erb now? :)) partial within a LI element.<&#47;p>


    <p>Personally I end up using UL to show collections of objects far more than tables,
    so that''s how I''d approach it.<&#47;p>'
- id: 786
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wMi0yMyAxNDoyNjoxNyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0yMyAxMzoyNjoxNyArMDAwMA==
  content: ! '<p>Andrew: It''s nothing like the nested layouts plugin, but thanks
    for pointing me in its direction.  It''ll be useful for something else I''m up
    to just now...<&#47;p>


    <p>James: I definitely have been meaning to write a <code>table_for<&#47;code>
    helper which spits out all the accessibility attributes (<code>scope<&#47;code>
    and <code>headers<&#47;code> in particular), but I feel there''s a place for both.  Now
    in our code, we just have to write:<&#47;p>


    <pre><code><%= render :partial => @authors %>

    <&#47;code><&#47;pre>


    <p>and it automagically spits out the appropriately marked up stuff for a list
    of authors (which happens to be a table in our app but it could be a list if that''s
    how I thought that was the canonical layout for a collection of authors).<&#47;p>


    <p>The remaining issue I have that''s stopping me posting a patch is that I''m
    testing for the existence of the partial that handles the collection by trying
    it and catching the exception...<&#47;p>'
---
I'm plotting. And I'm hoping that writing up my thoughts will be enough to
clarify them so I can actually implement it. In the current Rails application
I'm working on, I'm using the lovely `simply_helpful` plugin which really
tidies up the views and makes life a lot easier. But I find I'm doing a lot of
the following:

    <table summary="A listing of widgets">
      <thead>
        <tr>
          <th>Widget name<&#47;th>
          <th>Description<&#47;th>
        <&#47;tr>
      <&#47;thead>
      <tbody>
        <%= render :partial => @widgets %>
      <&#47;tbody>
    <&#47;table>

where `render :partial => @widgets` is the `simply_helpful` shortcut for
`render :partial => 'widgets&#47;widget', :collection => @widgets`.
`widgets&#47;_widget.rhtml` would look something along the lines of:

    <tr>
      <td><%=h widget.name %><&#47;td>
      <td><%= markdown widget.description %><&#47;td>
    <&#47;tr>

Personally I'd like to just write something along the lines of:

    <%= render :partial => @widgets %>

and have it automatically find the partial which does the table surrounding
the collection, then render the individual widgets. Wouldn't that be so much
cleaner?

So, how to implement? I could just modify `simply_helpful` so that its
behaviour when it gets a collection of widgets is to render `widgets&#47;widgets`
(or `widgets&#47;widget_collection` -- which would be neater?). But then you have
to write the inside of that partial -- where it renders the individual widgets
differently:

    <% @widgets.each do |widget| %>
      <%= render :partial => widget %>
    <% end %>

or something like that. That'd do, I suppose. In fact, that's pretty easy to
implement, so perhaps it's a good first step. But wouldn't it be *really* neat
if you could just replace that chunk there with `yield`? I wonder if that is
possible...?

Of course, this dramatically changes the behaviour of `render :partial =>
@collection` in `simply_helpful` and would break for anybody who upgraded it.
So I guess it would have to be a really good improvement before I could
convince anybody that it should be included. Maybe I should write it up as a
separate plugin...  What do y'all think?

**Update** Mwuahaha!  I've done it.  Without breaking the existing behaviour.  Patch forthcoming. :-)
