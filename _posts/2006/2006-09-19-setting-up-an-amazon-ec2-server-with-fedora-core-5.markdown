---
layout: post
title: Setting up an Amazon EC2 server with Fedora Core 5
date: 2006-09-19 19:09:52 +01:00
categories:
- Geekery
tags:
- Geekery
---
OK, I've been playing around with [Amazon's Elastic Computing
Cloud](http://aws.amazon.com/ec2) (EC2) service over the past couple of weeks,
since it's release, and while I can't see me having any practical applications
for it just now, I think it's pretty exciting. So I'm going to create myself a
basic machine image (AMI) which will allow me to deploy
[Rails](http://www.rubyonrails.org/) applications on it. The first step in
this process, for my tastes, is to get a machine up and running, then upgrade
it to [Fedora Core 5](http://fedora.redhat.com/). This will give me a base
system with all the core components I want, already available in packaged form
(primarily Apache 2.2.2). Normally, I wouldn't have chosen Fedora Core as my
base system, but the public images are FC4 and, well, it's the path of least
resistance.

#### Creating and starting your first machine

This is all covered pretty well in the [official documentation](http://developer.amazonwebservices.com/connect/entry.jspa?externalID=354&categoryID=87)
and in this [succinct overview](http://overstimulate.com/articles/2006/08/24/amazon-does-it-again.html)
so I'm not going to bother repeating it. The only thing I'll say is that I
chose to use `IMAGE ami-68ae4b01 ec2-public-images/fedora-core4-base.manifest`
as my starting point. And it took me about five minutes or so from creating
the instance to it first booting.

#### What to do with the running machine

OK, so you've got your machine up and running. My first step was to create a
new user account so I didn't have to bother with the initial ssh key, then add
my user to `/etc/sudoers` so that I could run commands as root. Then we follow
[these instructions](http://fedoraproject.org/wiki/YumUpgradeFaq) to update to
FC5. I did:

    mathie@domu-12-31-33-00-02-5c:~$ sudo yum clean all
    [ ... ]
    mathie@domu-12-31-33-00-02-5c:~$ sudo rpm -Uhv http://download.fedora.redhat.com/pub/fedora/linux/core/5/i386/os/Fedora/RPMS/fedora-release-5-5.noarch.rpm
    [ ... ]
    mathie@domu-12-31-33-00-02-5c:~$ sudo mv /etc/yum.repos.d/fedora-extras.repo{.rpmnew,}
    [ ... ]
    mathie@domu-12-31-33-00-02-5c:~$ sudo yum update

which cleans up `yum` (completely unnecessary in this case, but it didn't
hurt), installs the new 'release' package, shifts the new version of
`fedora-extras.repo` into the right place (looks like it was disabled in the
default AMI?) and starts the update. The update itself will take a while, ask
you to confirm a few things and install something in the region of 600
packages.  I think.

When that's complete, we've now got a new version of `yum` installed (amongst
other things, of course!), so I decided to rerun the update so that it will
rebuild its caches and do anything shiny and new it wants to:

    mathie@domu-12-31-33-00-02-5c:~$ sudo yum update
    [ ... ]
    No Packages marked for Update/Obsoletion

Well, that's always a good sign.

Call me paranoid, but at this point, I'm having a look around to see what
kernel will boot next time. This might be a fundamental misunderstanding of
how EC2 works on my part, though. I can't find anything on what grub tries to
boot by default, so I'm hoping that's really configured outside of my
user-space. We'll see if the AMI I'm about to create actually works!

Next I'm going to do my other personal step: install subversion and check out
my home directory. (I store my home directory in subversion, including my
configuration for Amazon EC2, so it makes my life easier at this point. You'll
have to muck around with setting environment variables to get the command line
tools working, as documented [here, in the getting started guide](http://docs.amazonwebservices.com/AmazonEC2/gsg/2006-06-26/).)

It turns out that, even if you have the correct environment set,
`ec2-bundle-vol` insists that you supply the mandatory `--key` argument. The
necessary components of the EC2 command line tools for creating and uploading
images are already installed in the current AMI. However, the remainder of the
EC2 tools aren't, which I'll note the significance of below.

I already now have my AWS credentials sitting in the environment now, so
you'll probably have to start with:

    AWS_ACCESS_KEY_ID="..."; export AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY="..."; export AWS_SECRET_ACCESS_KEY
    AWS_ACCOUNT_NUMBER="...", export AWS_ACCOUNT_NUMBER

filling in your own id and secret key. The account number was non-obvious to
me at first and I screwed up the first image I created. It turns out that it's
the account number displayed as 'Account Number' at the top of the 'Account
summary' page in the AWS portal. A [forum post](http://developer.amazonwebservices.com/connect/thread.jspa?messageID=43622&#43622)
kindly pointed me to the solution, as well as suggesting that you might want
to elide the dashes for interoperability with older versions of the tools.

I created the image with:

    mathie@domu-12-31-33-00-02-5c:~$ sudo ec2-bundle-vol \
        -k $EC2_PRIVATE_KEY -d /mnt \
        -u $AWS_ACCOUNT_NUMBER -s 1536

The `-s` flag is the size (in MB) of the image to create. This is the size of
the resulting root file system (see `/dev/sda1` in your current image).
Perhaps we'll want to tweak that in a future iteration.

This takes ... a while. It will leave you with a complete image in
`/mnt/image.img` and the split versions as `/mnt/image.part.*`. Next up, we
upload it to Amazon's S3 service, with:

    mathie@domu-12-31-33-00-02-5c:~$ ec2-upload-bundle \
        -b mathie-wossname-ec2-fc5 \
        -m /mnt/image.manifest \
        -a $AWS_ACCESS_KEY_ID \
        -s $AWS_SECRET_ACCESS_KEY

It will automatically create the appropriate bucket, if necessary, do all the
encryption and upload all the image components to S3. Bear in mind that you'll
now be paying for the storage of the image which, according to my calculations
is about 275MB, so should cost something in the region of $0.04/month. I don't
think that'll break my bank. :-)

Now we need to register the image. As I mentioned above, not all of the EC2
command line tools are installed on your AMI, so you'll need to run this bit
from your local machine with the full package of tools installed. Run:

    mathie@Lagavulin:mathie$ ec2-register \
        mathie-wossname-ec2-fc5/image.manifest
    IMAGE   ami-b8a94cd1

replacing my bucket name with yours. If everything went smoothly, it will
return an AMI id. The next step is to try and create an instance with it:

    ec2-run-instances ami-b8a94cd1 -k ec2-default-keypair

replacing the AMI id with what was just returned for you by `ec2-register` and
the key id with one of the keypairs you have registered. After a while,
`ec2-describe-instances` should list the instance as running and you should be
able to ssh into it as before. The only notable difference is that it will be
running FC5 instead of FC4!

OK, so it's not a huge step, but we're all agile around here, aren't we?
Hopefully now you're comfortable with creating your own AMI and confident with
the fact that the new image will boot. The next instalment will involve
setting up a reusable Apache, mongrel and rails setup, much like is described
in [time for a grown up server](http://blog.codahale.com/2006/06/19/time-for-a-grown-up-server-rails-mongrel-apache-capistrano-and-you/)
since that's pretty much my favourite rails deployment recipe. And we'll
create an AMI for that so that deploying a new rails app, with a little
trickery from capistrano, is a turnkey solution.

#### Caveats

Of course, there's one problem. Persistence. It would appear that the local
filesystem persists across reboots, but once you halt an instance it's gone. I
discovered this the hard way, but getting partway through installing FC5 as I
was describing in this tutorial, then shutting down the machine because I
wouldn't be able to play with it for a few days. When I came back to it, it
was, well, gone. But that's what I get for not reading the instructions.

I'm not sure what the behaviour is for an instance crashing: does it reboot
and retain that 'temporary' filesystem, or is there a possibility of it just
going away?

So, we've got a problem dealing with persistent data. OK, you can use S3 for
static assets, but what about your database? Where are you going to store
MySQL's file backend? Or are you going to use another database facility
elsewhere? There is a [thread on the forum](http://developer.amazonwebservices.com/connect/thread.jspa?threadID=11796&tstart=0)
talking about database persistence, so perhaps the AWS team are cooking
something up. 'til then, it's not really a useful place to deploy Rails apps.
Still, it's fun to play with. :-)
