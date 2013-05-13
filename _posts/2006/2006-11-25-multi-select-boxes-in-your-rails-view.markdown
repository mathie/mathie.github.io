---
layout: post
status: publish
published: true
title: Multi-select boxes in your rails view
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 358
wordpress_url: http://woss.name/2006/11/25/multi-select-boxes-in-your-rails-view/
date: 2006-11-25 14:43:59.000000000 +00:00
categories:
- Geekery
- Ruby and Rails
tags:
- Geekery
- Ruby and Rails
comments:
- id: 718
  author: bobes
  author_email: vladimir.tuzinsky@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMS0yNSAxOTo0NTowNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yNSAxODo0NTowNSArMDAwMA==
  content: <p>Oh, beautiful :) I'm going to bookmark the post, the helper might be
    useful in a near future :) Thanks<&#47;p>
- id: 719
  author: Sandro Paganotti
  author_email: sandro@railsonwave.com
  author_url: http://www.railsonwave.com
  date: !binary |-
    MjAwNi0xMS0yNiAxMToxNjo0NyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yNiAxMDoxNjo0NyArMDAwMA==
  content: ! '<p>It''s a really well made piece of code ! :)

    Just a question: you use a Category.find(:all) in the code, by this way you need
    to create another helper if you''re using a collection that is different from
    Category.find(:all).

    Maybe isn''t better to add another arg to "collection_select_multiple_categories"
    ?

    Doing so you can specify time to time what is the collection you want to use.<&#47;p>'
- id: 720
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMS0yNiAxMTo1OTowOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yNiAxMDo1OTowOSArMDAwMA==
  content: ! "<p>Sandro:  That's effectively what the first helper has become.  You
    can call it along the lines of:<&#47;p>\n\n<pre><code><%= collection_select_multiple
    :article, :categories,\n        Category.find(:all), :id, :title %>\n<&#47;code><&#47;pre>\n\n<p>in
    your view and it will do the right thing.  I just like the idea of taking as much
    as possible out of the view...<&#47;p>"
- id: 721
  author: dagny
  author_email: dagnygromer@gmail.com
  author_url: http://www.actionshootingscores.com
  date: !binary |-
    MjAwNi0xMS0yNiAxNzowMDoxNyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yNiAxNjowMDoxNyArMDAwMA==
  content: <p>When the name ends with "[]", the html gets a warning from the tidy
    validator. Also, these names can't be referenced in javascript as "[]" indicates
    array to js.<&#47;p>
- id: 722
  author: mathie
  author_email: mathie@rubaidh.com
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMS0yNiAxODoxMzo0MiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yNiAxNzoxMzo0MiArMDAwMA==
  content: ! '<p>dagny: Yeah, but that''s the rails idiom for these things.  As for
    referencing them, don''t you use the <code>id<&#47;code> rather than the <code>name<&#47;code>?  Rails
    does the right thing and, in my particular example, calls the id <code>article_category_ids<&#47;code>.<&#47;p>


    <p>FWIW, the <a href="http:&#47;&#47;validator.w3.org&#47;" rel="nofollow">W3C
    Validator<&#47;a> doesn''t seem too fussed about the name having a ''[]'' in it.<&#47;p>'
- id: 723
  author: Jamie Hill
  author_email: jamie@thelucid.com
  author_url: http://www.thelucid.com
  date: !binary |-
    MjAwNi0xMS0yNyAxMTozNjoxNSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0yNyAxMDozNjoxNSArMDAwMA==
  content: <p>Nice helper. However, I would tend to go for a list of checkboxes in
    this scenario, you can still use the "name[]" kind of field naming.<&#47;p>
- id: 724
  author: onur
  author_email: emperon@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0xMi0wNSAxMDozNzo1MyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0wNSAwOTozNzo1MyArMDAwMA==
  content: ! "<p>This doesn't compile for me.  I think<&#47;p>\n\n<p>collection_select(\n
    \     object, real_method,\n      collection, value_method, text_method,\n      options,\n
    \     html_options.merge({<&#47;p>\n\n<p>the above part should be as below<&#47;p>\n\n<p>collection_select(\n
    \     object, method,\n      collection, value_method, text_method,\n      options,\n
    \     html_options.merge({<&#47;p>\n\n<p>Also this doesn't work on edit mode (doesn't
    give preselected items hightlighted<&#47;p>"
- id: 725
  author: Akhil Bansal
  author_email: bansalakhil30.10@gmail.com
  author_url: http://webonrails.com
  date: !binary |-
    MjAwNi0xMi0yOCAwODowMDoyNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMi0yOCAwNzowMDoyNiArMDAwMA==
  content: ! '<p>Thanks Mathie,

    I am using your method for multi-selection box.

    It is working fine..

    ;-)<&#47;p>'
- id: 726
  author: anne
  author_email: ann.glowtouch@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMS0yNCAwODoxODo1NiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMS0yNCAwNzoxODo1NiArMDAwMA==
  content: ! '<p>Hey cud u help me please.. I am a beginner for ruby on rails trying
    to develop a shopping cart cud u point me the rite tutorials which will help me
    understand things better

    Thanks..<&#47;p>'
- id: 727
  author: Andy
  author_email: prd@andylima.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMy0wNiAwMTowMjowNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMy0wNiAwMDowMjowNiArMDAwMA==
  content: ! '<p>Hi Graeme,<&#47;p>


    <p>Thanks very much for this!<&#47;p>


    <p>But, with this method I can''t unselect all categories in the form -- I mean,
    if I chose one previously, then I can''t unchose it (without choosing another
    one).<&#47;p>


    <p>Can you confirm this?<&#47;p>


    <p>And, if this is a bug, how would one go about fixing it?<&#47;p>


    <p>TIA<&#47;p>'
- id: 728
  author: Andy
  author_email: prd@andylima.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMy0wNiAwMTozOTo1OSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMy0wNiAwMDozOTo1OSArMDAwMA==
  content: ! '<p>ok, got it -- it''s an option f select[xxx] methods<&#47;p>


    <p>thanks again f this great helper!<&#47;p>'
- id: 729
  author: john
  author_email: crazylunjay@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMy0yNCAyMjowNTo1NyArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMy0yNCAyMTowNTo1NyArMDAwMA==
  content: ! '<p>The code for the view works very well but due to the fact that the
    attribute name is pluralised in my case its interest_id_ids I can''t seem to save
    the records to the particular model.<&#47;p>


    <p>Please help<&#47;p>'
- id: 730
  author: amit hasija
  author_email: amit.hasija@vinove.com
  author_url: ''
  date: !binary |-
    MjAwNy0wMy0yOCAxMDo0Mzo1OSArMDEwMA==
  date_gmt: !binary |-
    MjAwNy0wMy0yOCAwOTo0Mzo1OSArMDEwMA==
  content: ! "<p>sir,<&#47;p>\n\n<p>i am having problems while using collection_select,i
    want to know how to use the selected value option in colletion select,heres my
    code :<&#47;p>\n\n<p><%= collection_select(:template_1, :templates_id,\n                                    Template.find(:all,:joins=>\"right
    join user_templates on user_templates.template_id = templates.id inner join users
    on users.id = user_templates.user_id\",:conditions => \"users.id='#{session[:id]}'\"
    ),:template_id, :TemplateTitle,{ :prompt => \"Select Template\"},{:name=>'template',:style
    => \"color: green\"}) %><&#47;p>"
- id: 731
  author: Jason
  author_email: jasonthompsonaz@gmail.com
  author_url: http://www.adcustomers.com
  date: !binary |-
    MjAwOC0wNS0zMCAyMToxNzoxOCArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0zMCAyMDoxNzoxOCArMDEwMA==
  content: <p>Excellent code. Thank you for sharing.<&#47;p>
- id: 732
  author: Patrick
  author_email: g0lfshark@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwOC0wOC0xNSAyMDo1MTo0NSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wOC0xNSAxOTo1MTo0NSArMDEwMA==
  content: <p>This is great! A Timesaver. Thanks!<&#47;p>
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
