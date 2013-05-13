---
layout: post
status: publish
published: true
title: Getting pp to return a string
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2006-04-13 09:53:07.000000000 +01:00
categories:
- Geekery
tags: []
comments: []
---
From a discussion this morning, I hacked together a version of `pp` that returns a string, rather than printing to `stdout`.  This means you can use it nicely to dump out inside, say, a web page on rails, or to a logger object.

    require 'pp'
    require 'stringio'

    module Kernel
      private
      def pp_s(*objs)
          s = StringIO.new
          objs.each {|obj|
            PP.pp(obj, s)
          }
          s.rewind
          s.read
      end
      module_function :pp_s
    end
