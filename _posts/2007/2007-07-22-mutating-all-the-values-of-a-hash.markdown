---
layout: post
title: Mutating all the values of a hash
date: 2007-07-22 14:49:14 +01:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
---
It's not the first time I've found myself writing something akin to the following:

    BandPages = YAML::load(IO.read("#{RAILS_ROOT}/test/fixtures/myspace_band_pages.yml"))
    BandDoms = Hash[*BandPages.map do |k, v|
      [
        k,
        Hpricot.parse(v)
      ]
    end.flatten]

OK, so what I'm actually doing in this case is loading a bunch of HTML pages I've cached as a YAML file (for testing) and parsing their HTML dom using [Hpricot](http://code.whytheluckystiff.net/hpricot/).  (Don't ask!)  But what I'm doing in the general case is:

    new_hash = Hash[*old_hash.map do |k, v|
      [
        k,
        mutate_value(v)
      ]
    end.flatten]

Wouldn't it be a lot clearer if I did something along the lines of:

    new_hash = old_hash.mutate_values do |v|
      mutate_value(v)
    end

instead?  So that it feels just like using map on an array?  Well, that's what I've done. :-)  You can pick up the extension in my [rubaidh_platform](http://svn.rubaidh.com/plugins/trunk/rubaidh_platform) plugin along with another pile of random things.

Or did I miss something that already does this a little more elegantly?  I think it should be a core part of Ruby -- maybe that's even how map should behave on hashes?
