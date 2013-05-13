---
layout: post
status: publish
published: true
title: Setting up a local name server on Mac OS X
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 347
wordpress_url: http://woss.name/2006/11/13/setting-up-local-name-server-on-mac-os-x/
date: 2006-11-13 12:17:55.000000000 +00:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- Geekery
- Ruby and Rails
- Work
comments:
- id: 673
  author: Jamie Hill
  author_email: jamie@thelucid.com
  author_url: http://www.thelucid.com
  date: !binary |-
    MjAwNi0xMS0xMyAyMzozNTo0MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0xMyAyMjozNTo0MSArMDAwMA==
  content: <p>DNS scares the hell out of me, are there any good sites out there that
    explain what all that voodoo is doing? A kind of idiots guide to BIND?</p>
- id: 674
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMS0xNCAxMDo0Njo0OCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0xNCAwOTo0Njo0OCArMDAwMA==
  content: ! '<p>Jamie: I learned everything I know about DNS from <a href="http://www.oreilly.com/catalog/dns5/index.html"
    rel="nofollow">DNS and BIND</a>.  I''ve got the first or second edition kicking
    around on my bookshelves (alongside <a href="http://www.oreilly.com/catalog/sendmail3/"
    rel="nofollow">the bat book</a>, another essential at the time!) but I see it''s
    still regularly updated and on to its fifth edition now.  Highly recommended.</p>


    <p>As for online material, I can''t think of anything in particular to recommend.  However,
    there''s one tool that springs to mind as essential: <a href="http://www.squish.net/dnscheck/"
    rel="nofollow">dnscheck</a> which shows you the workings of a DNS lookup from
    the root servers.  Scary, but useful to see how things work.</p>'
- id: 675
  author: Mark Brown
  author_email: broonie@sirena.org.uk
  author_url: http://www.sirena.org.uk/log/
  date: !binary |-
    MjAwNi0xMS0xNCAxMTowNToxMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0xNCAxMDowNToxMyArMDAwMA==
  content: ! '<p>The Linux Network Administrator''s Guide or whatever it''s called
    these days used to be pretty good too. There''s really not much to it: it''s a
    pretty simple database lookup system.</p>'
- id: 676
  author: CpILL
  author_email: whillas@gmail.com
  author_url: http://alex.tsd.net.au/cpill/
  date: !binary |-
    MjAwNi0xMi0xMyAxNToyNjo1NCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0xMyAxNDoyNjo1NCArMDAwMA==
  content: ! '<p>Err,</p>


    <p>Nice guide to setting up a zone. I wasn''t sure what you meant when you said:
    "Next up we need to create a stanza for the Rails application zone." Do you make
    that change in the named.conf file or the rndc.conf file?</p>


    <p>A good intro to setting up zones is <a href="http://www.onlamp.com/pub/a/mac/2003/04/15/bind.html"
    rel="nofollow">Implementing BIND on Mac OS X</a>. it would indicate that the answer
    to my above question is the named.conf file, ja?</p>'
- id: 677
  author: Using a local nameserver on Mac OS X &laquo; Gated Logic
  author_email: ''
  author_url: http://nevali.wordpress.com/2006/12/15/using-a-local-nameserver-on-mac-os-x/
  date: !binary |-
    MjAwNi0xMi0xNSAxNDowNjo1NCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0xNSAxMzowNjo1NCArMDAwMA==
  content: ! '<p>[...] If you&#8217;ve followed most guides floating around on the
    Web (such as this one) for configuring a local nameserver on Mac OS X, you&#8217;ll
    more than likely be quite happy: you went into System Preferences and set your
    DNS server IP to 127.0.0.1 so that your server is used instead of your local network&#8217;s
    or your ISP&#8217;s. [...]</p>'
- id: 678
  author: Matthias
  author_email: mp@webfactory.de
  author_url: http://www.webfactory.de
  date: !binary |-
    MjAwNy0wMS0xMSAxMDowNzoyMCArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0xMSAwOTowNzoyMCArMDAwMA==
  content: ! '<p>Thanks for writing this down -- we''re using the same approach for
    development and I just set this up on my new MacBook yesterday. Too bad I did
    not google first, but good to know I did it like you :) Only we''re using ".here."
    for local development domains and I added "listen-on { 127.0.0.1; };" to the config
    (yes, I''m a little paranoid).</p>


    <p>Unfortunately I forgot to make a backup copy of the named.conf that came with
    the OS. Is it set up to provide DNS recursion and does not need any forwarders?
    Altough that''s not so nice (because it does not use the DNS setup your environment
    provieds) it seems to be the only way of making the setup independent enough to
    use it in different networks (company, at home) without modification.</p>


    <p>One last thing I was unsure about: I added 127.0.0.1 as a DNS server in the
    TCP/IP preferences, but found that when DHCP provides a name server both will
    make it into /etc/resolv.conf. However, it seems as if "my" one will always be
    the first server entry there and (see man 5 resolver) the servers will be tried
    in order, taking the second preference only when the first one times out.</p>


    <p>Happy hackin'' :)</p>


    <p>Matthias</p>'
- id: 679
  author: Matthias
  author_email: mp@webfactory.de
  author_url: http://www.webfactory.de
  date: !binary |-
    MjAwNy0wMS0xMSAxMDoxNDoxMyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0xMSAwOToxNDoxMyArMDAwMA==
  content: ! '<p>Oh, forgot: I''m also using Parallels desktop with shared networking.
    Using this setup, the ".here." local domains work in the guest OS as well :)</p>


    <p>Modifying /etc/hosts (see http://theappleblog.com/2006/11/21/how-to-setup-development-domains-on-os-x/)
    not only requires you to always keep the file up-to-date, but you will also need
    to keep the guest OS (WinXP) hosts file in sync.</p>'
- id: 680
  author: Pim
  author_email: pim@pimz.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0zMSAxMzoxMDo1MiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0zMSAxMjoxMDo1MiArMDAwMA==
  content: ! '<p>Couldn''t get this to work initially: /usr/sbin/lwresd has to be
    running, and it''s not by default on my 10.4 install. Does it on your system Mathie?
    Anyway, I got it up and running, but somehow can''t send email anymore: the 127.0.0.1
    DNS lookup seems to hinder getting my email client to get in touch with SMTP servers.
    Hints welcome.</p>'
- id: 681
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNy0wNS0yOCAxNToxNzo0NyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNS0yOCAxNDoxNzo0NyArMDEwMA==
  content: ! '<p>CpILL: Yeah, that should be the named.conf file.  I''ll update the
    text to make that a little more clear.  Thanks!</p>


    <p>Matthias: With the configuration as above, the DNS server will act as a caching,
    recursive name server.  It will directly query what it reckons are the root servers
    and cache the results.  This gives it network location independence, which is
    nice.  But it might make name lookups a little slower than they''d normally be.  I
    can''t say it''s bothered me too much so far (though I have had to reload my name
    server when it''s cached a bad record for one reason or another).</p>


    <p>Pim: <code>lwresd</code> is not currently running on my system and it''s working
    fine.  I think (I can''t remember for sure offhand, because it''s been a while
    since I''ve used it) that <code>lwresd</code> serves a separate purpose, acting
    as a dedicated caching-only nameserver for client applications when the system
    uses <code>libnss-lwres</code>.  It''s not normally used on Mac OS X as far as
    I can tell.  (Unless you''ve been messing with your <code>/etc/nsswitch.conf</code>?)</p>'
- id: 682
  author: jon
  author_email: jon@mailinator.com
  author_url: ''
  date: !binary |-
    MjAwNy0wNi0xMiAxNjoxNTo1OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wNi0xMiAxNToxNTo1OSArMDEwMA==
  content: <p>How about using dnsenabler ( http://cutedgesystems.com/software/dnsenabler/
    ) or dnsmasq ( http://osx.hyperjeff.net/Apps )?</p>
- id: 683
  author: ! 'ror blog &raquo; Blog Archive &raquo; [Rails] Re: Managing subdomains
    for users'
  author_email: ''
  author_url: http://www.ror.cz929.com/?p=10907
  date: !binary |-
    MjAwNy0xMC0wMSAwMTowNzoyMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0wMSAwMDowNzoyMCArMDEwMA==
  content: ! '<p>[...] If you want to be able to do this on your local machine (and
    you&#8217;re on a Mac), you can follow these instructions: http://woss.name/2006/11/13/setting-up-local-name-server-on-mac-os-x/
    [...]</p>'
- id: 684
  author: GSIY &#8230; Ruby-Rails Portal
  author_email: ''
  author_url: http://www.gsiy.com/articles/re-managing-subdomains-for-users-2/
  date: !binary |-
    MjAwNy0xMC0wMyAwNDozNDozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0xMC0wMyAwMzozNDozMyArMDEwMA==
  content: ! '<p>[...] http://agilewebdevelopment.com/plugins/account_location  And
    you&#8217;ll need to configure your dns with a wildcard domain (*.yourdomain.com)  If
    you want to be able to do this on your local machine (and you&#8217;re on a Mac),
    you can follow these instructions: http://woss.name/2006/11/13/setting-up-local-name-server-on-mac-os-x/
    [...]</p>'
- id: 685
  author: rasta
  author_email: sp3ctr3@mail.ru
  author_url: ''
  date: !binary |-
    MjAwOC0wNS0xMiAyMjo0MTo0NyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0xMiAyMTo0MTo0NyArMDEwMA==
  content: <p>Great article. Thanks a lot</p>
- id: 686
  author: My Mac Sucks
  author_email: mymacsucks@livejournal.com
  author_url: http://mymacsucks.livejournal.com
  date: !binary |-
    MjAwOC0wNi0wMiAwMzoxMjo1MiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNi0wMiAwMjoxMjo1MiArMDEwMA==
  content: ! '<p>The last batch of Apple Updates (installed just now) forced a restart.
    When I did so, the nameserver didn''t come back up.</p>


    <p>I manually started named... but I have no idea what went wrong, or if it will
    work in the future. I wonder what they changed?</p>'
- id: 687
  author: Netsensei &raquo; Blog Archief &raquo; Bookmarks van September 2nd tot September
    6th
  author_email: ''
  author_url: http://www.netsensei.nl/archives/bookmarks-van-september-2nd-tot-september-6th/
  date: !binary |-
    MjAwOC0wOS0wNyAwMjowMDoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wOS0wNyAwMTowMDoyMiArMDEwMA==
  content: <p>[...] Setting up a local name server on Mac OS X - [...]</p>
- id: 688
  author: Subdomains and rails &laquo; Jabberwocky
  author_email: ''
  author_url: http://elisehuard.wordpress.com/2008/10/08/subdomains-and-rails/
  date: !binary |-
    MjAwOC0xMC0wOCAxOToxNDoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0wOCAxODoxNDoyMiArMDEwMA==
  content: ! '<p>[...] in the /etc/hosts (at least it will not listen). The life saver
    here was the following link : setting up your own DNS server locally on your [...]</p>'
- id: 689
  author: ! 'nathan hammond :: New Mac - DNS (BIND), Part 1'
  author_email: ''
  author_url: http://nathanhammond.com/new-mac-dns-bind-part-1
  date: !binary |-
    MjAwOC0xMC0yOCAxOTo0NzowOCArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0yOCAxODo0NzowOCArMDAwMA==
  content: <p>[...] It needs to be configured and linked into the BIND configuration
    file. Using some code I found at the most helpful place on the net for what I'm
    trying to accomplish with one addition, I ran this:rndc-confgen &gt; /etc/rndc.confhead
    -n5 /etc/rndc.conf |tail -n4 &gt; [...]</p>
---
I've been using
[`account_location`](http://dev.rubyonrails.org/svn/rails/plugins/account_location/)
for a couple of applications recently. It's a really nice way to give
individual 'clients' of an application their own domain and when we come to
scaling up, it's a really easy way of splitting customers across several
hosts. So, yeah, very nice. And it's dead easy to deploy in the first instance
-- a couple of DNS records along the lines of:

    @ IN A 1.2.3.4
    * IN A 1.2.3.4

There you go, every host in that domain points to 1.2.3.4.

However, it's a pest for setting up in your development environment. OK, so
you can edit `/etc/hosts` and add an entry for every single account you happen
to create. This hinders development for me -- each domain *has* to be unique,
so whenever I want to create a new account, I have to do so in Rails, *and* in
`/etc/hosts`. It's also irritating when I'm having to maintain an `/etc/hosts`
file on multiple machines. Unfortunately, the hosts file doesn't support
wildcard records, so we *have* to put every single entry in.

I'm sure there's a better solution on Mac OS X -- maybe there's something smart I could do with the NetInfo database, or maybe I could play with [Bonjour](http://www.apple.com/macosx/features/bonjour/) in some way -- but the easiest thing for me was to set up a name server on my local machine.  It's really dead simple.  Handily enough, [BIND](http://www.isc.org/index.pl?/sw/bind/) is already installed in the base system, just not configured and switched on.  So we just have to do a little configuration.  First of all, create the `rndc` configuration to control the name server:

    mathie@bowmore:mathie$ sudo -s
    bowmore:/Users/mathie root# rndc-confgen > /etc/rndc.conf
    bowmore:/Users/mathie root# head -n5 /etc/rndc.conf |tail -n4 > /etc/rndc.key

This creates a key in `/etc/rndc.conf` which allows the `rndc` client to talk to the name server and control it.  We then need to tweak the server configuration a little.  In the controls section, change the port from `54` to `953` (I don't know why it's different by default, since it doesn't seem to work!).  Next up we need to create a stanza in `/etc/named.conf` for the Rails application zone.  Add something along the lines of:

    zone "rails" IN {
            type master;
            file "rails.zone";
            allow-update { none; };
    };

around the other zone stanzas.  Save that and move on.  Next thing is to create `/var/named/rails.zone`.  I started by copying the default `localhost.zone`, winding up with something along the lines of:

    $TTL    86400
    $ORIGIN rails.
    @                       1D IN SOA       @ root (
                                            42              ; serial (d. adams)
                                            3H              ; refresh
                                            15M             ; retry
                                            1W              ; expiry
                                            1D )            ; minimum

                            1D IN NS        @
                            1D IN A         127.0.0.1

    *.app1 IN A 127.0.0.1
    *.app2 IN A 127.0.0.1

Save that and quit.  Finally, we need to convince BIND to start up at boot.  Since I'm on Tiger, we have the benefit of `launchd` to handle such mundane tasks.  Simply run:

    mathie@bowmore:mathie$ sudo launchctl load -w /System/Library/LaunchDaemons/org.isc.named.plist

BIND will start now, and will automatically start from now on at launch.  if you're on anything older, I gather it's a case of adding:

    DNSSERVER=-YES-

to `/etc/hostconfig`.  You can then restart your computer for it to take effect (it would be a good idea to verify it works) or cheat and run:

    sudo /usr/sbin/named

to start it for now.

Finally, you need to tell your computer to *use* the newly setup name server.  In System Preferences, go to the Network pane.  For every one of the connections you use, in every one of the locations you have set up, go to the TCP/IP settings and add `127.0.0.1` as the first DNS server.

Now every time you do a lookup for `foo.app1.rails`, `bar.app2.rails` or, well, anything at either domain, it will resolve to 127.0.0.1.  So you can happily browse to <http://rubaidh.app1.rails:3000/> and `account_subdomain` will be set to 'rubaidh'.  Neat, huh?
