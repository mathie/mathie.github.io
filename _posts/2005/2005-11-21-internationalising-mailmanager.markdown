---
layout: post
status: publish
published: true
title: Internationalising MailManager
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 187
wordpress_url: http://woss.name/?p=187
date: 2005-11-21 14:10:50.000000000 +00:00
categories:
- Geekery
- Python
- Work
tags: []
comments: []
---
I meant to post all about this on Friday, but teh Interweb was being mean to me.  I spent the whole of Friday getting <a href="http:&#47;&#47;www.logicalware.com&#47;">MailManager<&#47;a> ready for the i18n hordes to start creating translations.  We've already spent a reasonable amount of time making sure that the page templates themselves have <code>i18n:translate<&#47;code> and <code>i18n:attributes<&#47;code> tags where necessary (I guess we're still missing a few, but they'll soon come out in the wash).  That all happened in version 1.1, and the recently page template rewrite has managed to keep them surprisingly intact.

Friday's task was to update the .POT file (the master file which contains all the message ids -- identifiers for each string of text -- some context and placeholders for the message string) and port the existing localization (l10n) efforts to it.  I had expected this to be a huge, painful job, so I'd been putting it off for a while.  Enter <a href="http:&#47;&#47;plone.org&#47;products&#47;i18ndude">i18ndude<&#47;a>, from the <a href="http:&#47;&#47;plone.org&#47;">Plone<&#47;a> Internationalization (i18n) Team.  Given a bunch of Zope page templates, it will create the master .POT file, and it will also synchronise up the existing translations, removing those that are no longer pertinent and adding new message ids with context for the translators.

I installed that on my own laptop, had a quick play around.  It generated the new version of the POT file seamlessly (even in a similar enough format that the <code>CVS diff<&#47;code> was remarkably small).  Then I used that .POT file to synchronise up the existing .PO localisation files.  And it added new message ids, removed ones which were no longer pertinent.  Ideal.

In addition, while creating the master .POT file, it successfully pointed out where I had been using the same message id to point to different english strings (most of which were case changes, but it helped to make the strings consistent, or point out why they were deliberately not so).  Run in another form, i18ndude can also point out what strings have not been tagged with message ids (much better than my page template validator, which merely looks for non-whitespace XML CDATA that doesn't have an <code>i18n:translate<&#47;code> in its immediate parent's attributes).

Next up: automate it!  So we now have this extra chunk in the top-level MailManager's Makefile:

[code]ZPT_FILES = $(shell ls www&#47;*.zpt | grep -v manage_)
POT_FILE = i18n&#47;mailmanager.pot
PO_FILES = $(wildcard i18n&#47;*.po)

i18n: $(POT_FILE) $(PO_FILES)

$(POT_FILE): $(ZPT_FILES)
	i18ndude rebuild-pot --pot $(POT_FILE) --create mailmanager $(ZPT_FILES)

$(PO_FILES): $(POT_FILE)
	i18ndude sync --pot $(POT_FILE) $(PO_FILES)

check-i18n:
	i18ndude find-untranslated $(ZPT_FILES)[&#47;code]

Running <code>make i18n<&#47;code> will update all the i18n files.  It's not ideal, since every time you change a single page template it regenerates the entire .POT file from all the templates (something which takes about 2 minutes on my laptop), but it'll do for now.  That followed by a <code>cvs commit<&#47;code> and it'll eventually find its way into Rosetta (which I'll come on to in a minute).  Running <code>make check-i18n<&#47;code> will list all the chunks of text in the page templates that don't have message ids attached to them, and note some other errors&#47;warnings.

Unfortunately, we don't yet have a system for i18n which covers the strings in the code itself.  That's another task to investigate shortly (but I suspect I'll be spending the rest of the week doing bill-paying consulting work, so it will have to wait!).  I also need to revisit the use of singulars vs plurals since I suspect there is a better way of doing this with the i18n system than simply having separate message ids for the singular and the plural.

The next part of the puzzle is getting together a system so that people can add translations easily.  Enter <a href="https:&#47;&#47;launchpad.net&#47;rosetta">Rosetta<&#47;a>, the system that is used to provide translations for <a href="http:&#47;&#47;www.ubuntulinux.org&#47;">Ubuntu Linux<&#47;a>.  We now have a page up there for <a href="https:&#47;&#47;launchpad.net&#47;products&#47;mailmanager&#47;+translations">managing MailManager translations<&#47;a>.  So now people can trivially add&#47;modify translations.  I've been trying it out for adding a UK English l10n to MailManager - check it out and feel free to add some more text!  If you feel like adding another language too, it's not obvious from the Rosetta interface how to achieve this, but try something along the lines of:

<ul>
  <li><a href="https:&#47;&#47;launchpad.net&#47;+login">Register&#47;log in<&#47;a> to an account<&#47;li>
  <li>Navigate to the <a href="https:&#47;&#47;launchpad.net&#47;products&#47;mailmanager&#47;+translations">MailManager translations<&#47;a> page.<&#47;li>
  <li>Choose <a href="https:&#47;&#47;launchpad.net&#47;rosetta&#47;prefs">Select Languages...<&#47;a> from the box at the side of the page.<&#47;li>
  <li>Select the languages you would to appear as options (I chose French, German, Gaelic and UK English, for example).<&#47;li>
  <li>Navigate back to the <a href="https:&#47;&#47;launchpad.net&#47;products&#47;mailmanager&#47;+translations">MailManager translations<&#47;a> page.  The progress of all the translations you indicated an ability to perform (including those not yet started) will be shown to you.  Click on one of the translations to do some work on it!<&#47;li>
<&#47;ul>

In order to incorporate the latest version of the translations into <a href="http:&#47;&#47;www.logicalware.com&#47;">MailManager<&#47;a> (this portion of instructions is intended for the MM developers reading this!), click the <a href="https:&#47;&#47;launchpad.net&#47;products&#47;mailmanager&#47;+series&#47;head&#47;+pots&#47;mailmanager&#47;+export">Download translations<&#47;a> link, select the radio button to export everything, submit, then wait for the email telling you where to retrieve the translations from.

(Which is taking more than 5 minutes so far!)

Aha, there it goes.  OK, it returns a <code>.tar.gz<&#47;code> with all the translations and the original PO file in a folder called <code>rosetta-mailmanager<&#47;code>.  Unlike the way we have the filenames (as <code>mailmanager-[langcode].po<&#47;code> -- presumably how PTS likes them?), it simply has them as <code>[langcode].po<&#47;code>.  From what I can tell, it has also stripped some of the comments (including the default text) from its files.

Next up is documentation on how to integrate the translation changes back into MailManager, but we'll leave that for another time, as I have a quote to confirm for this work I'm doing the rest of the week...
