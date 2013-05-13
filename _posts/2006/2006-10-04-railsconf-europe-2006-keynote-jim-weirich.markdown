---
layout: post
title: ! 'RailsConf Europe 2006: Keynote - Jim Weirich'
date: 2006-10-04 10:47:59 +01:00
categories:
- Geekery
- Ruby and Rails
- RailsConf Europe
tags:
- Geekery
- railsconfeurope
- Ruby and Rails
---
> This is the eighth in a series of articles of me writing up my notes from
> from RailsConf Europe 2006. They are all first drafts, probably
> technically inaccurate and slanderously misquoting people. Let me know
> and I'll fix them.  You can follow this series of posts by looking at
> articles in the [RailsConfEurope](/index.php?s=RailsConf+Europe+2006)
> category.

Jim was talking about safe programming practices in Ruby, in particular for
library writers where their code will be reused by others. Probably best to
just summarise his tips:

* Use namespaces for libraries. In fact, use namespaces for everything you
  write. For example, how many libraries define a class called `Node`? Lots.

* Don't use generic project names or namespaces since they are prone to
  collision. For example, a namespace of `HTML` is probably too generic. (In
  fact, there's already a library which uses that namespace, and has a class
  `HTML::Node`...)

* Avoid modifying existing classes if you can. There are two possible ways of
  modifying an existing class:

  * Adding. If you have to change an existing class, add new behaviour instead
    of modifying existing behaviour. You should always 'namespace' (which in
    the case of methods means 'add your own prefix') methods that you add so
    that there's no conflict with other library writers. Check if an added
    method already exists and, if so, pop up a warning. Better to warn the
    user than go blindly onwards! Apparently there's a technique called
    'selector namespaces', which might go into 2.0 which will mitigate these
    problems.

  * Replacing. Hooks (for example `method_missing`) should always chain to the
    next hook instead of assuming that hook's behaviour and reimplementing it.
    After all, you might not be the first person to replace that hook... Don't
    break people's expectations of behaviour -- always preserve existing
    behaviour and meet contracts.

He went on to discuss contracts a little. A contract for a method is a set of
preconditions and postconditions. New behaviour for a method must have the
same *or weaker* preconditions than the original, and must have the same
*or stronger* postconditions.
