---
layout: post
status: publish
published: true
title: MySQL, Zope and Unicode
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 171
wordpress_url: http://woss.name/?p=171
date: 2005-11-03 19:30:57.000000000 +00:00
categories:
- Geekery
- Python
- Work
tags: []
comments: []
---
OK, I think I can debunk <a href="http:&#47;&#47;mail.zope.org&#47;pipermail&#47;zope-db&#47;2005-March&#47;003990.html">the real hack<&#47;a> (that you can append UNICODE=1 to the connection string to set the MySQL connection to Unicode) after poking around in the source a little.  This is the code in question which parses the connection string, from <a href="http:&#47;&#47;cvs.sourceforge.net&#47;viewcvs.py&#47;mysql-python&#47;ZMySQLDA&#47;lib&#47;python&#47;Products&#47;ZMySQLDA&#47;db.py?rev=1.21&view=auto">db.py<&#47;a>:
[code lang="python"]  def _parse_connection_string(self, connection):
        kwargs = {'conv': self.conv}
        items = split(connection)
        self._use_TM = None
        if not items: return kwargs
        lockreq, items = items[0], items[1:]
        if lockreq[0] == "*":
            self._mysql_lock = lockreq[1:]
            db_host, items = items[0], items[1:]
            self._use_TM = 1
        else:
            self._mysql_lock = None
            db_host = lockreq
        if '@' in db_host:
            db, host = split(db_host,'@',1)
            kwargs['db'] = db
            if ':' in host:
                host, port = split(host,':',1)
                kwargs['port'] = int(port)
            kwargs['host'] = host
        else:
            kwargs['db'] = db_host
        if kwargs['db'] and kwargs['db'][0] in ('+', '-'):
            self._try_transactions = kwargs['db'][0]
            kwargs['db'] = kwargs['db'][1:]
        else:
            self._try_transactions = None
        if not kwargs['db']:
            del kwargs['db']
        if not items: return kwargs
        kwargs['user'], items = items[0], items[1:]
        if not items: return kwargs
        kwargs['passwd'], items = items[0], items[1:]
        if not items: return kwargs
        kwargs['unix_socket'], items = items[0], items[1:]
        return kwargs[&#47;code]

which does everything it's documented to do (allows you to specify the database, host &amp; port, whether transactions should be enabled, credentials and a path to the Unix socket), but <em>nothing<&#47;em> more.  No Unicode enabling hacks, nothing.

So that answers that.  Looks like the only solution is to set the default encoding globally in <code>sitecustomise.py<&#47;code>.  Unfortunately, one can't set the default encoding anywhere else, since one of the last things that <code>site.py<&#47;code> does is to delete <code>sys.setdefaultencoding()<&#47;code> so that, once the Python interpreter is initialised, the encoding is fixed for the duration.  (I guess there's a very good reason for this.)

Bother.  I don't like that we have to make changes outside our application's domain.  But for email, you <em>need<&#47;em> Unicode.  Think of all that foreign character set spam you get -- at least <a href="http:&#47;&#47;www.logicalware.com&#47;">MailManager<&#47;a> will render it beautifully!
