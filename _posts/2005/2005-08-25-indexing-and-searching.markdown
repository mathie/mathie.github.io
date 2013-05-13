---
layout: post
title: Indexing and searching
date: 2005-08-25 13:05:28 +01:00
categories:
- Geekery
- Work
---
On a completely unrelated web search last night, I came across the <a href="http://www.xapian.org/">Xapian</a> project.  Funny that, what with it being an indexing and searching library for C++.  So I had a quick play around and it seems pretty neat.  And pretty fast.  I'm wondering if we could put it to use as a backend-independent search engine for <a href="http://www.logicalware.com" title="MailManager email response management system">MailManager</a> instead of our current implementation, which makes use of whatever the database backend provides.   In the case of PostgreSQL, this is <a href="http://www.sai.msu.su/~megera/postgres/gist/tsearch/V2/">tsearch2</a>, which by all accounts seems to be pretty good.  MySQL also has its own <a href="http://dev.mysql.com/doc/mysql/en/fulltext-search.html">full text search</a> support.  (And the ZODB we were using in 1.x has zcatalog et al to provide the searching capability.)

One problem with using a database backend's native text searching is that the language to express search terms (and the range of searches possible) varies between backends.  They also vary on whether they are case sensitive, whether they support stemming and how non-words are dealt with.  In the case of search expression, for example, with tsearch2, we'd do something along the lines of:

[code lang="sql"]SELECT * FROM articles
    WHERE idxfti @@ to_tsquery('default', 'this & that');[/code]

to search for records that contained both 'this' and 'that', whereas in MySQL it would be:

[code lang="sql"]SELECT * FROM articles
    WHERE MATCH (title,body)
    AGAINST ('+this +that' IN BOOLEAN MODE);[/code]

So we have to create our own search language to present to the user, then normalise the searches for each backend.  Actually, since neither of them use the same language as we presented to the user in MM 1.x, we've been doing that anyway. :-)

There's also the problem of using other backends that just don't have their own text searching capabilities.  SQLite certainly doesn't.  I guess Oracle, MS-SQL et al do have some text searching capability, but we'd need to write our own interface to each of them every time we added support for a new backend.  And we have to provide the lowest common demoninator of search functionality to the front end (or at least cope with the backend potentially not supporting a particular search method and notifying the client in a friendly manner).

So how about factoring out the search capabilities into something completely separate?  With the Xapian libraries, we'd need to write some code to intelligently split apart the email messages so they can be effectively indexed, provide an interface to query the index and make sure the search index stayed (nearly?) in sync with reality.  We could have it running as a separate daemon, so that indexing and searching wouldn't directly impact upon MailManager's main job, which is dealing with the emails themselves.  (Actually, I also argue that processing incoming mail should be separated out into its own daemon so that the Zope daemon can carry on doing what it does best: <del>nothing</del> uh, I mean, serving web pages to users :-) but that's for another post.)

At some point in the near future, when I've some CFT, I'm going to have a play around with Xapian, see if I can convince it to be useful.  One thing I'd like to do is combine it with a code parser to index &amp; search C/C++/Python code, like a souped-up uber-smart version of <a href="http://en.wikipedia.org/wiki/Ctags" title="ctags entry on Wikipedia">ctags</a>, just to see how well it really works.
