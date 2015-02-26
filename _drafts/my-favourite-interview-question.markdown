---
title: My Favourite Interview Question
---
I haven't done any interviewing for a while -- the mixed blessing of doing
contract work instead of working as a full time employee -- but I went through a
period of growth in one of the companies I worked for where we were feverishly
expanding the development team. We had to be a little more systematic in our
approach. Instead of just having an open conversation with candidates to see
where it led (which is what I'd previously done in interview situations), I had
to be a little more systematic. It took a few goes, but eventually I settled on
one particular question for the technical portion of the interview:

> When I pull up my favourite Internet browser, type "bbc.co.uk" into the
> address bar and press return, what happens?

I reckon it's a doozy of a technical question. There's so much breadth and depth
in that answer. We could talk for hours on how the browser decides whether
you've entered something which can be turned into a valid URL, or whether it's
intended to be a search term. From there, we can look at URL construction, then
deconstruction to figure out exactly what resource we're looking for. Then it's
into name resolution, to figure out who we should be talking to.

And then it gets really interesting. We start an HTTP conversation, which is
encapsulated in a TCP session which, in turn, is encapsulated in a sequence of
IP packets, which are, in turn, encapsulated in packets at the data link layer
(some mixture of Ethernet or wireless protocols), which -- finally -- causes
some bits to fly through the air, travel along a copper wire, or become flashes
of light through fibre optic.

Now our request emerges, fully formed again, at the data centre, the HTTP
request is serviced (on which entire bookshelves have been written) and the
response follows the same journey back to the browser.

The story isn't over, though. Once the browser has received the response, it
still has to interpret it, create an internal representation of the document,
apply visual style, and render it in a window. And then there's the client side
JavaScript code to be executed.

It's an exciting story: one of daring journeys, lost packets, unanswerable
questions, and the teamwork of many routers, distributed across the Internet.

There are so many different areas involved that it's impossible to answer the
question fully in an interview situation. But I would expect an interviewee for
a technical role to have a rough overview of the process involved, and I'd be
looking for them to have depth of knowledge in some area. When you're
interviewing, as Valve succinctly put it, you're looking for a 'T' shape.
Somebody who has a wide breadth of experience, but has depth of experience in
one particular area. In answering the question, I'll get some idea of where
their strengths lie:

* If the answer is largely around the browser itself, how it interprets HTML and
  CSS to render the page, and how it interacts with JavaScript code, I'll have
  an inkling that the candidate is strong on front end work.

* If they lean more towards the server side, talking in depth about how an
  HTTP request is serviced, then chances are I'm faced with a backend developer.

* And if we get into the nitty gritty of IP procotols, packets and routing, I've
 found myself an Ops engineer.

(If they confess to having read [TCP/IP Illustrated][tcpipillustrated] cover to
cover, and can back it up, then they're pretty much an insta-hire!)

This interview question has been sitting with me in my repetoire for the past
five years now. In the past couple of years, I've been wondering: wouldn't it be
awesome if more developers had deeper knowledge of the full stack? While it's
not necessary to know the wire layout of an ARP[^1] packet, for example, it's
often useful to know what ARP is when you're trying to figure out why two
computers won't talk to each other.

The classic text for understanding the network layer is [TCP/IP Illustrated
Volume 1: The Protocols][tcpipillustrated], by W. Richard Stevens. It has been
revised by Kevin Fall, with a second edition in 2011. It definitely covers all
the material, in meticulous depth, but it's not an easy read, not necessarily an
approachable book.

I think there's an untapped market here. As it happens, I'm in the market for
some new goals in life, so here's my plan. For the next while, I'm going to
focus on writing blog posts that explain various areas of the networking stack
in some interesting level of detail. I'll be covering topics around:

* the high level protocols themselves (HTTP, SMTP, IMAP, SSH, etc);

* securing communication at the transport layer;

* name resolution at various layers (DNS, ARP, etc);

* the predominant transport layers (TCP & UDP), plus a look into relatively new
  contenders like SCTP & QUIC;

* the underlying Internet Protocol, IPv4 & IPv6, which will encompass topics
  like routing, tunnelling, firewalling & configuration;

* the physical network layers, like Ethernet, Wifi & cellular;

* the standardisation process at the IETF; and

* some of the tools that we can use to explore all these concepts.

I might even dive a little into the implementation of a network protocol. For
some reason -- and it couldn't have been because I was drunk at the time! -- the
note, "Implement a TCP/IP Stack in Go" appeared one day on my Someday/Maybe todo
list.

I'd like to experiment a little with screencasting, too. I'm aiming to put
together a series of short talks for conferences (lightning talks, and I'm
submitting longer talks to every conference I see issuing a Call For Papers!) on
various aspects of this overarching theme. I've got some notes together for a
talk on DNS, for a lightning talk at the [Bath Ruby Conference][bathrubycon]
next month, for example. I'd like to turn these talks into short screencasts,
too, if you can put up with my accent. ;-)

But the bigger goal is to write a book. I feel that this is an important topic,
and it's one that every developer could use some greater insight into. All of us
use the Internet, and most of us develop applications which interact over the
Internet. Wouldn't it be awesome if we all had the confidence to understand how
the network worked, instead of treating it like a (reliable) bit of cable
directly connecting each endpoint?

The book is definitely in the *very* early stages. I've got a rough outline, and
I've got a few thousand words that will fit in ... somewhere. But it's
definitely still at the early stages, and I'm expecting it to be a long project.
My current working title is, "A Sneak Peek at The Internet", but I was inspired
by a new title while writing this morning: "There and back again: A Packet's
Tale."

If you're interested in keeping up to date with progress on my goal, I've put together a sign up form (with [LaunchRock][launchrock] which was delightfully easy to use!). You can sign up here: [A Sneak Peek at The Internet][sneakpeek].

[tcpipillustrated]: http://www.amazon.co.uk/gp/product/0321336313/ref=as_li_tl?ie=UTF8&camp=1634&creative=19450&creativeASIN=0321336313&linkCode=as2&tag=mathieoftheen-21&linkId=3FRUDKLICXTP4TO5
[bathrubyconf]: http://2015.bathruby.org
[sneakpeek]: http://the-internet.woss.name/

[^1]: Address Resolution Protocol. This is the mechanism used by Ethernet and
Wifi networks to figure out who an IP address belongs to. If a host wants to
communicate with 10.0.2.34 on the local network, it shouts "who has 10.0.2.34?"
to everyone on that network. Hopefully, the owner of that IP address will
answer, "I have 10.0.2.34, and my hardware address is 00:11:22:33:44:55."
