---
layout: post
title: MySQL, Zope and Unicode
date: 2005-11-03 19:30:57 +00:00
categories:
- Geekery
- Python
- Work
---
OK, I think I can debunk [the real hack](http://mail.zope.org/pipermail/zope-db/2005-March/003990.html) (that you can append UNICODE=1 to the connection string to set the MySQL connection to Unicode) after poking around in the source a little.  This is the code in question which parses the connection string, from [db.py](http://cvs.sourceforge.net/viewcvs.py/mysql-python/ZMySQLDA/lib/python/Products/ZMySQLDA/db.py?rev=1.21&view=auto):
{% highlight python %}
  def _parse_connection_string(self, connection):
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
        return kwargs
{% endhighlight %}

which does everything it's documented to do (allows you to specify the database, host &amp; port, whether transactions should be enabled, credentials and a path to the Unix socket), but <em>nothing</em> more.  No Unicode enabling hacks, nothing.

So that answers that.  Looks like the only solution is to set the default encoding globally in <code>sitecustomise.py</code>.  Unfortunately, one can't set the default encoding anywhere else, since one of the last things that <code>site.py</code> does is to delete <code>sys.setdefaultencoding()</code> so that, once the Python interpreter is initialised, the encoding is fixed for the duration.  (I guess there's a very good reason for this.)

Bother.  I don't like that we have to make changes outside our application's domain.  But for email, you <em>need</em> Unicode.  Think of all that foreign character set spam you get -- at least [MailManager](http://www.logicalware.com/) will render it beautifully!
