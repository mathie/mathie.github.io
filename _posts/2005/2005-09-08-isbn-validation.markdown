---
layout: post
status: publish
published: true
title: ISBN validation
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 110
wordpress_url: http://woss.name/?p=110
date: 2005-09-08 16:41:17.000000000 +01:00
categories:
- Geekery
- Python
tags: []
comments:
- id: 102
  author: Kisin
  author_email: kisin@livejournal.com
  author_url: http://kisin.livejournal.com/
  date: !binary |-
    MjAwNS0wOS0wOCAyMToxNjozNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0wOCAyMDoxNjozNyArMDEwMA==
  content: ! 'This entry was posted -1 years, 12 months ago and


    This date seems very odd,'
- id: 103
  author: Sean
  author_email: sean@seanfarrell.co.uk
  author_url: ''
  date: !binary |-
    MjAwNS0wOS0wOCAyMjoyNjowNSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0wOCAyMToyNjowNSArMDEwMA==
  content: You are remembering about Y2K-type coding problems.  I seem to recall reading
    somewhere that there might be a change coming up in the standard for ISBN, which
    increases the number of digits allowed in the definition.
- id: 104
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0wOS0wOSAwODoyMzo1NCArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0wOSAwNzoyMzo1NCArMDEwMA==
  content: ! 'Kisin: Yeah, I do keep meaning to fix that.  I think there''s a slight
    error in the calculation ... it rights itself if the post is a few hours old --
    check it now for example.


    Sean: See my later post ... I think I''ve ironed out the important asssumptions
    now.  Thanks for making me think it through properly. :)'
- id: 105
  author: Notes from a messy desk &raquo; Blog Archive &raquo; ISBN validation, part
    2
  author_email: ''
  author_url: http://woss.name/?p=111
  date: !binary |-
    MjAwNS0wOS0wOSAwOToyNjoxNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0wOSAwODoyNjoxNiArMDEwMA==
  content: ! '[...] Notes from a messy desk The net.presence of mathie (AKA Graeme
    Mathieson)         &laquo; ISBN validation [...]'
---
Don't ask.  I got distracted onto this in some way I can't even imagine.  But have some code to validate ISBNs.

[code lang="python"]import operator
def isValidISBN(isbn):
    v = [i == 'X' and 10 or int(i) for i in isbn.upper() if i in '0123456789X']
    if len(v) != 10:
        return False
    return reduce(operator.add, map(operator.mul, v[:9], range(1,10))) % 11 == v[-1][&#47;code]

This will normalise an ISBN, by taking out all the spacing and dashes (that's mostly the first <code>v = ...<&#47;code> line).  Then it performs the checksum.  The first 9 digits are the ISBN itself, the 10th is the checksum, so take the first 9 digits and perform the following algorithm (along with an example ISBN 0006551270):

<ol>
  <li>Multiply each digit by cardinal position (hmm, am I using the right phrase there?).  So the first digit gets multiplied by 1, the second digit is multipled by 2, and so on until the 9th digit is multiplied by 9.  So, in our example we have <code>[1*0, 2*0, 3*0, 4*6, 5*5, 6*5, 7*1, 8*2, 9*7]<&#47;code> which would be <code>[0, 0, 0, 24, 25, 30, 7, 16, 63]<&#47;code><&#47;li>
  <li>Take the sum of these results.  That's <code>0 + 0 + 0 + 24 + 25 + 30 + 7 + 16 + 63<&#47;code> in our example, which is <code>165<&#47;code>.<&#47;li>
  <li>Divide the sum by 11 and figure out the remainder (also known as the modulus).  It so happens that 11 divides into 165 perfectly, leaving 0 remainder, so that probably makes my example a bad one!<&#47;li>
  <li>The remainder should be equal to the checksum digit in the ISBN.  If the remainder was 10, that's expressed in the ISBN's checksum as an 'X'.<&#47;li>
<&#47;ol>

I'm not very good at explaining stuff, really, eh?  But it's more elucidating than that odd lump of Python if you've not had much exposure to functional languages, I guess.
