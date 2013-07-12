---
layout: post
title: The disadvantage of `svn:externals`
date: 2006-03-31 10:26:20 +01:00
categories:
- Geekery
- Work
---
The advantages of using `svn:externals` is that you can track the latest trunk of a particular piece of software and you can share plugins between products.

The disadvantage is when you're using `exception_notification` from http://dev.rubyonrails.org/ and the host appears to have died.  Then you can't deploy!

*sigh* I suppose I should be more careful and track third party dependencies in my own subversion repositories.  That way I can patch them (without waiting for patches to be incorporated upstream), make more definite decisions about when to incorporate a change (do I really want to be tracking `trunk/` of J. Random Developer's plugin -- somebody who might even commit as broken, brain-dead code as I occasionally do?!?).
