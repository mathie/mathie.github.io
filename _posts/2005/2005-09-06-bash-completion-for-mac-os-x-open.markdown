---
layout: post
title: Bash completion for Mac OS X &#039;open&#039;
date: 2005-09-06 11:14:10 +01:00
categories:
- Geekery
---
Mac OS X has a neat command, <code>open(1)</code>, which will, by default, open a file specified as an argument with its default application.  However, it also allows to explicitly specify the application with the <code>-a</code> parameter.  So, for example, I can do <code>open -a "Adobe Photoshop CS2" foo.png</code> to open that image in Photoshop.  Much easier than fiddling around finding stuff in the Finder, at least for me.  OK, so one up on that, we can now have bash command completion, inspired by some other examples in [bash_completion](http://www.caliban.org/bash/index.shtml) and a (non-working) example at [iTerm's resources page](http://iterm.sourceforge.net/resource.shtml).  Stick the following in <code>/path/to/bash_completion.d/open</code>, or simply in your <code>.bashrc</code>:

{% highlight bash %}
if [ "`uname`" = "Darwin" ]; then
  _open()
  {
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    if [ "${prev}" = -a ]; then
      local IFS=$'\n'
      COMPREPLY=( $( compgen -W "$( ls -d1 /Applications/*/*.app \
                                   /Applications/*.app | \
                                   sed -e 's|^.*/\([^/]*\)\.app.*$|\1|' \
                                   -e 's/ /\\\\ /g')" -- $cur))
      return 0
    fi
  }
  complete -F _open -o default open
fi
{% endhighlight %}

Done.  Now bring up a fresh shell and do <code>open -a </code> and then hit <code>TAB</code> a couple of times to bring up a list of completions.  Note that it lists all your Mac OS X apps.

Of course, what I was <em>actually</em> trying to figure out is how to make the backspace key work correctly inside a screen session on an ssh session to another (Linux) host.  Works fine with Terminal, in all cases, works fine with screen on localhost in iTerm, works fine when I'm ssh'd to that machine without screen running in iTerm, just not the combination of all three...  Bah to evil keyboard mapping issues.

Of course, the only reason I'm fiddling with [iTerm](http://iterm.sourceforge.net/) again is after seeing it in the Rails video I mentioned previously.  Having tabbed terminal windows is kinda handy and less irritating, screen real estate-wise, when you're permanently running a (Zope|WEBrick) daemon and tailing half a dozen logs...
