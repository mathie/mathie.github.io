---
layout: post
status: publish
published: true
title: Inserting CSV data into a MySQL database
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 168
wordpress_url: http://woss.name/?p=168
date: 2005-11-03 15:07:38.000000000 +00:00
categories:
- Geekery
tags: []
comments:
- id: 184
  author: Craig Atkinson
  author_email: craigatk@gmail.com
  author_url: http://www.craigatk.ca
  date: !binary |-
    MjAwNS0xMS0yNCAyMjo1NTozNiArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0yNCAyMTo1NTozNiArMDAwMA==
  content: ! 'Thanks for posting that snippet. I was googling for a mysql/csv import
    code sample in Ruby (but Python works for me too!)


    Best wishes for your upcoming wedding!'
- id: 185
  author: Craig Atkinson
  author_email: craigatk@gmail.com
  author_url: http://www.craigatk.ca
  date: !binary |-
    MjAwNS0xMS0yNCAyMjo1ODo1MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0yNCAyMTo1ODo1MSArMDAwMA==
  content: and yes I love dreamhost too!
- id: 186
  author: SEO G
  author_email: livenumb@yahoo.com
  author_url: http:///www.seog.net
  date: !binary |-
    MjAwNi0wMS0wNiAwMDoxODo1OSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0wNSAyMzoxODo1OSArMDAwMA==
  content: ! 'Is there anyway you could show an example using Ruby on Rails? I''m
    just starting to learn it and I''d like to develop an application that imports
    CSV file and puts into database, validating data as it imports or doing fun things
    to it. Just curious if you had a quick example of importing a CSV file and inserting
    it into a mySQl database with Rails natively.


    Much appreciated in advance, thanks!'
- id: 187
  author: Jason H
  author_email: jason_c_hall@msn.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMS0wOSAyMToxODoyMiArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0wOSAyMDoxODoyMiArMDAwMA==
  content: Generically speaking - using the CSV module is a bit safer than the load
    data script. It will deal with escaped characters correctly (example - comma inside
    of a string - then the string is usually quoted).
---
So last night I was trying to move some data from my <a href="http://www.apple.com/macosx/features/addressbook/">Address Book</a> into a <a href="http://www.rubyonrails.com/">Rails</a> application I'm creating to keep track of our wedding guests (more on that some other time).  First up was trying to coerce the data from Address Book in the first place.  That was achieved with the assistance of the 'Export Addresses' function of <a href="http://homepage.mac.com/aamann/Mail_Scripts.html">Mail Scripts</a> which translates the data to CSV.  Unfortunately, it fails to escape comma characters (say in part of the address field) which I should report to the author, but for now I simply did a search and replace with my <a href="http://macromates.com/">favourite editor</a> to fix it.

Next up, I figured I'd try and push the data into the MySQL database from the client (culled from some random web site):

[code lang="sql"]LOAD DATA LOCAL INFILE 'data.txt'
  INTO TABLE guests
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n'
  (prefix, first_name, last_name,
   address, city, region, post_code,
   country, telephone, email);[/code]

Which failed.  Reading into things further, I discovered that the <code>LOAD DATA</code> command has security implications and is often disabled on database servers (so it's unlikely to be enabled by my <a href="http://www.dreamhost.com/r.cgi?wossname">happy hosters</a> where I'd like to deploy the data).  So, plan B:

[code lang="python"]#!/usr/bin/env python
import MySQLdb, csv
db = MySQLdb.connect(db = 'wedding_development')
c = db.cursor()
csv_data = csv.reader(file('data.txt'))
for row in csv_data:
  print row
  c.execute('INSERT INTO guests (prefix, first_name, '
    'last_name, address, city, region, post_code, '
    'country, telephone, email)'
    'VALUES (%s, %s, %s, %s, %s, %s, %s, '
    '%s, %s, %s)', row)
c.close()
db.commit()
db.close()[/code]

(We'll glosss over the fact that I'm using Python to inject data into a Rails application -- I'm more familiar with it, OK?)

A nice quick hack.  It worked.  I can get on with actually finishing some features now...
