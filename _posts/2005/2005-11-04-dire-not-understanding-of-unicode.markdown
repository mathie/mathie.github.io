---
layout: post
status: publish
published: true
title: Dire not-understanding of Unicode
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2005-11-04 13:44:20.000000000 +00:00
categories:
- Geekery
- Python
- Work
tags: []
comments:
- id: 196
  author: annabel
  author_email: annabel@durasonline.com
  author_url: ''
  date: !binary |-
    MjAwNS0xMS0wNCAxNDowNzozMSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wNCAxMzowNzozMSArMDAwMA==
  content: ! 'ooh i just had to look up the unicode for the euro wotsit... its Alt
    0128

    :o)


    though i get the feeling that you''re probably askin about sommat a bit more technical
    :oP'
- id: 197
  author: Seo Sanghyeon
  author_email: tinuviel@sparcs.kaist.ac.kr
  author_url: ''
  date: !binary |-
    MjAwNS0xMS0wNCAxNDozOToyOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wNCAxMzozOToyOCArMDAwMA==
  content: ! 'For MySQL, the easiest solution is:


    cursor = connection.cursor()

    cursor.execute(''SET CHARACTER SET UTF8'')


    Another solution is to use read_default_file keyword option to connect. That''s
    how "deriving from the character set the database defaults to" is done. For example,
    connect(read_default_file=''/etc/my.cnf''), where /etc/my.cnf has


    [mysql]

    default-character-set = utf8


    See also MySQL reference manual. You want to read chapter 10, Character Set Support.'
- id: 198
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNS0xMS0wNCAxNTowNToyMSArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wNCAxNDowNToyMSArMDAwMA==
  content: ! 'OK, I''m still not getting it...


    [code]mathie@Tandoori:mailmanager-2.0.1$ cat /Users/mathie/.my.cnf

    [mysql]

    deafult-character-set = utf8

    mathie@Tandoori:mailmanager-2.0.1$ python

    Python 2.4.1 (#1, Aug 30 2005, 11:16:54)

    [GCC 4.0.0 (Apple Computer, Inc. build 5026)] on darwin

    Type "help", "copyright", "credits" or "license" for more information.

    >>> import MySQLdb

    >>> c = MySQLdb.connect(db = ''foo'', use_unicode = True, read_default_file="/Users/mathie/.my.cnf")

    >>> c.character_set_name()

    ''latin1''

    >>> c.cursor().execute(''SET CHARACTER SET UTF8'')

    0L

    >>> c.character_set_name()

    ''latin1''[/code]


    Thanks for the pointer to the MySQL docs -- I''ll take a closer look this afternoon.'
- id: 199
  author: Benjamin Niemann
  author_email: pink@odahoda.de
  author_url: http://www.odahoda.de/
  date: !binary |-
    MjAwNS0xMS0wNCAxNTo1NToxOCArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wNCAxNDo1NToxOCArMDAwMA==
  content: ! "character_set_name() does not get updated, when you change the encoding
    for the connection. I use\n\n    conn.cursor().execute(\"SET NAMES 'utf8'\")\n
    \   conn.charset = \"utf-8\"\n\nSetting conn.charset looks like an pretty ugly
    hack to me... But it works so far.\nThe only thing I that confuses me, is that
    i have to manually decode strings comming from TEXT  fields. VARCHAR fields are
    correctly decoded by MySQLdb, but TEXT fields arrive as array objects..."
- id: 200
  author: Robin Munn
  author_email: rmunn@pobox.com
  author_url: http://www.geekforgod.com/
  date: !binary |-
    MjAwNS0xMS0wNCAxNzoyNjo1MiArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wNCAxNjoyNjo1MiArMDAwMA==
  content: ! 'For reference, the Euro character is only ALT 0128 on Windows. Its actual
    Unicode codepoint is U+20AC. If you get used to thinking of the Euro as ALT-0128,
    you''re going to set yourself up for problems later on. See http://www.cs.tut.fi/~jkorpela/html/euro.html
    and http://www.cs.tut.fi/~jkorpela/www/windows-chars.html for more details.


    Oh, and my clue-stick has "Stay away from MySQL; use PostgreSQL instead if you
    want to keep your sanity" carved on it. I still have to beat *myself* with it
    from time to time... :-)'
- id: 201
  author: Nikos Kouremenos
  author_email: kourem@gmail.com
  author_url: http://members.hellug.gr/nkour
  date: !binary |-
    MjAwNS0xMi0zMCAxODoyMjo1MiArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMi0zMCAxNzoyMjo1MiArMDAwMA==
  content: ! 'Just do:


    self.cur.execute(''SET character_set_results="utf8"'')


    and INSERT utf8strings and you get those back.


    also consider using sqlite or poste. the first at least does all that by default.'
- id: 202
  author: bur
  author_email: burchik+blog+at+woss+name@gmail.com
  author_url: http://buriy.livejournal.com/
  date: !binary |-
    MjAwNi0wMS0yNSAwNTo1NTo0NSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0yNSAwNDo1NTo0NSArMDAwMA==
  content: ! '<p>A SET NAMES ''x'' statement is equivalent to these three statements:</p>


    <p>mysql&gt; SET character_set_client = x;

    mysql&gt; SET character_set_results = x;

    mysql&gt; SET character_set_connection = x;</p>


    <p>A SET CHARACTER SET x statement is equivalent to these three statements:</p>


    <p>mysql&gt; SET character_set_client = x;

    mysql&gt; SET character_set_results = x;

    mysql&gt; SET collation_connection = @@collation_database;</p>


    <p>(from http://www.informit.com/articles/article.asp?p=328641&amp;seqNum=3#336)</p>'
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
