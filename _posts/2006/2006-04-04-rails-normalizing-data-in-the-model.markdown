---
layout: post
title: ! 'Rails: Normalizing data in the model'
date: 2006-04-04 17:41:19 +01:00
categories:
- Geekery
- Work
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
