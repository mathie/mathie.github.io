---
layout: post
status: publish
published: true
title: Bash completion for Mac OS X &#039;open&#039;
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 101
wordpress_url: http://woss.name/?p=101
date: 2005-09-06 11:14:10.000000000 +01:00
categories:
- Geekery
tags: []
comments:
- id: 97
  author: Philip (flip) Kromer
  author_email: flip@infochimps.org
  author_url: http://infochimps.org
  date: !binary |-
    MjAwOC0wOC0yOSAxNTo1OTo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wOC0yOSAxNDo1OTo1NyArMDEwMA==
  content: ! "<p>Thanks so much for this!<&#47;p>\n\n<p>Textile or whatever has screwed
    up the formatting here -- but try\n  http:&#47;&#47;gist.github.com&#47;7983<&#47;p>\n\n<p>for
    a cleaned-up worksforme<&#47;p>"
---
Mac OS X has a neat command, <code>open(1)<&#47;code>, which will, by default, open a file specified as an argument with its default application.  However, it also allows to explicitly specify the application with the <code>-a<&#47;code> parameter.  So, for example, I can do <code>open -a "Adobe Photoshop CS2" foo.png<&#47;code> to open that image in Photoshop.  Much easier than fiddling around finding stuff in the Finder, at least for me.  OK, so one up on that, we can now have bash command completion, inspired by some other examples in <a href="http:&#47;&#47;www.caliban.org&#47;bash&#47;index.shtml">bash_completion<&#47;a> and a (non-working) example at <a href="http:&#47;&#47;iterm.sourceforge.net&#47;resource.shtml">iTerm's resources page<&#47;a>.  Stick the following in <code>&#47;path&#47;to&#47;bash_completion.d&#47;open<&#47;code>, or simply in your <code>.bashrc<&#47;code>:

[code]if [ "`uname`" = "Darwin" ]; then
  _open()
  {
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    if [ "${prev}" = -a ]; then
      local IFS=$'\n'
      COMPREPLY=( $( compgen -W "$( ls -d1 &#47;Applications&#47;*&#47;*.app \
                                   &#47;Applications&#47;*.app | \
                                   sed -e 's|^.*&#47;\([^&#47;]*\)\.app.*$|\1|' \
                                   -e 's&#47; &#47;\\\\ &#47;g')" -- $cur))
      return 0
    fi
  }
  complete -F _open -o default open
fi[&#47;code]

Done.  Now bring up a fresh shell and do <code>open -a <&#47;code> and then hit <code>TAB<&#47;code> a couple of times to bring up a list of completions.  Note that it lists all your Mac OS X apps.

Of course, what I was <em>actually<&#47;em> trying to figure out is how to make the backspace key work correctly inside a screen session on an ssh session to another (Linux) host.  Works fine with Terminal, in all cases, works fine with screen on localhost in iTerm, works fine when I'm ssh'd to that machine without screen running in iTerm, just not the combination of all three...  Bah to evil keyboard mapping issues.

Of course, the only reason I'm fiddling with <a href="http:&#47;&#47;iterm.sourceforge.net&#47;">iTerm<&#47;a> again is after seeing it in the Rails video I mentioned previously.  Having tabbed terminal windows is kinda handy and less irritating, screen real estate-wise, when you're permanently running a (Zope|WEBrick) daemon and tailing half a dozen logs...
