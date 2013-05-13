---
layout: post
status: publish
published: true
title: PostgreSQL schema name restriction
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 12
wordpress_url: http://woss.name/?p=12
date: 2005-08-01 11:26:17.000000000 +01:00
categories:
- Geekery
- Work
tags: []
comments: []
---
I've just spent the past 20 minutes trying to figure out what <a href="http:&#47;&#47;www.postgresql.org&#47;docs&#47;current&#47;static&#47;ddl-schemas.html" title="PostgreSQL documentation: Schemas">schema<&#47;a> names one can use in a <a href="http:&#47;&#47;www.postgresql.org&#47;">PostgreSQL<&#47;a> database.  The documentation wasn't much use, so tracking through the source, in <code>postgresql-8.0.3&#47;backend&#47;parser&#47;<&#47;code> I discovered that a schema name is subject to the same restrictions as a column id (which seems to be a generic identifier shared by column names, table names, etc).  This is defined as being an <code>IDENT<&#47;code> at the lexer level, which is defined as:

[code lang="perl"]ident_start             [A-Za-z\200-\377_]
ident_cont              [A-Za-z\200-\377_0-9\$]

identifier              {ident_start}{ident_cont}*[&#47;code]

So, barring whatever \200 through \377 are (anything with the ASCII high bit set), you're restricted to schema names that start with a letter or underscore, and otherwise can contain letters, underscores &amp; digits.  Oh, and there's also a hack in the parser that, in addition to being a <code>IDENT<&#47;code> from the lexer, it will also accept anything that's not a 'reserved keyword'.  So, for example, the following is acceptable:

[code lang="sql"]mathie=# CREATE SCHEMA CASCADE;
CREATE SCHEMA
mathie=# DROP SCHEMA CASCADE;
DROP SCHEMA
mathie=# [&#47;code]

which is kinda weird!  Identifiers are all lowercased and truncated to 63 characters.

Then I looked a little more closely and switched my brain on.  If you enclose the schema name in quotes, it can contain <em>anything<&#47;em> and the case is preserved.  It is still truncated to 63 characters, though.  So you can have the following:

[code lang="sql"]mathie=# CREATE SCHEMA "FoObAr";
CREATE SCHEMA
mathie=# CREATE SCHEMA "fOoBaR";
CREATE SCHEMA
mathie=# \dn
        List of schemas
        Name        |   Owner
--------------------+-----------
 FoObAr             | mathie
 fOoBaR             | mathie[&#47;code]
