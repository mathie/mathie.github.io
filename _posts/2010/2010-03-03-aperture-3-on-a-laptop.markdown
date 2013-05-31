---
layout: post
title: Aperture 3 on a laptop
date: 2010-03-03 15:41:59 +00:00
categories:
- Uncategorized
---
<p>I was awoken early last week by my laptop's hard drive making a clicking noise. The fact that I hadn't reconfigured Time Machine since installing Snow Leopard sent me into a blind panic. A quick trip to Amazon UK later, and I'd ordered a&nbsp;[2nd gen Drobo](http://www.drobo.com/products/drobo.php), along with 3&nbsp;[1TB Western Digital Caviar Green](http://www.wdc.com/en/products/Products.asp?DriveID=773)&nbsp;disks. It all turned up the next day, and the data shifting started.</p>
<p>The short version of the story is that I've now got at least two copies of everything, one on the Drobo (which should cover against particular types of failures all by itself). And the internal drive in my Macbook Pro hasn't made any funny noises since.&nbsp;<strong>phew</strong></p>
<p>A wee aside before I discuss how I've arranged Aperture 3 on my laptop in a satisfactory manner. The Drobo is&nbsp;<strong>slow</strong>. I mean,&nbsp;<strong>really slow</strong>. I'm seeing write speeds on the Mac, connected via Firewire 800, of about 25MB/s in tests. To put that in perspective, in order to fill the disk to capacity, you'd need to hang around for about 21 hours. In practice, it's even worse than that and, in particular, delete operations seem to be spectacularly slow (and, unless the Drobo is filesystem aware, I don't even know how that's possible!).</p>
<p>I had initially intended to dump my 330GB master Aperture Library on there and have a small one on the laptop while I was on the move. However, after testing, and finding Aperture to be utterly unusable (spinning beach ball for 10 seconds after every adjustment, more spinning beach balls just for scrolling through projects), I had a change of heart.</p>
<p>My current laptop is a 17" Macbook Pro from, I think, sometime in 2007. I replaced the internal drive with a 320GB one at some point. I've also got a 500GB Firewire 800 Western Digital Passport (called, imagninatively, "External") and the Drobo.</p>
<p>That makes the setup pretty straightforward, really:</p>
<ul>
<li>The Aperture library on the internal disk. It's currently clocking in at 30GB worth of metadata and previews.</li>
<li>All the master images are referenced masters, stored on the external disk. Here's the other 300GB of raw masters.</li>
<li>A vault on the Drobo.</li>
<li>Time Machine backup on the Drobo.</li>
</ul>
<p>This gives me a reasonably performant setup (as much as can be expected from a laptop, really, I think), while giving me the data protection I desire.</p>
<p>The Time Machine configuration is perhaps worth noting. As the vault is being backed up separately by Aperture, I'm excluding it from Time Machine. However, since all the master images are referenced masters, they aren't backed up as part of the vault so I'm explicitly including the external drive in the Time Machine backup.</p>
<p>Another useful tip. Sometimes I'm loading images into Aperture and I've left the external drive at home. Not a problem, they get imported as managed files rather than referenced masters. However, when I reconnect the external drive, I do want to tidy things up. I have a smart album which contains all the 'Managed' masters:</p>
<p><span class="full-image-block ssNonEditable"><span><img style="width: 450px;" src="/storage/post-images/aperture-managed-masters.jpg?__SQUARESPACE_CACHEVERSION=1267614075856" alt="" /></span><span class="thumbnail-caption" style="width: 450px;">Managed Masters smart album</span></span></p>
<p>To do this, create a new Smart Album (cmd-shift-l), remove the default set of rules and add a "File Status" rule where the status is "Managed".</p>
<p>All of your managed masters will show up in there. Next time you attach the external disk, visit that album, select all the images and relocate the masters (File -&gt; Relocate Masters...). Dead simple.</p>
<p>Of course, now that I've converged all my Aperture libraries (one on a desktop, one on a laptop and one from where I declared photographic bankruptcy a few years back), I've got a lot of sorting to di! How do you arrange your entire photographic history in Aperture?</p>
