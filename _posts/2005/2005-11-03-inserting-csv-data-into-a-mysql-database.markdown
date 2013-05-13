---
layout: post
title: Inserting CSV data into a MySQL database
date: 2005-11-03 15:07:38 +00:00
categories:
- Geekery
---
So last night I was trying to move some data from my <a href="http://www.apple.com/macosx/features/addressbook/">Address Book</a> into a <a href="http://www.rubyonrails.com/">Rails</a> application I'm creating to keep track of our wedding guests (more on that some other time).  First up was trying to coerce the data from Address Book in the first place.  That was achieved with the assistance of the 'Export Addresses' function of <a href="http://homepage.mac.com/aamann/Mail_Scripts.html">Mail Scripts</a> which translates the data to CSV.  Unfortunately, it fails to escape comma characters (say in part of the address field) which I should report to the author, but for now I simply did a search and replace with my <a href="http://macromates.com/">favourite editor</a> to fix it.

Next up, I figured I'd try and push the data into the MySQL database from the client (culled from some random web site):

{% highlight sql %}
LOAD DATA LOCAL INFILE 'data.txt'
  INTO TABLE guests
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n'
  (prefix, first_name, last_name,
   address, city, region, post_code,
   country, telephone, email);
{% endhighlight %}

Which failed.  Reading into things further, I discovered that the <code>LOAD DATA</code> command has security implications and is often disabled on database servers (so it's unlikely to be enabled by my <a href="http://www.dreamhost.com/r.cgi?wossname">happy hosters</a> where I'd like to deploy the data).  So, plan B:

{% highlight python %}
#!/usr/bin/env python
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
db.close()
{% endhighlight %}

(We'll glosss over the fact that I'm using Python to inject data into a Rails application -- I'm more familiar with it, OK?)

A nice quick hack.  It worked.  I can get on with actually finishing some features now...
