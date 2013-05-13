---
layout: post
status: publish
published: true
title: Migrating your Rails application to Unicode
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 342
wordpress_url: http://woss.name/2006/10/25/migrating-your-rails-application-to-unicode/
date: 2006-10-25 15:46:00.000000000 +01:00
categories:
- Geekery
- Ruby and Rails
- Work
tags:
- Geekery
- Ruby and Rails
- Work
comments:
- id: 653
  author: Michael Houghton
  author_email: mike@michaelhoughton.co.uk
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0yNSAxNzoxNjoxMiArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNSAxNjoxNjoxMiArMDEwMA==
  content: ! '<p>Nice writeup, and the migration is an excellent idea.<&#47;p>


    <p>Thanks.<&#47;p>'
- id: 654
  author: freetwix
  author_email: freetwix@web.de
  author_url: ''
  date: !binary |-
    MjAwNi0xMC0yNSAyMzo0MDoxNyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNSAyMjo0MDoxNyArMDEwMA==
  content: ! '<p>hey mathie,<&#47;p>


    <p>thanks for the snippets. just one thing: we just encountered problems with
    the collation ''utf8_general_ci'' for umlauts.<&#47;p>


    <p>using ''utf8_bin'' fixed our problems.<&#47;p>


    <p>greetings,

    jochen<&#47;p>'
- id: 655
  author: Pete Yandell
  author_email: pete@notahat.com
  author_url: http://notahat.com/
  date: !binary |-
    MjAwNi0xMC0yNyAwMDo1NToxMCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNiAyMzo1NToxMCArMDEwMA==
  content: ! '<p>The character set conversion you do in your migration is a bad, bad,
    BAD idea, and here''s why:<&#47;p>


    <p>Rails tells the browser that it''s speaking UTF-8 by default, so someone may
    have already punched UTF-8 data into your app.<&#47;p>


    <p>Rails, in its default setup, then happily sent that to the database as latin1
    (MySQL''s default character set) without any conversion! The database dutifully
    saved it as such.<&#47;p>


    <p>The result is that your database is probably full of UTF-8 already, but marked
    as latin1.<&#47;p>


    <p>So the last thing you want to do is a character set conversion. You''ll be
    asking the database to do a latin1 to UTF-8 conversion on data that is already
    UTF-8!<&#47;p>'
- id: 656
  author: LabRat
  author_email: richstyles@gmail.com
  author_url: http://blog.labratz.net
  date: !binary |-
    MjAwNi0xMC0yNyAwNToxMzozOCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNyAwNDoxMzozOCArMDEwMA==
  content: <p>Thanks for the write up.  It definitely solved one of the things nagging
    me with setting default charsets in migrations.<&#47;p>
- id: 657
  author: mathie
  author_email: mathie@woss.name
  author_url: http://woss.name/
  date: !binary |-
    MjAwNi0xMC0yNyAwOToxNTo1MCArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNyAwODoxNTo1MCArMDEwMA==
  content: ! '<p>Pete: Thanks for pointing out a scenario I hadn''t considered.  I
    didn''t realise Rails defaults to serving pages in UTF-8 so I''ve now done a little
    investigation.<&#47;p>


    <p>With the current stable Rails (1.1.6), running in development mode, lighttpd
    <em>doesn''t<&#47;em> specify a character set in the Content-Type header.  However,
    WEBrick <em>does<&#47;em> specify UTF-8.  In edge Rails, you''re absolutely right.  lighttpd,
    mongrel and WEBrick <em>all<&#47;em> serve content as UTF-8 by default.<&#47;p>


    <p>Of course, this might or might not be the case in your production environment,
    depending upon how it''s set up.  Fortunately in my production environment, the
    content type is not specified -- I wonder what it defaults to if it''s not specified?  ASCII?
    -- because up until this application I still have in development, I''d never had
    to consider ''funny'' characters. :-)<&#47;p>


    <p>So how do you deal with the situation you describe?<&#47;p>'
- id: 658
  author: Dave Verwer
  author_email: dave.verwer@shinydevelopment.com
  author_url: http://shinydevelopment.com
  date: !binary |-
    MjAwNi0xMC0yNyAxNDozNzo1MSArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0xMC0yNyAxMzozNzo1MSArMDEwMA==
  content: <p>Great post, and I have shamelessly stolen your idea of raising an error
    based on the adapter name for some MySQL specific migrations I have.<&#47;p>
- id: 659
  author: UTF8 en RoR &laquo; 3eq11
  author_email: ''
  author_url: http://3eq11.wordpress.com/2006/11/01/utf8-en-ror/
  date: !binary |-
    MjAwNi0xMS0wMSAxMjozMjo0MyArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0wMSAxMTozMjo0MyArMDAwMA==
  content: ! '<p>[...] fuente: es.wikipedia fuente: woss.name [...]<&#47;p>'
- id: 660
  author: Edgar
  author_email: edgar@rubycorner.com
  author_url: http://www.rubycorner.com
  date: !binary |-
    MjAwNi0xMS0wMSAxNTo1Mzo1NCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0wMSAxNDo1Mzo1NCArMDAwMA==
  content: <p>The migration approach was a great idea<&#47;p>
- id: 661
  author: RubyOnRails y UTF8 &rsaquo;&rsaquo; La Cara Oscura del Desarrollo de Software
  author_email: ''
  author_url: http://www.lacaraoscura.com/2006/11/01/rubyonrails-y-utf8/
  date: !binary |-
    MjAwNi0xMS0wMSAyMToxMTozOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0wMSAyMDoxMTozOSArMDAwMA==
  content: <p>[...] Y para terminar, si tienes una aplicaci&Atilde;&sup3;n Rails que
    no est&Atilde;&iexcl; UTF8, Graeme Mathieson escribi&Atilde;&sup3; unos migrations
    que te ayudan a Migrar tu Aplicaci&Atilde;&sup3;n Rails a Unicode. [...]<&#47;p>
- id: 662
  author: Sebastian
  author_email: sd@notso.net
  author_url: http://www.notsostupid.com/
  date: !binary |-
    MjAwNi0xMS0wNiAwMjoyNDozNCArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0xMS0wNiAwMToyNDozNCArMDAwMA==
  content: ! '<p>Say your database was encoding as latin1, but you fed it utf8 data
    without telling it. Which is what Pete above is talking about.<&#47;p>


    <p>So, instead of telling mysql to ALTER TABLE contacts CONVERT TO CHARACTER SET
    utf8, you should do the following:<&#47;p>


    <p>mysqldump --default-character-set=latin1 {database} {table} | sed ''s&#47;latin1&#47;utf8&#47;''
    | mysql {database}<&#47;p>


    <p>It''s very important to use the right value for --default-character-set in
    the call to mysqldump. It should be your currently incorrect encoding (latin1,
    probably). By telling mysqldump to use the same encoding the tables are using,
    the output will be the untranscoded byte stream, which is exactly what you want.
    Then you take that output and change it so that it actualy claims to be utf8 data,
    and feed it back to mysql.<&#47;p>


    <p>Done, problem solved. Your data is now properly encoded utf8 in properly encoded
    tables.<&#47;p>'
- id: 663
  author: UTF-8 and Rails &laquo; Riff World
  author_email: ''
  author_url: http://riffworld.wordpress.com/2007/02/01/utf-8-and-rails/
  date: !binary |-
    MjAwNy0wMi0wMSAxNDoyNDo0MSArMDAwMA==
  date_gmt: !binary |-
    MjAwNy0wMi0wMSAxMzoyNDo0MSArMDAwMA==
  content: <p>[...] 3. Drop your database and rake db:migrate again. You might be
    able to convert the DB to UTF-8 (see this post, but also read the warning before
    proceeding). [...]<&#47;p>
- id: 664
  author: G. Gibson
  author_email: mistergibson@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wNS0xMCAyMDo1NDo0MyArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wNS0xMCAxOTo1NDo0MyArMDEwMA==
  content: ! '<p>What if I want to (prior to creating tables) set the default encodings
    and collation.  I am hoping it will use these when new tables, string columns,
    are created.  Would this work:<&#47;p>


    <p>def self.up

    execute "ALTER DATABASE #{ActiveRecord::Base.connection.current_database} CHARACTER
    SET utf8 COLLATE utf8_bin"

    end<&#47;p>


    <p>Also, would it indeed (in MySQL) set all subsequent tables and columns to these
    settings?<&#47;p>


    <p>Thanks.<&#47;p>'
- id: 665
  author: Remi
  author_email: rgabillet@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0wOS0xMyAwNDoyOTowMSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0wOS0xMyAwMzoyOTowMSArMDEwMA==
  content: ! '<p>Based on my research, I wrote a migration that actually recreates
    the DB, you can check it out here:

    http:&#47;&#47;snippets.dzone.com&#47;posts&#47;show&#47;6070<&#47;p>'
- id: 666
  author: Mihail Minkov
  author_email: Mihail.Minkov.BG@gmail.com
  author_url: ''
  date: !binary |-
    MjAwOC0xMC0xNCAyMzozMzoxNSArMDEwMA==
  date_gmt: !binary |-
    MjAwOC0xMC0xNCAyMjozMzoxNSArMDEwMA==
  content: <p>Thank you, your post was really helpful to me. I'd been trying to do
    exactly this for over an hour, always missing out on some detail or another :)<&#47;p>
---
**Update** Make sure you read the comments on this post before considering it.  In particular, [Pete](http:&#47;&#47;woss.name&#47;2006&#47;10&#47;25&#47;migrating-your-rails-application-to-unicode&#47;#comment-13156) brings up some concerns about applications having data which is already UTF-8, but marked as Latin1 in the database, may cause problems.

So you've got this Rails application you've been developing and all of a sudden you need to support Unicode.  After all, not everybody speaks English.  And some really awkward people like all sorts of typographic symbols in their medical articles.  In fact, you wouldn't believe all the weird characters these print-production-oriented people like to use&hellip;

Most of the instructions here were gleamed from a [jabbering giraffe](http:&#47;&#47;happygiraffe.net&#47;blog&#47;archives&#47;2006&#47;09&#47;16&#47;unicode-for-rails) and the [notes I wrote up from his talk](http:&#47;&#47;woss.name&#47;2006&#47;10&#47;11&#47;railsconf-europe-2006-unicode-for-rails-dominic-mitchell&#47;).  But I like to think I've had a bright idea of my own. :-)  Note that these instructions assume you're using Ruby 1.8.x, MySQL >= 5 and edge (soon to be 1.2) rails.

OK, so to get Rails basically talking UTF-8, you have to do a couple of things.  Firstly, make Ruby itself a little bit Unicode-aware, by sticking the following in `config&#47;environment.rb`:

    $KCODE = 'u'

We also need to tell ActiveRecord that the connection it should open to MySQL should be UTF-8 encoded.  This is done by putting the following in each of your database stanzas in `config&#47;database.yml`:

    encoding: utf8

Finally, from a setup perspective, we need to migrate the current database to one which uses UTF-8 encoding internally.  This is what I consider to be my 'smart' bit. :-)  Create yourself a migration:

    script&#47;generate migration make_unicode_friendly

then paste in the following code:

    class MakeUnicodeFriendly < ActiveRecord::Migration
      def self.up
        alter_database_and_tables_charsets "utf8", "utf8_general_ci"
      end

      def self.down
        alter_database_and_tables_charsets
      end

      private
      def self.alter_database_and_tables_charsets charset = default_charset, collation = default_collation
        case connection.adapter_name
        when 'MySQL'
          execute "ALTER DATABASE #{connection.current_database} CHARACTER SET #{charset} COLLATE #{collation}"

          connection.tables.each do |table|
            execute "ALTER TABLE #{table} CONVERT TO CHARACTER SET #{charset} COLLATE #{collation}"
          end
        else
          # OK, not quite irreversible but can't be done if there's not
          # the code here to support it...
          raise ActiveRecord::IrreversibleMigration.new("Migration error: Unsupported database for migration to UTF-8 support")
        end
      end

      def self.default_charset
        case connection.adapter_name
        when 'MySQL'
          execute("show variables like 'character_set_server'").fetch_hash['Value']
        else
          nil
        end
      end

      def self.default_collation
        case connection.adapter_name
        when 'MySQL'
          execute("show variables like 'collation_server'").fetch_hash['Value']
        else
          nil
        end
      end

      def self.connection
        ActiveRecord::Base.connection
      end
    end

This migrates the current database to using UTF-8 with general, case-insensitive collation, which affects the creation of future tables.  It also updates each of the current tables, converting their contents to UTF-8 too.

And it's reversible.  Well, mostly.  It makes the assumption that the previous character set you were using was the server's default (which, unless you explicitly specified a character set&#47;collation upon creation will be the case), and reverts back to that.  Of course, a backward migration may well be lossy, so you want to be careful trying that.

The next bit is the tricky one.  Most of the Ruby string functions aren't Unicode-aware.  They'll quite happily `slice` up multi-byte characters.  Fortunately edge rails now extends `String` to provide a `chars` method which returns an [`ActiveSupport::Multibyte::Chars`](http:&#47;&#47;multibyterails.org&#47;documentation&#47;activesupport_multibyte&#47;classes&#47;ActiveSupport&#47;Multibyte&#47;Chars.html) object.  It walks like a string and talks like a string, but is multibyte aware.  Nice.  Apparently there's active work going on in the core to get internal Rails stuff to use this new functionality, so hopefully it should be pretty good soon.

Hopefully it should be good enough for me to use just now...
