---
layout: post
status: publish
published: true
title: First Deployment
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 245
wordpress_url: http://woss.name/2006/03/22/first-deployment/
date: 2006-03-22 18:12:13.000000000 +00:00
categories:
- Geekery
tags: []
comments:
- id: 328
  author: b922182dcab8
  author_email: ''
  author_url: http://b922182dcab8.us
  date: !binary |-
    MjAwOC0wNS0xNSAxODowMjozNyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0xNSAxNzowMjozNyArMDEwMA==
  content: ! '<p><strong>b922182dcab8...</strong></p>


    <p>b922182dcab8c57c5f58...</p>'
---
It's wonderful when a new application gets to a certain stage (let's call it 'First Deployment').  It's that point where, instead of battering away for hours on end with no real, tangible, visible progress, you are able to do short, sharp iterations, improving one thing and them deploying it.  Instead of spending 3 days battering your head against a slew of interdependent features, you can implement one thing and deploy it.  And then repeat.  And repeat.

So I've got a new web application up.  I won't link to it until my customer has populated it with some of her (wonderful!) art, but it's looking good.  One of this afternoon's features that brought this to mind, was me thinking "hmm, perhaps it would be nice to be able to reorder the paintings."  30 minutes, a db migration script, a few lines of code and a UI for it later, I have deployed the new feature.

(OK, so maybe I should have used `acts_as_list` on that model in the first place, but that would have been additional development in that stage before First Deployment that nobody really likes.)

There's no "we'll schedule that feature for version 2.2" because *there are no versions*.  There's just a new feature up there on the application and the only barrier to people using it is them finding out it exists.  (Note to self: must write some documentation!)
