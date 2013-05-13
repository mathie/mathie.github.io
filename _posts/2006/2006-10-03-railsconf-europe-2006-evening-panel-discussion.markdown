---
layout: post
title: ! 'RailsConf Europe 2006: Evening Panel Discussion'
date: 2006-10-03 15:08:41 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
---
> This is the seventh in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](/index.php?s=RailsConf+Europe+2006)
> category.

The format for the panel discussion was that questions were submitted during
the day and that David Black would present the questions on behalf of the
audience member, to the panel.

One question was about accessibility. This seems to be a hot topic for some
people (it's a requirement for some government web sites in the US & UK, for
example), but I got the impression the panel didn't think it was hugely
important. Basically, screen readers are still 10 years behind current browser
technology. They need to make an effort to catch up in addition to us making
sites work with them. Thomas reckoned that if you need a flashy site that's
also accessible, you need to create two separate sites.

DHH is of the opinion that the fact that there are so many different i18n
solutions out there means there is no one good fit that will work for
everybody. And so it's unlikely that we'll see i18n in the core any time soon.
Shopify looked at various different plugins for i18n and in the end decided it
was easier just to reimplement it themselves. DHH did clarify that he's fully
behind the UTF-8 work that's currently going on, and that is a completely
orthogonal issue.

Somebody asked about how to do authentication with Active Resource. It relies
on it happening at the HTTP level (HTTP auth or digest for example). Again,
you can use `respond_to` to determine how you do the authentication. For html,
you can redirect to your regular, pretty, HTML login dialog, whereas for
somebody request XML, you can do HTTP auth.

Apparently, with regard to testing, integration tests do test the routing
setup, whereas functional tests don't. Actually, I think I was surprised that
integration tests *did* run through the routing code, though I don't know why.
It's good to know, though.

##### Tail end of DHH's keynote

David over-ran his keynote in the morning, so it was added at the end of the
day instead. Basically, it was a long, vitriolic rant about what he called
"vendoritis". It was about all these people who were complaining at the recent
security upgrade and demanding things of 37Signals and the core contributors.
His reponse? "We don't owe you shit!" The key thing I got from this rant was
that entitlement is gained from contribution to the community. Which is
something I'm guilty of not doing often enough and this got me to thinking how
I could do better.
