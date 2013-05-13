---
layout: post
title: Resources, resources everywhere (and not a drop to consume?)
date: 2007-07-24 15:47:02 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
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
