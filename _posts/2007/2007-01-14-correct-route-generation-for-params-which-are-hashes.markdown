---
layout: post
title: Correct route generation for params which are hashes
date: 2007-01-14 16:39:45 +00:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- Geekery
- Ruby and Rails
- Work
---
*sigh* Do you ever have one of those days where you've got lots of work planned, then wind up getting stuck on one tiny detail and spend the rest of the afternoon hacking around in the Rails routing code?  Well, I guess it doesn't happen *that* often, but I'm sure I'm not alone!

OK, so let's take an example of the problem.  I've got a new app I'm working on for a client where they want to be able to search, based upon a number of criteria.  They also want the results to be paginated.  The form showing the search uses `form_for` to generate the form and fields, which winds up with input ids along the lines of `search[town]` and `search[region]`.  It uses `method="get"` so that people can bookmark the results easily (a feature requested by the client).

So, the search results page winds up being a URL along the lines of:

    /controller;search?search%5Btown%5D=musselburgh&search%5Bregion%5D=east+lothian

Fair enough, a bit ugly with those escapes of `[` and `]`, but I'm happy enough with that.  It conveniently sticks all of the search-related terms inside `params[:search]` in the controller, not colliding with anything else I might fancy passing in.

Next the pagination.  I'm doing the bog-standard thing in the controller of manually creating the `Paginator` and doing the search.  In the view, I'm just calling `pagination_links` to emit the default set of links, passing in `params` so that it continues to constrain the results to the actual search results.

**Bang** It all breaks.  See, the URL that Rails then generates contains the result of calling `to_param` on `params[:search]` which, in the previous example, winds up with a URL of:

    /controller;search?search=regioneast+lothiantownmusselburgh

See what's happened?  It's just called `to_s` on that hash, which is about as much use as a chocolate cafetiere.

I've spent the past three hours (hey, what can I say? I'm not familiar with the routing code and I several wrong turns!) creating a patch to do the right thing.  And it's been submitted to the Rails trac as [#7033](http://dev.rubyonrails.org/ticket/7033) in the hope that it'll be accepted.  I'd appreciate any feedback because I'd like to see it in core sooner rather than later. :-)
