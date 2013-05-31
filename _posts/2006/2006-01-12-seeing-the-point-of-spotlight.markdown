---
layout: post
title: Seeing the point of Spotlight
date: 2006-01-12 09:59:37 +00:00
categories:
- Geekery
---
After having used Mac OS X 10.4 since within days of its release, and having gotten to the stage of <em>turning off</em> [Spotlight](http://www.apple.com/macosx/features/spotlight/) as I was aware of how much CPU time <code>mds</code> and <code>mdimport</code> were uselessly consuming, I have finally found a use for it.  (It was re-enabled when I reinstalled my laptop and I thought I'd leave it for a while, just to see if it grew on me.)

Back story:  I have all my iTunes music library stored on my iMac at home.  There's not enough space on my laptop to cope with the 46GB of music it contains.  But I'd like some tunes on my laptop.  How to copy a selection across?  Well, for performance (and backup, I suppose) reasons, I dumped the lot onto a Firewire drive.  But how to retrieve all the music I would like on my laptop?

I have also been diligent in tagging music when I import it.  In the comments field of the MP3 file, there is some more structured data.  First of all, there's the field 'Owner', which contains a moniker for the original owner of the CD ('mathie' for me, 'dad' for stuff I've chowned from my dad, 'ibbs' for Annabel's CDs, etc).  Secondly there's a 'Type' field, which specifies whether it's an album or a single.

So, let's open up a Finder window and start the search.  I'm searching for 'Comment' contains 'owner: mathie', 'Comment' contains 'type: album' and constraining the search to the iTunes music folder on the Firewire drive:

<a href="http://woss.name/wp-content/iTunesMusicSearch.png"><img src='/wp-content/thumb-iTunesMusicSearch.png' alt='iTunes Music Search in the Finder' class='centered' /></a>

It's producing all the right results, so lets save that and go on to the next stage.  Open up iTunes, and choose File -> Add to Library...  Here's the trick.  You can select your saved search and it will show all the results in the Open dialog, but if you select 'Choose' at this point, nothing will happen.  So Spotlight searches don't behave <em>exactly</em> like folders.  Oh well.  Instead, select all the files shown (I did that by clicking on the first file, then hitting apple-a to 'Select All') and hit import.  Tada!  You're now importing all the MP3s that are tagged in that way.

So, having found a use for Spotlight, I'm going to leave it switched on this time, see if it can give me some inspiration to achieve other tasks.
