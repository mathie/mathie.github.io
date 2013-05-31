---
layout: post
title: ! 'RCS: What&#039;s changed?'
date: 2003-11-03 13:36:39 +00:00
categories:
- Geekery
tags:
- Geekery
---
<p>I manage configuration files on most of my hosts with RCS.  This is probably less than perfect when I'm making exactly the same changes on a dozen machines, but there's only one domain where I manage more than one machine under the same administrative hat and [cfengine](http://www.cfengine.org/) will make a return there one of these days.  Anyway, yes, RCS.  On these hosts, I'm a member of the <code>adm</code> group.  Generally the first thing that happens when I install a new package which creates its own configuration directory under /etc is along the lines of:</p>

{% highlight bash %}
cd /etc/${PACKAGE}
sudo chgrp adm .
sudo chmod g+ws .
mkdir RCS
ci -l ${PACKAGE_CONFIG}
vim ${PACKAGE_CONFIG}
ci -u ${PACKAGE_CONFIG}
{% endhighlight %}

<p>This allows me to check out and edit most configuration files without having to mess with sudo; doing so maintains the revision history (particularly with respect to blame) correctly if I'm sharing the configuration job with other people.</p>

<p>Naturally I'm not entirely perfect.  Sometimes when I'm incrementally updating configurations and testing them, I forget to check in my changes.  So this morning I hacked together this script (I would chuck it into my [subversion repository](http://svn.endless.org.uk/mathie) and link instead, but I've still to set it up properly...):</p>

{% highlight bash %}
#!/bin/bash

# Get stderr on stdout - the rcs command chuck potentially useful
# crud there...
exec 2>&1

# Grab us a list of all the files in /etc that are currently locked
locked_files=`find /etc -type f | \
    grep "RCS.*,v$" | \
    xargs rlog -L -R | \
    sed -e 's#^\(.*\)/RCS/\(.*\),v$#\1/\2#'`
unlockable_files=""
changed_files=""

for i in $locked_files; do
        rcsdiff -q $i >/dev/null
        differs=$?
        if [ "$differs" -eq "0" ]; then
                unlockable_files="$unlockable_files $i"
        elif [ "$differs" -eq "1" ]; then
                changed_files="$changed_files $i"
        fi
done

if [ ! -z "$unlockable_files" ]; then
    echo "The following files are locked but unchanged:"
    for i in $unlockable_files; do
        rlog -L -h $i
    done
fi

if [ ! -z "$changed_files" ]; then
    echo
    echo "The following files are checked out and changed as follows:"
    for i in $changed_files; do
        rcsdiff -u $i
    done
fi
{% endhighlight %}

<p>It's not ideal â€” it would be nice to parse the rlog output and render it in the form <code>${FILE} (revision ${REVISION} currently locked by ${EEJIT})</code> instead of the currently verbose form â€” but, inserted into a daily cron job, it should serve as a subtle reminder to check stuff in when I'm done with it.  Speaking of which, while developing it, I found two files which were unnecessarily locked and several more which were locked and had uncommitted changes...</p>
