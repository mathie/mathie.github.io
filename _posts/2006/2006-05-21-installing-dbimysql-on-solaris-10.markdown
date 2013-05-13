---
layout: post
title: Installing DBI::mysql on Solaris 10
date: 2006-05-21 12:24:20 +01:00
categories:
- Geekery
- Solaris
- Work
---
OK, mostly this is a check to see if I'm actually thinking correctly or not.  The default `perl` on Solaris 10 appears to be compiled with `-xarch=v8`.  The binary build of [MySQL](http://www.mysql.com) 5.0.12 from the web site is built with `-xarch=v9`.  The fact that both are built for different architectures means that you *cannot* actually build `DBI::mysql` on this platform since it needs to link to libraries from both packages which have incompatible architectures.

Is that correct?  It's certainly the case that simply doing:

    -bash-3.00# perl -MCPAN -eshell
    CPAN: File::HomeDir loaded ok

    cpan shell -- CPAN exploration and modules installation (v1.87)
    ReadLine support enabled

    cpan> install DBD::mysql

doesn't work, since it tries to build the Perl module with `-xarch=v8` (inheriting from the perl installation) and link with the `libmysqlclient.a` which is built with `-xarch=v9`.  It appears to configure and build OK, but all the tests fail with:

`install_driver(mysql) failed: Can't load '[...]/blib/arch/auto/DBD/mysql/mysql.so' for module DBD::mysql: ld.so.1: perl: fatal: relocation error: file [...]/blib/arch/auto/DBD/mysql/mysql.so: symbol mysql_real_escape_string: referenced symbol not found at /usr/perl5/5.8.4/lib/sun4-solaris-64int/DynaLoader.pm line 230.`

Bugger.  So much for being lazy and trying to use prebuilt binaries of stuff.
