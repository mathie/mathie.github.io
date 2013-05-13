---
layout: post
title: Oh oh oh oh, I&#039;m still alive!
date: 2005-12-14 16:35:41 +00:00
categories:
- Geekery
- Personal
- Photography
- Python
- Work
---
What, no posts in over a week?  What's happened to him?  Yeah, technically I'm still alive and here.  It's just that the combination of last minute wedding preparations, Christmas and an excess of stress at work have been keeping me insanely busy!

Just to prove I'm still here, have a snippet of a shell function to clear out all those old <a href="http://docs.rubygems.org/">RubyGems</a> you have lying around from doing a regular <code>gem upgrade</code> to get the latest version of <a href="http://www.rubyonrails.org/">Rails</a> (which has hit 1.0!  Wooo!  Party!):

[code]# Uninstall all the old versions of gems, leaving only the current
# ones.
gem_uninstall_old()
{
    gem list \
        | awk ' \
            BEGIN { FS = ",[ \t]*|[ \t]+|[ \t]*\\([ \t]*" } \
            /^([^ ]+) \(([0-9.]+),/ { print $1, $2 }' \
        | while read name version; do
            sudo gem uninstall ${name} --all --ignore-dependencies \
                --executables --version "<${version}"
        done
}[/code]

It should leave all your current gems installed, but tidy out the old versions of them (gem will quite happily allow multiple versions of a product to coexist).

Aperture is continuing to be very shiny indeed, in the odd second or two I get to play with it.  I've imported most of my photograph collection, from RAW images sat on the filesystem to my entire iPhoto library.  There's only 5,838 photographs there in total, with a library size just a shade under 30GB.  The next feature I must rave about is stacks, but I'm afraid that will have to wait for another day.  And yes, I've found one case where it's <em>really</em> slow: one of my 'projects' (the holiday in Greece) has over 2,000 photographs in it, and making any adjustments in there seems to take ages.  I guess it needs to be split into multiple projects.

I'm so looking forward to 20th December, just to be able to completely relax for the rest of the year: no work, no wedding planning, no stress.  I can catch up with my photograph collection, continue to read and learn more about photography, play with Rails properly, get back on track with GTD, clear out my inbox (replying to those several-month-old messages I still have lying around that I really mean to respond to!), reinstall Mac OS X on my laptop (there's something of a clutter on there these days with all the bits of software -- at least 3 copies of MySQL for example -- that I want to just nuke and reinstall) and spend time on 'me' things again.  (Or should that be 'us' things...? :-) )

But I'm still really excited and looking forward to the 19th too!  It's going to be so much fun!

[code]04 days, 22 hours, 21 minutes and 15 seconds left!
  which is approximately 118 hours
  which is approximately 7101 minutes
  which is approximately 426075 seconds![/code]
