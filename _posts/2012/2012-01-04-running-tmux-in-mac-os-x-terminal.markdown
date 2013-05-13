---
layout: post
status: publish
published: true
title: Running tmux in Mac OS X Terminal
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
wordpress_id: 642
wordpress_url: http://woss.name/?p=642
date: 2012-01-04 12:06:19.000000000 +00:00
categories:
- Geekery
- Mac OS X
tags:
- Mac OS X
- shell
- tmux
- terminal
- screen
- launchd
comments: []
---
I've been a fan of [screen](http://www.gnu.org/software/screen/) for ... a while now. But since I like being one of the cool kids, I've been using [tmux](http://tmux.sourceforge.net/) for the past year or so. Last week, I noticed that every time I launch a new terminal, I wind up typing `tmux attach-session`. Let's streamline, a little bit.

In Mac OS X's Terminal.app, you can change the shell that it runs. Here's how I did it:

* Open Preferences, and choose the Settings tab.

* Duplicate your existing settings (since sometimes you might not want `tmux` after all). Pick your default session (mine's "Pro") and select "Duplicate settings" from the tool menu at the bottom. Name the new settings "Tmux" or something along those lines.

* In the shell tab for your settings, select "Run command" and enter `/usr/local/bin/tmux attach-session`. Deselect "Run inside shell" since you don't really need to. Since you're not running inside a shell, `/usr/local/bin` probably isn't in your `$PATH` so you'll need to specify the full path name. Of course, if your `tmux` binary lives somewhere other than `/usr/local/bin` you'll need to change the path.

* If you've selected "Only if there are processes other than" for "Prompt before closing", then you'll probably want to add `tmux` to that list.

* In the "Window" tab, I set "Scrollback" to limit the number of rows to '0', since tmux provides scroll back, and the Terminal one isn't terribly useful when tmux is running inside it.

* Make sure your Tmux session is set as the default one by clicking the "Default" button at the bottom of the settings lists while it's selected.

That's it. Close your existing terminal sessions and launch a new one. You should be launched into (one of) your existing tmux sessions. If tmux wasn't already running, then this assumes that your `~/.tmux.conf` sets up at least one session (which I think it required anyway). If you've got more than one tmux session running, I've no idea which one, offhand, it'll choose, but you can always switch to the one you're looking for with `C-a s`. (You have rebound the prefix to `C-a`, right?)

There's (at least) one time where you *don't* want tmux as your shell. That's when you're attempting to interact with `launchd`. I suspect it's to do with launchd checking that you're a child process as part of its permissions when you're asking it to do stuff, where tmux works by detaching itself from its parent process so it's not killed when the parent is. (Total guess, BTW.) Still, when you want to use `launchctl`, you'll need to do it somewhere other than a tmux session. In Terminal, choose the Shell menu, choose "New Window" (or "New Tab") and select one of the other settings profiles.
