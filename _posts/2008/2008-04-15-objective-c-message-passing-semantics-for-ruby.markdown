---
layout: post
title: Objective-C message passing semantics for Ruby
date: 2008-04-15 16:11:07 +01:00
categories:
- Geekery
- Mac OS X
- Ruby and Rails
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
	    from /Users/mathie/.irbrc:210:in `method_missing'
	    from (irb):2

And after:

    irb(main):008:0> o = Object.new
    => #<object:0x4fbb4>
    irb(main):009:0> o.method_that_does_not_exist
    => nil

Could be useful if Objective-C is your hammer and you find yourself trying to use Ruby as a hammer instead?
