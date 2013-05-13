---
layout: post
title: Rendering collections of objects
date: 2007-02-21 15:31:51 +00:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- Geekery
- Ruby and Rails
- Work
---
I'm plotting. And I'm hoping that writing up my thoughts will be enough to
clarify them so I can actually implement it. In the current Rails application
I'm working on, I'm using the lovely `simply_helpful` plugin which really
tidies up the views and makes life a lot easier. But I find I'm doing a lot of
the following:

    <table summary="A listing of widgets">
      <thead>
        <tr>
          <th>Widget name</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <%= render :partial => @widgets %>
      </tbody>
    </table>

where `render :partial => @widgets` is the `simply_helpful` shortcut for
`render :partial => 'widgets/widget', :collection => @widgets`.
`widgets/_widget.rhtml` would look something along the lines of:

    <tr>
      <td><%=h widget.name %></td>
      <td><%= markdown widget.description %></td>
    </tr>

Personally I'd like to just write something along the lines of:

    <%= render :partial => @widgets %>

and have it automatically find the partial which does the table surrounding
the collection, then render the individual widgets. Wouldn't that be so much
cleaner?

So, how to implement? I could just modify `simply_helpful` so that its
behaviour when it gets a collection of widgets is to render `widgets/widgets`
(or `widgets/widget_collection` -- which would be neater?). But then you have
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
