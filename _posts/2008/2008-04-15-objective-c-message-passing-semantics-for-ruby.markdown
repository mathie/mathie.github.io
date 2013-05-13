---
layout: post
status: publish
published: true
title: Objective-C message passing semantics for Ruby
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 481
wordpress_url: http://woss.name/?p=481
date: 2008-04-15 16:11:07.000000000 +01:00
categories:
- Geekery
- Mac OS X
- Ruby and Rails
tags: []
comments:
- id: 1006
  author: Bruce
  author_email: bruce@codefluency.com
  author_url: http://codefluency.com
  date: !binary |-
    MjAwOC0wNC0xNSAxNzoxNToxMCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xNSAxNjoxNToxMCArMDEwMA==
  content: <p>This reminds me a lot of a post I made about the ? operator in Io --
    remarkably similar issue; http:&#47;&#47;codefluency.com&#47;articles&#47;2006&#47;12&#47;16&#47;that-nifty-question-mark<&#47;p>
- id: 1007
  author: Matthijs Langenberg
  author_email: mlangenberg@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNC0xNSAxODo1MzowOSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xNSAxNzo1MzowOSArMDEwMA==
  content: <p>This is just stupid. Good luck searching bugs with this code.<&#47;p>
- id: 1008
  author: Leon
  author_email: leon.spencer@gmail.com
  author_url: http://chaoseffect.com
  date: !binary |-
    MjAwOC0wNC0xNiAwNzozMjoxOSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xNiAwNjozMjoxOSArMDEwMA==
  content: ! "<p>Instead of going ape-crazy and making it affect all method calls,
    why not just go:<&#47;p>\n\n<pre><code>class Object\n  def gingerly method, *args\n
    \   respond_to? method ? send(method, args) : nil\n  end\nend\n<&#47;code><&#47;pre>\n\n<p>This
    way, every object you now have can be asked to do something gingerly:<&#47;p>\n\n<pre><code>muffin.gingerly
    :wash, :with => :soap # => nil\n\"abc\".gingerly :kiss #=> nil\ncaramel + 5 #=>
    nil\n5 + 5#=> 10\n<&#47;code><&#47;pre>\n\n<p>You wont affect pre-existing methods
    and modules, but you still get delicious convenience. Or even:<&#47;p>\n\n<pre><code>class
    BashfulMaiden\n  def initialize(obj)\n    @obj = obj\n  end\n  def method_missing(method,
    *args)\n    @obj.respond_to? method ? @obj.call(method,args) : nil\n  end\nend\n<&#47;code><&#47;pre>\n\n<p>And
    then:<&#47;p>\n\n<pre><code>class Object\n  def bashfully\n    BashfulMaiden.new(self)\n
    \ end\nend\n<&#47;code><&#47;pre>\n\n<p>This way, you won't pollute method missing
    for everyone, <em>and<&#47;em> you can do regular calls without having to do symbols,
    like so:<&#47;p>\n\n<pre><code>muffin.bashfully.wash 12\nicecream.bashfully.lick\n5.bashfully
    + 5\n<&#47;code><&#47;pre>\n\n<p>And so forth. By all means, Ruby is an expressive
    wonderland of pleasure, but just with other expressive wonderlands of pleasure,
    you want to use protection so you don't make a mess.<&#47;p>"
- id: 1009
  author: Graeme Mathieson
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwOC0wNC0xNiAwODo0MDoyNSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNC0xNiAwNzo0MDoyNSArMDEwMA==
  content: <p>Just to be clear; I wasn't advocating actually doing this, just noting
    that it was possible. :-)  If you actually want semantics like this, then @Leon's
    comment is a sane way to get it.  The key thing it does is that it makes it explicit
    to the reader of the code that you're wanting those semantics.  My insane version
    will trip up any other programmer that touches your application!<&#47;p>
---
While I was writing a bit of code today (which smells a bit and so I suspect needs revisiting in the future, but anyway) I found myself writing the equivalent of:

    object.respond_to?(method) ? object.send(method, args) : nil

that is, if a particular object implements a method then please call it and let me know what it returns, otherwise just pretend I never asked and return `nil`.  While mulling over the `git diff`, it occurred to me that is (if I remember correctly) exactly how Objective-C behaves by default with message passing.

And so could Ruby:

    Kernel.module_eval do
      def method_missing(*args, &block)
        nil
      end
    end

I am in no way advocating this as not being insane (a number of projects rely on the existing default `method_missing` implementation which raises an exception), but it is possible. :-)

Let's see it in action in irb.  Before:

    irb(main):001:0> o = Object.new
    => #<object:0x30b164>
    irb(main):002:0> o.method_that_does_not_exist
    NoMethodError: undefined method `method_that_does_not_exist' for #<object:0x30b164>
	    from &#47;Users&#47;mathie&#47;.irbrc:210:in `method_missing'
	    from (irb):2

And after:

    irb(main):008:0> o = Object.new
    => #<object:0x4fbb4>
    irb(main):009:0> o.method_that_does_not_exist
    => nil

Could be useful if Objective-C is your hammer and you find yourself trying to use Ruby as a hammer instead?
