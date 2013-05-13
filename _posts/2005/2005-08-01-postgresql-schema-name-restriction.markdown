---
layout: post
title: PostgreSQL schema name restriction
date: 2005-08-01 11:26:17 +01:00
categories:
- Geekery
- Work
---
I've just spent the past 20 minutes trying to figure out what <a href="http://www.postgresql.org/docs/current/static/ddl-schemas.html" title="PostgreSQL documentation: Schemas">schema</a> names one can use in a <a href="http://www.postgresql.org/">PostgreSQL</a> database.  The documentation wasn't much use, so tracking through the source, in <code>postgresql-8.0.3/backend/parser/</code> I discovered that a schema name is subject to the same restrictions as a column id (which seems to be a generic identifier shared by column names, table names, etc).  This is defined as being an <code>IDENT</code> at the lexer level, which is defined as:

{% highlight perl %}
ident_start             [A-Za-z\200-\377_]
ident_cont              [A-Za-z\200-\377_0-9\$]

identifier              {ident_start}{ident_cont}*
{% endhighlight %}

So, barring whatever \200 through \377 are (anything with the ASCII high bit set), you're restricted to schema names that start with a letter or underscore, and otherwise can contain letters, underscores &amp; digits.  Oh, and there's also a hack in the parser that, in addition to being a <code>IDENT</code> from the lexer, it will also accept anything that's not a 'reserved keyword'.  So, for example, the following is acceptable:

{% highlight sql %}
mathie=# CREATE SCHEMA CASCADE;
CREATE SCHEMA
mathie=# DROP SCHEMA CASCADE;
DROP SCHEMA
mathie=# 
{% endhighlight %}

which is kinda weird!  Identifiers are all lowercased and truncated to 63 characters.

Then I looked a little more closely and switched my brain on.  If you enclose the schema name in quotes, it can contain <em>anything</em> and the case is preserved.  It is still truncated to 63 characters, though.  So you can have the following:

{% highlight sql %}
mathie=# CREATE SCHEMA "FoObAr";
CREATE SCHEMA
mathie=# CREATE SCHEMA "fOoBaR";
CREATE SCHEMA
mathie=# \dn
        List of schemas
        Name        |   Owner
--------------------+-----------
 FoObAr             | mathie
 fOoBaR             | mathie
{% endhighlight %}
