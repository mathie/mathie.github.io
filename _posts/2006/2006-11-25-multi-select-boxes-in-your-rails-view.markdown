---
layout: post
title: Multi-select boxes in your rails view
date: 2006-11-25 14:43:59 +00:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
---
It seems like, in current Rails, there's not a very helpful helper around to give you select boxes which allow multiple items to be selected.  So I present you with one:

      def collection_select_multiple(object, method,
                                     collection, value_method, text_method,
                                     options = {}, html_options = {})
        real_method = "#{method.to_s.singularize}_ids".to_sym
        collection_select(
          object, real_method,
          collection, value_method, text_method,
          options,
          html_options.merge({
            :multiple => true,
            :name => "#{object}[#{real_method}][]"
          })
        )
      end

And now it all works by magic -- in my case the current categories that an article has are selected when the edit page comes up, and any changes are correctly saved back to the db.  But it's not nice enough.  There's still a lot of ugly code in the view.  Let's tidy things up by adding another helper:

      def collection_select_multiple_categories(object, method,
                                                options = {}, html_options = {})
        collection_select_multiple(
          object, method,
          Category.find(:all), :id, :title,
          options, html_options
        )
      end

Now the call in the view looks like:

    <%= collection_select_multiple_categories :article, :categories %>

Ah, doesn't that look *much* more like what we're used to?
