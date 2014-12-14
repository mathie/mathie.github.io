---
title: The Retrospective Prime Directive
category: Writing
tags:
  - Agile
  - Retrospective
  - Planning
  - Review
  - Blame
---

One of my personal favourite phrases that I've seen in the past few years is
the Retrospective Prime Directive:

> Regardless of what we discover, we understand and truly believe that everyone
> did the best job they could, given what they knew at the time, their skills
> and abilities, the resources available, and the situation at hand.

<cite>&mdash; The [Retrospective Prime Directive](http://www.retrospectives.com/pages/retroPrimeDirective.html).</cite>

I first saw it emblazoned on the wall of a [friendly local company][Neo] who were hosting a hack day, but it's taken a few years to really sink in. I now have it as a [desktop wallpaper][] on my laptop. Paraphrased, it could be:

> Given the context we understood at the time, we did what we believed to be
> the right thing.

There are a couple of tricky bits to this statement, and they make it all the
more powerful:

* People are genuinely doing what they believe to be the right thing. They are
  optimising for the best possible outcome. This doesn't necessarily mean that
  they did the right thing from *your* perspective, or even from a commonly
  agreed community[^1] perspective, but they truly did think they were doing
  the right thing, given the context in which they were operating.

* You might not fully appreciate the full context in which they were operating
  at the time.

That's two important notions, which I feel the need to reiterate:

* People try their best, try to do the right thing[^2]; and

* they operate within a context (an environment) which you might not fully
  understand.

It's easy to think of examples of this from the software development landscape.
I have taken shortcuts when implementing a particular feature, because we're up
against a hard deadline imposed by an external stakeholder. I've missed out on
writing the best possible tests for my code, because I lacked the knowledge of
the testing framework. I've introduced bugs into production software because I
didn't fully understand the problem domain.

In some cases (most, I hope!), I've made the right choice, because I had access
to all the information I needed in order to make the best possible decision.
And in the situations where I didn't have access to that information, I hope I
provided my boss with enough context (from my environment) for her to make the
right decision.

But in some cases, in retrospect, I know I've made poor decisions. In the
examples I can think of, I thought I was doing the right thing at the time, but
it's my context -- my understanding of the world -- which was at fault. I've
taken shortcuts writing code because I thought there was time pressure that
didn't exist. I've introduced bugs into production software because I've had a
massive hangover and shouldn't have allowed myself to be anywhere a `cap
deploy`. (I feel the need to jump in and defend the last one immediately: the
context there would have been that I felt a pint or three with a friend was
necessary, but that I couldn't admit my impairment to the boss the next day!)

So it's all about context. Do you fully understand the context in which a
decision was made? Do you really understand the state of the business when a
particular coding choice was made? What was the individual's mental state when
they wrote that line of code -- is the comment a bit snarky because they'd just
had an argument with their partner, or had a sleepless night from being up with
an ill kid? (In an ideal world, this sort of context wouldn't impinge on
indirectly connected environments but I'm afraid we're all just human.)

The trouble with context is that it's all-encompassing. A single developer,
writing a line of production code, has the entire history of the business as
their context. They also have their personal lives: marriage, kids, childhood,
parents, everything. Who can say which perfect storm caused them to write the
`map` implementation in a way that leaked memory (only) in the production
environment? Worse still, they also have the context of all the stuff they
don't (yet) know: personally, I'd have know how to write the `map` so it didn't
leak memory, but what trade off have I made between learning that, and
incorporating some other context my colleague knows?

The trouble with context is that it can get a bit faulty, too. This is the
fundamental (at least, in my context!) problem with mental illness. As a human
being, you have *core beliefs*: those things that you've learned from your
parents at a young age, and that you know to be true. These can be positive
traits, like hard work, diligence, honour. They can also be less positive, like
viewing yourself as 'not good enough', or 'not important'.


[^1]: With "community", I'm trying to be entirely general: it might be an open source community, or a company, or even a family.

[^2]: I have to believe that this is an irrefutable truth, and that its either me -- or the other party -- misunderstanding the context which causes conflict.