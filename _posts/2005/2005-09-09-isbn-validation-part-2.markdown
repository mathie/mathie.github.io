---
layout: post
status: publish
published: true
title: ISBN validation, part 2
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2005-09-09 09:25:59.000000000 +01:00
categories:
- Geekery
- Python
tags: []
comments:
- id: 106
  author: digitalkatie
  author_email: kate@kategalloway.co.uk
  author_url: ''
  date: !binary |-
    MjAwNS0wOS0xMiAxNzozNzoxOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNS0wOS0xMiAxNjozNzoxOSArMDEwMA==
  content: You don't fancy coming and teaching my 4th years do you?  Most of them
    failed the "what is a check digit" question in last weeks test!
- id: 107
  author: kesor
  author_email: kesor@kesor.net
  author_url: ''
  date: !binary |-
    MjAwNS0xMS0yMSAxMzowMzo1NiArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0yMSAxMjowMzo1NiArMDAwMA==
  content: ! "A ruby version . . . (correct me if i'm wrong)\n\n[code lang=\"ruby\"]def
    isValidISBN(isbn, c_map = '0123456789X')\n        sum = 0;\n        isbn[0..-2].scan(/\\d/).each_with_index
    { |c,i| sum += c.to_i*(i+1) }\n        isbn[-1] == c_map[sum % c_map.length]\nend[/code]"
- id: 108
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0xMS0yMSAxMzoxMTowNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0yMSAxMjoxMTowNiArMDAwMA==
  content: ! 'kesor:  Looks about right to my Ruby-virgin eyes. :-)  Thanks, in fact,
    since one of the projects I have on the back burner will be needing this for input
    validation soon. :-)'
---
An update to <a href="http://woss.name/2005/09/08/isbn-validation/">ISBN validation</a>. After thinking about Sean's comment, I do see that I've repeated some assumptions in many different places.  So, here's a new version:

[code lang="python"]import operator
def isValidISBN(isbn,
                c_map = { '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5,
                          '6': 6, '7': 7, '8': 8, '9': 9, 'X': 10 }):
    v = [c_map[i] for i in isbn.upper() if c_map.has_key(i)]
    return reduce(operator.add, map(operator.mul, v[:-1], range(1,len(v)))) % len(c_map) == v[-1][/code]

It's now a more generic algorithm with a character set which defaults to the currently used character set for ISBNs, but can be replaced by the caller.  And it no longer makes any assumptions about the length of an ISBN, which should allow for an extension to the number of digits in an ISBN.  Remaining assumptions:

<ul>
<li>There's only one checksum digit.</li>
<li>The checksum digit is the last c_map character in the ISBN.</li>
<li>The number of digits in the ISBN is 'correct'.  I'd probably be happy, for now, re-inserting the check for <code>len(v) == isbn_n_digits</code> (which would currently be 10) and documenting that assumption somewhere.</li>
</ul>
