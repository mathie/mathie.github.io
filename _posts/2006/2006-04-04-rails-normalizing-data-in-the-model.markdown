---
layout: post
status: publish
published: true
title: ! 'Rails: Normalizing data in the model'
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 253
wordpress_url: http://woss.name/2006/04/04/rails-normalizing-data-in-the-model/
date: 2006-04-04 17:41:19.000000000 +01:00
categories:
- Geekery
- Work
tags: []
comments:
- id: 359
  author: Luke Redpath
  author_email: contact@lukeredpath.co.uk
  author_url: ''
  date: !binary |-
    MjAwNi0wNC0wNCAyMjoyNDozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0wNCAyMToyNDozMyArMDEwMA==
  content: ! "<p>mathie, in the case of your measurement example, I'd say that a measurement
    sounds like a (separate) value object. Keep all the checks/conversions out of
    your model and create a new instance of a Measurement object based on the two
    values you do know - the measurement value and the measurement unit. I'm imagining
    something like this (implementation of the Measurement class left out):</p>\n\n<p>class
    Measurement\n  def initialize(value, unit); end;</p>\n\n<p>def to_cm; end;\n  def
    to_mm; end;\n  # etc...\nend</p>\n\n<p>class MyModel\n  before_save :convert_height_to_mm</p>\n\n<p>def
    height=(value, unit)\n    write_attribute(:height, Measurement.new(value, unit))\n
    \ end</p>\n\n<p>def height\n    # we know the database value is stored in millimeters\n
    \   db_height = read_attribtue(:height)\n    Measurement.new(db_height, :mm)\n
    \ end</p>\n\n<p>private\n    def convert_height_to_mm\n      write_attribute(:height,
    self.height.to_mm)\n    end\nend</p>\n\n<p>I'm kind of thinking on my feet here
    but something like the above should work. When you create the height attribute,
    its created as a Measurement object. When you retrieve the height value, its returned
    to you as a Measurement object. But just before the record is saved, the value
    to be stored in the database is set as the value in millimetres.</p>"
- id: 360
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0wNC0wNSAxMjowMToyOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0wNSAxMTowMToyOSArMDEwMA==
  content: ! '<p>Luke: Thanks for the detailed response.  You''re right about measurement
    being something that should be encapsulated in its own class, and ... ooh I''ve
    just had a thought!  Aggregation!  Yep, I think AR''s aggregation/composition
    support will do the job.  I shall play around and report back. :)</p>'
- id: 361
  author: Jordan Arentsen
  author_email: blissdev@gmail.com
  author_url: http://blissdev.com
  date: !binary |-
    MjAwNi0wNC0yNiAwMjo1MzoyOSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0yNiAwMTo1MzoyOSArMDEwMA==
  content: <p>I'm curious if you got this to work. I'm working on something similar.
    Any updates?</p>
- id: 362
  author: Anthony
  author_email: someresponseonaforumbutrealemail@fowk.com
  author_url: ''
  date: !binary |-
    MjAwNi0wNC0zMCAwNzowMDoxNiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wNC0zMCAwNjowMDoxNiArMDEwMA==
  content: ! "<p>I just started using a rails a few days ago, please forgive me (and
    correct me) if use terms incorrectly.</p>\n\n<p>I've been working on using AR's
    aggregation to solve the normalization prior to validation problem (as you mentioned).
    \ I have one little glitch I can't yet get by (maybe I'll figure it out after
    i get some sleep hehe).</p>\n\n<p>Code in config/enviornment.rb\nclass ActiveRecord::Base\n
    \ def self.normalize_money(*attr_names)\n    money = NormalizeMoney.new(attr_names)\n
    \   before_validation money\n  end\nend</p>\n\n<p>Code in /lib/normalize_money.rb\nClass
    NormalizeMoney\n  def initialize(attrs_to_manage)\n    @attrs_to_manage = attrs_to_manage\n
    \ end</p>\n\n<p>def before_validation(model)\n    @attrs_to_manage.each do |field|\n
    \     # Next line is broken\n      field_before_type_cast_index = model.send(field.name)
    \  \"_before_type_cast\"\n      model[field] = model[field_before_type_cast_index].gsub!
    /[^0-9-\\$]/, ''\n  end\nend</p>\n\n<p>I think all that's left is pulling out
    the field name.  I can't get the right value in \"field_before_type_cast_index\".</p>\n\n<p>Does
    anyone know how to get the field 'name' out of 'field' in the iteration?</p>\n\n<p>I'm
    guessing if I knew a method to dump the complete structure of field and/or model
    something would pop up with the value, but alas my lack of ruby experience is
    failing me. Any quick ways to do this?</p>\n\n<p>Once this works I should be able
    to do something like\nClass Item &lt; ActiveRecord::Base\n  normalize_money :price\nend</p>\n\n<p>Thanks!\n
    \   Anthony</p>"
- id: 363
  author: Scott Motte &raquo; Blog Archive &raquo; Normalizing data through the model
    before pushing to the database
  author_email: ''
  author_url: http://scottmotte.com/archives/71
  date: !binary |-
    MjAwOC0wNi0xMiAxNzozNTowMyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNi0xMiAxNjozNTowMyArMDEwMA==
  content: <p>[...] Normalizing data in the model [...]</p>
- id: 364
  author: GR[ae]YSCALE &raquo; Blog Archive &raquo; Rails and Normalizing Phone Numbers
  author_email: ''
  author_url: http://sudrien.net/technical/ruby/rails-and-normalizing-phone-numbers
  date: !binary |-
    MjAwOC0xMC0yOSAyMDozNToxNiArMDAwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0yOSAxOTozNToxNiArMDAwMA==
  content: <p>[...] We need to intercept it at some point before it gets into the
    database (See Graeme Mathieson&#8217;s writup for the other possible way to do
    [...]</p>
---
I'm trying to figure out the idiomatic way, in Rails to normalise data before it hits the database.  And I'm going to work with two examples: an ISBN and a measurement.  In the case of the ISBN, we want to:

* Remove extraneous padding (in fact, anything that's not a digit or, in the case of the checksum, possibly an 'X', representing 10).
* Verify that the length is a sane length for an ISBN (currently either 10 or 13 digits).
* Do the checksum on the ISBN.

The actual validation parts of it relatively straightforward:

    # in app/models/book.rb:
    validates_format_of :isbn, :with => /^[0-9]{9}([0-9]{3})?[0-9X]$/
    validates_each :isbn do |record, attr, value|
      # ... do the ISBN validation on value ...
    end

but how to do the normalizing of the ISBN?  It has to be done before validation, otherwise those validators are not necessarily going to pass.  I guess there are two options:

    before_validation :normalise
    def normalise
      isbn = isbn.upcase.delete '^0-9', '^X'
    end

or override the write accessor:

    def isbn=(isbn)
      write_attribute(:isbn, isbn.upcase.delete '^0-9', '^X')
    end

I'm not sure which is the correct way, or is there another mechanism I'm missing?

The case of a measurement is more interesting.  From the form that the user fills in, I want to accept a height, and the unit of that height (is it centimetres, metres, inches, feet?  Is it feet and inches, even?!?)  So we have an arbitrary number of input fields that combine to create one single, normalised database field: I always want to store the height in the database as millimetres.  The second method from above, in my head, doesn't work, because we cannot guarantee which attributes will have their write accessor (setter?) called in what order.  So we have to let them all be set, then perform the normalisation later, using the first method:

    # in app/models/person.rb
    attr_accessor :height_in_major_units, :height_major_units,
      :height_in_minor_units, :height_minor_units
    before_validation :normalise_height
    def normalise_height
      height = to_mm # ...
    end

Is that the correct way to implement it?  Actually, I started by checking all these things out with examples before writing them down, but my wife just called to say that I've a beer waiting for me at our local pub, and that I'd better get a move on unless I want her to drink it, so I guess I should be asking: will that work at all? :)

It strikes me that there might be scope for an extraction of being able to define `normalise_foo` (or `canonicalise_foo`?) for automagically messing with values you want to constrain before they hit the validation layer and get saved into the database.  If such a thing doesn't already exist...
