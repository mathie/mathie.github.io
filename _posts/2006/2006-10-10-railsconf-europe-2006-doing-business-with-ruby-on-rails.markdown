---
layout: post
title: ! 'RailsConf Europe 2006: Doing Business with Ruby on Rails'
date: 2006-10-10 09:09:32 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- RailsConf Europe
- Ruby and Rails
comments:
- id: 612
  author: A Fresh Cup &raquo; Blog Archive &raquo; Searching a Model on Multiple Fields
  author_email: ''
  author_url: http://afreshcup.com/?p=590
  date: !binary |-
    MjAwOC0wMS0wMSAxNDozNzowNSArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0wMS0wMSAxNDozNzowNSArMDAwMA==
  content: ! '[...] ModelSearch is a plugin that was demoed in one of the talks at
    RailsConf Europe 2006. It lets you do things like [...]'
---
> This is the tenth in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](/index.php?s=RailsConf+Europe+2006)
> category.

There were two portions to this talk. The first was from a business
perspective. How do you go about convincing a client that you want to use Ruby
on Rails for your next big project? Well, you could just now tell them. A lot
of clients really don't care about the technical platform, they just want
something that is delivered on budget and in time.

The other way is that you could talk about the advantages. like:

* Quality of the code produced.

* Hype, excitement and momentum. Combined with the latter two, hype can be a
  good thing.

* Show your passion.  (Comes back to Kathy's talk.)

He talked about the fact that switching to rails meant that they actually
finished their last project *ahead of schedule*, and that they used the
additional time to improve code quality & polish the UI, rather than telling
the customer they'd finished early and asking what extra features they wanted.

Then came the second portion of the talk, from one of the developers about a
particular technical aspect of the code. He has created a Rails plugin called
ModelSearch which takes the pain out of creating complex SQL queries in Rails.
For example, to search your product database for televisions that cost less
than $300, you'd do something along the lines of:

    search = ProductSearch.new
    search.keyword = 'television'
    search.max_price = 300
    search.sort = :price
    search.find(:all)

It can also spit out options compatible with a model's existing `find` and has
paginator support. You can pass `params` directly into the `ProductSearch`
constructor and it will infer the search query based upon the parameters,
munging the types as necessary.

The method for creating these ModelSearch classes is declarative -- ie you
have to create a ProductSearch class, declare the keys that are searchable and
how they can be searched. This does bring advantages (for example, the
`keyword` in the example above is actually declared as being in either of two
columns, `name` or `description`), but I wonder if some work could be done to
introspect the model class and create methods automatically on demand.

On the downside, it currently breaks `find(:include)`.

The ModelSearch code is scheduled for public release soon, but it still needs
to be tidied up.
