---
layout: post
status: publish
published: true
title: Correct route generation for params which are hashes
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 374
wordpress_url: http://woss.name/2007/01/14/correct-route-generation-for-params-which-are-hashes/
date: 2007-01-14 16:39:45.000000000 +00:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- Geekery
- Ruby and Rails
- Work
comments:
- id: 756
  author: Mark Edwards
  author_email: mark@mjecomputing.com.au
  author_url: http://www.mjecomputing.com.au/weblog/mark
  date: !binary |-
    MjAwNy0wMS0xNSAwMTozNDoxOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0xNSAwMDozNDoxOSArMDAwMA==
  content: ! '<p>I don''t have a suggestion to solve your problem. I''m learning Rails
    myself, and I''m pretty confident that you''re a lot more experienced with Rails
    and Ruby than me.<&#47;p>


    <p>However. I was thinking, why not submit your code&#47;problem to http:&#47;&#47;www.therailsway.com
    . Maybe they will come up with a better solution. We might all learn something.<&#47;p>


    <p>I enjoy your blog, BTW. Greetings from Australia!<&#47;p>'
- id: 757
  author: Sandro
  author_email: sandro@railsonwave.com
  author_url: http://www.railsonwave.com
  date: !binary |-
    MjAwNy0wMS0xNSAxMDoyNDo1OSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0xNSAwOToyNDo1OSArMDAwMA==
  content: ! '<p>Great work! I had the same problem a week ago!

    Sandro.<&#47;p>'
- id: 758
  author: Chu Yeow
  author_email: chuyeow@gmail.com
  author_url: http://blog.codefront.net/
  date: !binary |-
    MjAwNy0wNC0wNyAwODoyNzoxNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNC0wNyAwNzoyNzoxNSArMDEwMA==
  content: ! '<p>I ran into a similar problem myself and spend some time looking at
    the routing code as well before I decided to google it. Turns out, there is a
    recent patch (see changeset: http:&#47;&#47;dev.rubyonrails.org&#47;changeset&#47;6343)
    that is in trunk (but not in 1.2.3 nor the 1.2 stable branch).<&#47;p>'
---
*sigh* Do you ever have one of those days where you've got lots of work planned, then wind up getting stuck on one tiny detail and spend the rest of the afternoon hacking around in the Rails routing code?  Well, I guess it doesn't happen *that* often, but I'm sure I'm not alone!

OK, so let's take an example of the problem.  I've got a new app I'm working on for a client where they want to be able to search, based upon a number of criteria.  They also want the results to be paginated.  The form showing the search uses `form_for` to generate the form and fields, which winds up with input ids along the lines of `search[town]` and `search[region]`.  It uses `method="get"` so that people can bookmark the results easily (a feature requested by the client).

So, the search results page winds up being a URL along the lines of:

    &#47;controller;search?search%5Btown%5D=musselburgh&search%5Bregion%5D=east+lothian

Fair enough, a bit ugly with those escapes of `[` and `]`, but I'm happy enough with that.  It conveniently sticks all of the search-related terms inside `params[:search]` in the controller, not colliding with anything else I might fancy passing in.

Next the pagination.  I'm doing the bog-standard thing in the controller of manually creating the `Paginator` and doing the search.  In the view, I'm just calling `pagination_links` to emit the default set of links, passing in `params` so that it continues to constrain the results to the actual search results.

**Bang** It all breaks.  See, the URL that Rails then generates contains the result of calling `to_param` on `params[:search]` which, in the previous example, winds up with a URL of:

    &#47;controller;search?search=regioneast+lothiantownmusselburgh

See what's happened?  It's just called `to_s` on that hash, which is about as much use as a chocolate cafetiere.

I've spent the past three hours (hey, what can I say? I'm not familiar with the routing code and I several wrong turns!) creating a patch to do the right thing.  And it's been submitted to the Rails trac as [#7033](http:&#47;&#47;dev.rubyonrails.org&#47;ticket&#47;7033) in the hope that it'll be accepted.  I'd appreciate any feedback because I'd like to see it in core sooner rather than later. :-)
