---
layout: post
status: publish
published: true
title: Symlink corruption on Mac OS X
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 653
wordpress_url: http://woss.name/?p=653
date: 2012-01-29 11:35:52.000000000 +00:00
categories:
- Geekery
- Mac OS X
tags:
- Mac OS X
- Lion
- symlinks
- corruption
- thunderbolt
- genius bar
comments: []
---
Mac OS X on my desktop computer (a newish 27" iMac, using a Promise Thunderbolt disk array for the root filesystem) seems to be having filesystem troubles. I notice it through symlinks going awry, though I'm sure they're not the only victim. I tidied all the errant symlinks up two weeks ago, hoping it was a temporary glitch, but they're back again today. Here's an example:

    > find -L &#47;System -type l -print0 |xargs -0 ls -l
    lrwxr-xr-x  1 root  wheel  24 15 Jan 09:42 &#47;System&#47;Library&#47;Frameworks&#47;ApplicationServices.framework&#47;Frameworks&#47;CoreGraphics.framework&#47;Headers -> >File<&#47;string>????<key>L
    lrwxr-xr-x  1 root  wheel  24 15 Jan 09:42 &#47;System&#47;Library&#47;Frameworks&#47;ApplicationServices.framework&#47;Frameworks&#47;HIServices.framework&#47;Headers -> ?6?s?A??]h?_?:d9?r?
    lrwxr-xr-x  1 root  wheel  24 15 Jan 09:42 &#47;System&#47;Library&#47;Frameworks&#47;ApplicationServices.framework&#47;Versions&#47;A&#47;Frameworks&#47;CoreGraphics.framework&#47;Headers -> >File<&#47;string>????<key>L
    lrwxr-xr-x  1 root  wheel  24 15 Jan 09:42 &#47;System&#47;Library&#47;Frameworks&#47;ApplicationServices.framework&#47;Versions&#47;A&#47;Frameworks&#47;HIServices.framework&#47;Headers -> ?6?s?A??]h?_?:d9?r?
    lrwxr-xr-x  1 root  wheel  24 15 Jan 09:42 &#47;System&#47;Library&#47;Frameworks&#47;ApplicationServices.framework&#47;Versions&#47;Current&#47;Frameworks&#47;CoreGraphics.framework&#47;Headers -> >File<&#47;string>????<key>L
    lrwxr-xr-x  1 root  wheel  24 15 Jan 09:42 &#47;System&#47;Library&#47;Frameworks&#47;ApplicationServices.framework&#47;Versions&#47;Current&#47;Frameworks&#47;HIServices.framework&#47;Headers -> ?6?s?A??]h?_?:d9?r?

Each of those symlinks are pointing to some garbage. (Interestingly, the garbage quite often looks like the partial contents of a plist file.)

Here's another example, and this is one I *remember fixing* last time:


    lrwxr-xr-x  1 root  wheel  27 12 Nov 19:06 &#47;System&#47;Library&#47;Frameworks&#47;JavaVM.framework&#47;Frameworks -> Versions&#47;Current&#47;Frameworks
    lrwxr-xr-x  1 root  wheel  24 15 Jan 09:43 &#47;System&#47;Library&#47;Frameworks&#47;JavaVM.framework&#47;Headers -> Versions&#47;Current&#47;Headers
    lrwxr-xr-x  1 root  wheel  23 12 Nov 19:06 &#47;System&#47;Library&#47;Frameworks&#47;JavaVM.framework&#47;JavaVM -> Versions&#47;Current&#47;JavaVM
    lrwxr-xr-x  1 root  wheel  26 15 Jan 09:45 &#47;System&#47;Library&#47;Frameworks&#47;JavaVM.framework&#47;Resources -> Versions&#47;Current&#47;Resources
    lrwxr-xr-x  1 root  wheel   1  8 Jan 14:57 &#47;System&#47;Library&#47;Frameworks&#47;JavaVM.framework&#47;Versions&#47;Current -> c

The problem here isn't the first four symlinks &ndash; they're all pointing to the right places &ndash; but the last one (which they're all pointing through) which is pointing to 'c', not 'A' like it should.

The symlink targets all seem to be the right length, just the wrong characters.

How do I go about communicating with Apple about the problem so I can get it resolved? It doesn't really seem the sort of thing I can take to a Genius Bar...
