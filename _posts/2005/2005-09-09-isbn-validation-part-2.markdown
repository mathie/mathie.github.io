---
layout: post
title: ISBN validation, part 2
date: 2005-09-09 09:25:59 +01:00
categories:
- Geekery
- Python
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
