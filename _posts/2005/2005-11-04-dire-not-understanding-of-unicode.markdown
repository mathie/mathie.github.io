---
layout: post
title: Dire not-understanding of Unicode
date: 2005-11-04 13:44:20 +00:00
categories:
- Geekery
- Python
- Work
---
OK, I think I just plain don't understand Unicode, character sets, encodings, or anything of that nature.  What I'm actually trying to achieve is to store Unicode data in a MySQL 4.1.x database.  And I'd really like to store it as UTF-8, since I keep being told this is a good thing.  (This already works fine on PostgreSQL, by the way.)

So, what I don't understand is when I do:

[code lang="sql"]mysql> CREATE DATABASE foo CHARACTER SET UTF8;
Query OK, 1 row affected (0.00 sec)[/code]

in my MySQL client, then do:

[code lang="python"]>>> import MySQLdb
>>> c = MySQLdb.connect(db = 'foo', use_unicode = True)
>>> c.character_set_name()
'latin1'[/code]

What's happening there?  Is it that it encodes the Unicode string in the Latin-1 (ISO 8859-1) encoding for it to go over the connection between the MySQL client and server, only to decode it back to Unicode, only to be encoded as UTF-8 before it hits the database?  Shouldn't the encoding for the connection match that of the database table?  Aren't there characters in UTF-8 which aren't available in Latin-1 (like, for example, the &euro; -- Euro -- symbol!)?

I wonder if the MySQL Python library ought to be using the C API function <a href="http://dev.mysql.com/doc/refman/4.1/en/mysql-set-character-set.html"><code>mysql_set_character_set()</code></a> to set the desired character set in the connection (perhaps deriving it from the character set the database defaults to?), but I really don't feel confident enough with this stuff to ask upstream...

Would you please form an orderly queue in the comments to hit me with a clue-stick? :-)
