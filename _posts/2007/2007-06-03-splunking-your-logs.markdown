---
layout: post
status: publish
published: true
title: Splunking your logs
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2007-06-03 18:32:43.000000000 +01:00
categories:
- Geekery
- Solaris
tags:
- Geekery
- Solaris
comments:
- id: 845
  author: Mika
  author_email: mika.borner@bluewin.ch
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0wNCAwNjoxMToxNCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNCAwNToxMToxNCArMDEwMA==
  content: ! '<p>I tried to use FIFOs for Syslog.</p>


    <p>It hasn''t worked reliably (broken pipes etc.). I would go with tailing /var/adm/messages.
    This way you won''t loose any log entries.</p>


    <p>Additionally, I would add the PRIV_FILE_DAC_READ privilege to the splunk.xml
    manifest.</p>


    <p>This way splunk can read all files...</p>'
- id: 846
  author: Kimmo
  author_email: lord_croft@hotmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0wNCAxMjowMTo0MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNCAxMTowMTo0MyArMDEwMA==
  content: ! '<p>I''ve used Splunk a lot too, and have had no problems whatsoever
    with fifos. However, I routinely change out my syslog daemon for syslog-ng and
    use its ability to send logs to multiple destinations extensively. It sends one
    set to a fifo, which works reliably for me, and another to files that I archive
    on disk, automatically rotated by date by syslog-ng. That makes Splunk completely
    re-creatable should something happen to the data - you always have the plain text
    files available. You also don''t have to worry about what Splunk can and cannot
    read - as long as it can read the fifo, you''re done.</p>


    <p>That makes Splunk a nice tool but not something that will give you tons of
    headaches about needing to back it up or worry yourself sick about upgrading with
    worries about losing data etc.</p>


    <p>syslog-ng also works great for centrally storing logs, nicely sorted into date/time
    folders.</p>'
- id: 847
  author: Kisin
  author_email: jjm@ixtab.org.uk
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0wNCAxNjozMDo1OCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNCAxNTozMDo1OCArMDEwMA==
  content: ! '<p>I''m currently running a large Splunk installation, and could give
    out some tips on scaling it quite well. Give us a shout if you want to meet up
    and discus one evening over a couple of pints.</p>


    <p>Not seem you in far too long,</p>'
- id: 848
  author: Mika
  author_email: mika.borner@bluewin.ch
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0wNCAxNjo1ODoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNCAxNTo1ODoyNiArMDEwMA==
  content: ! '<p>Syslog-ng is ok, but I now prefer using splunk-2-splunk for log forwarding.
    This allows to forward non-syslog logfiles (application logs etc.). I prefer using
    only one mechanism.</p>


    <p>Another advantage of Splunk-2-splunk is it nicely buffers log entries (e.g.
    when central splunk instance is down).</p>


    <p>The problem I had with FIFO was, that when splunk did not run for a certain
    time (e.g. splunk daemon restart), the syslog pipe would timeout resulting in
    a broken pipe error. This would then require a restart of the syslogd also (could
    be handled with a manifest).</p>


    <p>I guess syslog-ng does not behave like this...</p>'
- id: 849
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNi0wNCAxNzowNjo0MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNCAxNjowNjo0MyArMDEwMA==
  content: ! '<p>Mika: That''s pretty much the problem I was having with FIFOs and
    syslogd.  If FIFOs were worth pursuing as an option, I was going to figure out
    which order the dependency should be in for the manifests, but personally I''m
    liking your suggestion for adding the privilege to allow splunk to read all the
    log files.  I''m going to try that out tonight and see what happens.  Thanks!</p>'
- id: 850
  author: SplunkNinja
  author_email: thewilde@splunk.com
  author_url: http://blogs.splunk.com
  date: !binary |-
    MjAwNy0wNi0wNSAxOToyNzo1MyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0wNSAxODoyNzo1MyArMDEwMA==
  content: ! '<p>Mathie...  Great blog post!!</p>


    <p>Just for clarification.. in Splunk, when you add a "Files &amp; Directories"
    data input, choosing "tail" and then clicking add (As you have tried with /var/log),
    Splunk will not only eat /var/log, but it will try to eat every file and directory
    under it, recursively.  In fact, if new files arrive in that directory that Splunk
    didn''t have knowledge of, it''ll find them and eat them as well.  You really
    didn''t have to tail both /var/log and /var/log/swupas, but the permissions do
    need to be correct so Splunk can read them.</p>


    <p>SplunkNinja tip:  I often use Splunk''s whitelisting feature when i''m tailing
    directories.  For example, i may want to have Splunk eat a giant pile of logfiles
    under several directories under /var/log, but only want to have eat just the files
    that have a ".log" extension.  I get down and dirty and go right to the config
    files. When you add a tail in Splunk from the GUI, a file called "inputs.conf"
    is created in your $SPLUNK_HOME/etc/bundles/local directory.  By adding some options
    directly to that file, you can add a whitelist and/or blacklist, like this</p>


    <p>INPUTS.CONF

    [tail:///var/log]

    disabled = false

    sourcetype = syslog

    _whitelist = [.]log</p>


    <p>Extra tip:  Use "listtails" to make sure your whitelist/blacklist regex is
    correct.</p>


    <p>First, source the Splunk environment:  "source /opt/splunk/bin/setSplunkEnv"

    Next, "listtails".</p>


    <p>Splunk reads the config files, and then the directory structure and should
    let you know what files are really going to be eaten.  When it looks good, restart
    your Splunk server to apply the changes.</p>


    <p>-SplunkNinja</p>'
- id: 851
  author: Douglas F Shearer
  author_email: dougal.s@gmail.com
  author_url: http://douglasfshearer.com
  date: !binary |-
    MjAwNy0wNi0xMSAwMTowMzo0NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMSAwMDowMzo0NyArMDEwMA==
  content: ! '<p>I can see a capistrano initialization task on the horizon that creates
    a new zone then configs apache/mongrel/ngnix etc.</p>


    <p>Hmm, perhaps a tit-bit for later in the week when I''m bored.</p>'
- id: 852
  author: Douglas F Shearer
  author_email: dougal.s@gmail.com
  author_url: http://douglasfshearer.com
  date: !binary |-
    MjAwNy0wNi0xMSAwMTowNToxNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMSAwMDowNToxNiArMDEwMA==
  content: <p>Uhhhh..somehow posted that on the wrong post, was supposed to be on
    your creating/deleting zones entry. No wonder the other comments seemed out of
    context.</p>
---
While I was looking for something else, I remembered that I'd been looking for an excuse to try out [Splunk](http://www.splunk.com/) for a wee while.  It's a system for collating all your log files and making them easily searchable.  But it's better than grep, because the way it allows you to search your log files spans time and files and even hosts.  It allows you to spot *patterns* in your log files.

The latest version as I speak is 3.0 beta 2, but unfortunately they don't have Solaris x86 packages available yet, so I had to stick with 2.2.3.  Installing it was really easy -- just copy and paste the wget command line they helpfully give you on the web page, then install with `pkgadd`:

    mathie@kilchoman:~$ wget 'http://www.splunk.com/index.php/download_track?file=/2.2.3/solaris/splunk-2.2.3-18173-solaris-10-intel.pkg.Z&ac=&wget=true&name=wget'
    mathie@kilchoman:~$ uncompress splunk-2.2.3-18173-solaris-10-intel.pkg.Z
    mathie@kilchoman:~$ pfexec pkgadd -d splunk-2.2.3-18173-solaris-10-intel.pkg

It will install everything in /opt/splunk (so you might, optionally, want to create another ZFS filesystem there -- I did), create a user & group called `splunk`, and fix up permissions.

As an aside, unfortunately the post-install script unconditionally tries to set the permissions on everything in `/opt/splunk`.  If you have a zone which inherits `/opt` then you'll get a pile of errors about it being a read only file system.  I don't know what the correct way to deal with post-installation scripts and zones is, but hopefully somebody can point the Splunk package maintainer in the right direction.

Anyway, don't at this stage get too trigger happy as I did.  I just ran the Splunk start script as root, which caused all of the configuration and data to be owned by root, which caused me some issues down the road.  Ignore that and let's create an SMF manifest so that it can be started automagically along with the rest of the system.  I've cobbled the manifest using [splunk.xml](http://opensolaris.org/os/community/smf/manifests/splunk.xml) as the basis, but just ignoring the FIFO bits for now:

    <?xml version="1.0"?>
    <!DOCTYPE service_bundle SYSTEM "/usr/share/lib/xml/dtd/service_bundle.dtd.1">
    <service_bundle type='manifest' name='splunk'>
      <service name='site/webapps/splunk' type='service' version='2'>
        <create_default_instance enabled='true' />
        <single_instance />

        <dependency name='splunk_multi-user' grouping='require_all' restart_on='none' type='service'>
            <service_fmri value='svc:/milestone/multi-user' />
        </dependency>

        <dependency name='splunk_network' grouping='require_all' restart_on='none' type='service'>
            <service_fmri value='svc:/milestone/network' />
        </dependency>

        <dependent name='splunk_multi-user-server'  grouping='optional_all' restart_on='none'>
            <service_fmri value='svc:/milestone/multi-user-server' />
        </dependent>

        <method_context>
            <method_credential user='splunk' group='splunk' privileges="basic,file_dac_read" />
            <method_environment>
            <!-- FIXME: Eventually we'll proxy through Apache (for auth!)
                <envvar name='SPLUNK_BINDIP' value='127.0.0.1'/>
            -->
    	    <envvar name='HOME' value='/opt/splunk' />
            </method_environment>
        </method_context>

        <exec_method type='method' name='start' exec='/opt/splunk/bin/splunk %m --accept-license' timeout_seconds='300'></exec_method>
        <exec_method type='method' name='stop' exec='/opt/splunk/bin/splunk %m' timeout_seconds='300'></exec_method>
        <exec_method type='method' name='refresh' exec='/opt/splunk/bin/splunk restart' timeout_seconds='600'></exec_method>

        <stability value='Unstable' />

        <template>
          <common_name>
            <loctext xml:lang='C'>
            Splunk log server
            </loctext>
          </common_name>
        </template>
      </service>
    </service_bundle>


OK, now let's import the SMF manifest by pasting the XML chunk here into `~/splunk.xml` and running:

    mathie@kilchoman:~$ pfexec svccfg import ~/splunk.xml

That imports the SMF manifest and starts the service, since it defaults to being enabled.  We can watch the service starting by running:

    mathie@kilchoman:~$ tail -f /var/svc/log/site-webapps-splunk:default.log

which should show it doing its initial configuration and starting up some web services.  At this stage, you should be able to visit <http://192.168.0.252:8000/> (changing the IP address based on your host's IP!) and see Splunk!

We've got one final bit of configuration to do: tell Splunk where to find some log files!  Head to the admin screen, then data inputs and select "add input" for "Files & Directories".  Fill in "Full path on server" with, for starters, `/var/log`.  Then hit 'Add'.  This will keep an eye on all the files immediately in the `/var/log` directory, but not subdirectories.  So far, I've added the following directories:

* `/var/log`, `/var/log/swupas`
* `/var/adm`
* `/var/svc/log`

So, what's wrong with this setup? Well, you're only going to see the contents of files that the splunk user can read.  So, for example, we'll not get to index `/var/adm/sulog`.  However, it's a good start.  I suspect the next step is to connect Splunk to syslog through a FIFO, but that wasn't quite working reliably as a write this, and my concentration is now shot because Annabel has returned and put the TV on...  Anyway, it wouldn't have given us any of the historical data to be able to immediately play around with Splunk, so following these steps first was probably a good idea.

Long term, I suspect I'm going to set up a single Solaris Container as a syslog server, running Splunk, and having every other container throw all their logs at it.

**Update** I've made a couple of changes to the manifest, partly inspired by a couple of comments.  The splunk user the server process runs as now has the `file_dac_read` privilege, which allows it to read files that it would otherwise not be allowed to because of ACL permissions.  On the plus side, it means it can read all the log files it needs to.  On the downside this technically means it can now read `/etc/shadow` too.

I've also changed the FMRI to start with `site` since that's apparently where my own services should go, and I set the `$HOME` environment variable since I was getting a warning in the Splunk logs because it couldn't find it.
