---
layout: post
title: ISBN validation
date: 2005-09-08 16:41:17 +01:00
categories:
- Geekery
- Python
---
Don't ask.  I got distracted onto this in some way I can't even imagine.  But have some code to validate ISBNs.

[code lang="python"]import operator
def isValidISBN(isbn):
    v = [i == 'X' and 10 or int(i) for i in isbn.upper() if i in '0123456789X']
    if len(v) != 10:
        return False
    return reduce(operator.add, map(operator.mul, v[:9], range(1,10))) % 11 == v[-1][/code]

This will normalise an ISBN, by taking out all the spacing and dashes (that's mostly the first <code>v = ...</code> line).  Then it performs the checksum.  The first 9 digits are the ISBN itself, the 10th is the checksum, so take the first 9 digits and perform the following algorithm (along with an example ISBN 0006551270):

<ol>
  <li>Multiply each digit by cardinal position (hmm, am I using the right phrase there?).  So the first digit gets multiplied by 1, the second digit is multipled by 2, and so on until the 9th digit is multiplied by 9.  So, in our example we have <code>[1*0, 2*0, 3*0, 4*6, 5*5, 6*5, 7*1, 8*2, 9*7]</code> which would be <code>[0, 0, 0, 24, 25, 30, 7, 16, 63]</code></li>
  <li>Take the sum of these results.  That's <code>0 + 0 + 0 + 24 + 25 + 30 + 7 + 16 + 63</code> in our example, which is <code>165</code>.</li>
  <li>Divide the sum by 11 and figure out the remainder (also known as the modulus).  It so happens that 11 divides into 165 perfectly, leaving 0 remainder, so that probably makes my example a bad one!</li>
  <li>The remainder should be equal to the checksum digit in the ISBN.  If the remainder was 10, that's expressed in the ISBN's checksum as an 'X'.</li>
</ol>

I'm not very good at explaining stuff, really, eh?  But it's more elucidating than that odd lump of Python if you've not had much exposure to functional languages, I guess.
