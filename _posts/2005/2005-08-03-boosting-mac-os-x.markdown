---
layout: post
title: Boosting Mac OS X
excerpt: ! 'I''ve been mucking around with <a href="http://www.boost.org/" title="Boost
  C++ Library">Boost</a> over the past couple of evenings to see if I can get it setup
  on my laptop and get back into a bit of C++ development.  I''ve succeeded, but it
  wasn''t as simple as I''d thought.  Well, I suppose it could have been, but I also
  decided to figure out <a href="http://www.boost.org/tools/build/v2/index.html" title="Boost
  Build System v2">Boost.Build</a>.  BTW, a prerequisite for all the following is
  that the Apple <a href="http://developer.apple.com/" title="Apple Developer Tools">Developer
  Tools</a> installed.


'
date: 2005-08-03 20:30:50 +01:00
categories:
- Geekery
---
I've been mucking around with <a href="http://www.boost.org/" title="Boost C++ Library">Boost</a> over the past couple of evenings to see if I can get it setup on my laptop and get back into a bit of C++ development.  I've succeeded, but it wasn't as simple as I'd thought.  Well, I suppose it could have been, but I also decided to figure out <a href="http://www.boost.org/tools/build/v2/index.html" title="Boost Build System v2">Boost.Build</a>.  BTW, a prerequisite for all the following is that the Apple <a href="http://developer.apple.com/" title="Apple Developer Tools">Developer Tools</a> installed.

<a id="more"></a><a id="more-22"></a>

Part of the trouble is that the released version of Boost doesn't support Mac OS X 10.4 out the box.  The new version of gcc it ships with (4.0) no longer has the <code>-fcoalesce-templates</code> flag, which the Boost build system automatically passes in.  It wasn't <em>that</em> difficult to figure out how to modify the Darwin toolset to fiddle the flags, but I decided to grab the CVS version anyway:

{% highlight bash %}
mathie@Tandoori:tmp$ cvs -d :pserver:anonymous@cvs.sourceforge.net:/cvsroot/boost login
Logging in to :pserver:anonymous@cvs.sourceforge.net:2401/cvsroot/boost
CVS password:
mathie@Tandoori:tmp$ cvs -z3 -Q -d :pserver:anonymous@cvs.sourceforge.net:/cvsroot/boost co boost
mathie@Tandoori:tmp$ export BOOST_ROOT=`pwd`/boost
mathie@Tandoori:tmp$ export BOOST_BUILD_PATH=${BOOST_ROOT}/tools/build/v2
{% endhighlight %}

which builds nice and cleanly.  (Setting <code>$BOOST_ROOT</code> is just handy at this point so I can give you 'working' commands next up.  It's needed later anyway, as is <code>$BOOST_BUILD_PATH</code>.)  Next up is to build the Boost version of jam and stick it in <code>/usr/local/bin</code>:

{% highlight bash %}
mathie@Tandoori:tmp$ cd ${BOOST_ROOT}/tools/build/jam_src/
mathie@Tandoori:jam_src$ ./build.sh
[ ... build output ... ]
mathie@Tandoori:jam_src$ sudo cp bin.macosxppc/bjam /usr/local/bin/bjam
{% endhighlight %}

Now we have the basic build tools required and it's time to build Boost itself.  This is where what I've done diverges from the instructions I'm about to write.  I've got my own installation of Python 2.4, where the default Python on Mac OS X 10.3 and 10.4 is 2.3.x.  So, if you see a mention of 2.4, it's a typo. :-)  So, do the following (which, on my Powerbook 1.67GHz running on batteries, took about an hour or so):

{% highlight bash %}
mathie@Tandoori:jam_src$ cd $BOOST_ROOT
mathie@Tandoori:boost$ PYTHON_VERSION=2.3 bjam -sTOOLS=darwin \
  --with-python-root=/System/Library/Frameworks/Python.framework/Versions/Current/ \
  stage
Building Boost.Regex with the optional Unicode/ICU support disabled.
Please refer to the Boost.Regex documentation for more information
(and if you don't know what ICU is then you probably don't need it).
...patience...
[ ... more build output ... ]
{% endhighlight %}

Unless ICU is an Intensive Care Unit, I'm not too worried about it, so I ignored that warning.  This will have the built libraries sitting in <code>${BOOST_ROOT}/stage/lib</code>, and that's where they'll stay for now.  Now, before we try building our own projects, there are a couple of bits of configuration needed.  First up is to edit <code>${BOOST_BUILD_PATH}/user-config.jam</code> and add the following to somewhere near the top:

{% highlight bash %}
using darwin ;
{% endhighlight %}

I've created an extra file for Boost.build v2 so that using Boost is easier.  I'm not a Jam expert, so it's probably very wrong, but it does <em>appear</em> to work.  Take <a href="/dist/boost.jam" title="Using Boost.build for applications with Boost">boost.jam</a> and place it in <code>${BOOST_BUILD_PATH}/tools/boost.jam</code>.  Now let's create ourselves a very quick project to demo it works.  Create a directory to put the project in, change to that directory and create an empty file to tell Jam this is the project root:

{% highlight bash %}
mathie@Tandoori:tmp$ mkdir boostdemo
mathie@Tandoori:tmp$ cd boostdemo
mathie@Tandoori:boostdemo$ touch project-root.jam
{% endhighlight %}

Now create a very simple C++ program, <code>boostdemo.cc</code>, using the Boost unit test library (just to show that we can successfully link to shared libraries too!):

{% highlight cpp %}
#include <boost/test/unit_test.hpp>

using boost::unit_test::test_suite;

void free_test_function()
{
  BOOST_CHECK(2 == 1);
}

test_suite*
init_unit_test_suite(int, char *[])
{
  test_suite *test = BOOST_TEST_SUITE("Unit test example 1");

  test->add(BOOST_TEST_CASE(&free_test_function), 1);
  return test;
}
{% endhighlight %}

And create a file called <code>Jamfile</code> containing the following:

{% highlight bash %}
using boost ;
exe boostdemo : boostdemo.cc /boost//unit_test_framework ;
{% endhighlight %}

I should warn you that spaces are quite significant in Jam files.  For instance, the ':' and ';' must be surrounded by whitespace, or you'll get odd errors about something being 'gristed'...  But, if you've followed these instructions carefully, and with a spot of luck, you should be able to build and run the demo:

{% highlight bash %}
mathie@Tandoori:boostdemo$ bjam
...patience...
...found 300 targets...
...updating 5 targets...
MkDir1 bin
MkDir1 bin/darwin
MkDir1 bin/darwin/debug
darwin.compile.c++ bin/darwin/debug/boostdemo.o
darwin.link bin/darwin/debug/boostdemo
...updated 5 targets...
mathie@Tandoori:boostdemo$ bin/darwin/debug/boostdemo
Running 1 test case...
boostdemo.cc(8): error in "free_test_function": check 2 == 1 failed

*** No errors detected
{% endhighlight %}

I have no idea how accurate these instructions are, nor how they'll cope with building production applications for distribution, but so far they're working for me, and it's been an interesting learning experience figuring out how Jam works.  I think I'd like to persevere with it.

Next up?  Figuring out how to build <a href="http://www.trolltech.com/products/qt/index.html" title="Trolltech's Qt 4">Qt</a> version 4, which, I'm hoping will provide me with a decent C++ GUI framework...
