---
layout: post
status: publish
published: true
title: ! 'RCS: What&#039;s changed?'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 324
wordpress_url: http://woss.name/2003/11/03/rcs-whats-changed/
date: 2003-11-03 13:36:39.000000000 +00:00
categories:
- Geekery
tags:
- Geekery
comments: []
---
<p>I manage configuration files on most of my hosts with RCS.  This is probably less than perfect when I'm making exactly the same changes on a dozen machines, but there's only one domain where I manage more than one machine under the same administrative hat and <a href="http:&#47;&#47;www.cfengine.org&#47;">cfengine<&#47;a> will make a return there one of these days.  Anyway, yes, RCS.  On these hosts, I'm a member of the <code>adm<&#47;code> group.  Generally the first thing that happens when I install a new package which creates its own configuration directory under &#47;etc is along the lines of:<&#47;p>

<pre>cd &#47;etc&#47;${PACKAGE}
sudo chgrp adm .
sudo chmod g+ws .
mkdir RCS
ci -l ${PACKAGE_CONFIG}
vim ${PACKAGE_CONFIG}
ci -u ${PACKAGE_CONFIG}<&#47;pre>

<p>This allows me to check out and edit most configuration files without having to mess with sudo; doing so maintains the revision history (particularly with respect to blame) correctly if I'm sharing the configuration job with other people.<&#47;p>

<p>Naturally I'm not entirely perfect.  Sometimes when I'm incrementally updating configurations and testing them, I forget to check in my changes.  So this morning I hacked together this script (I would chuck it into my <a href="http:&#47;&#47;svn.endless.org.uk&#47;mathie">subversion repository<&#47;a> and link instead, but I've still to set it up properly...):<&#47;p>

<pre>#!&#47;bin&#47;bash

# Get stderr on stdout - the rcs command chuck potentially useful
# crud there...
exec 2>&1

# Grab us a list of all the files in &#47;etc that are currently locked
locked_files=`find &#47;etc -type f | \
    grep "RCS.*,v$" | \
    xargs rlog -L -R | \
    sed -e 's#^\(.*\)&#47;RCS&#47;\(.*\),v$#\1&#47;\2#'`
unlockable_files=""
changed_files=""

for i in $locked_files; do
        rcsdiff -q $i >&#47;dev&#47;null
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
fi<&#47;pre>

<p>It's not ideal &acirc;&euro;&rdquo; it would be nice to parse the rlog output and render it in the form <code>${FILE} (revision ${REVISION} currently locked by ${EEJIT})<&#47;code> instead of the currently verbose form &acirc;&euro;&rdquo; but, inserted into a daily cron job, it should serve as a subtle reminder to check stuff in when I'm done with it.  Speaking of which, while developing it, I found two files which were unnecessarily locked and several more which were locked and had uncommitted changes...<&#47;p>
