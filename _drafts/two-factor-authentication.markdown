---
title: Two-Factor Authentication
---

The Internet is full of Bad People Who Want To Steal Your Stuff. Well, no, not
really. The Internet is full of good people (so long as you don’t read the
comments), but it does give the bad people access to an unprecedented amount of
computing power, and a large audience with which to play. When you’ve got
enough computing power, and enough bandwidth, it’s no big deal to guess
somebody’s password by just trying out every possible combination (called a
"brute force" attack).

Of course, it’s good practice to have a secure password. You know, one with
capital letters, lowercase letters, numbers, and even a few symbols thrown in.
The kind of passwords where you have to have a particular kind of memory to
recall. If you’re the kind of person who can recall every car number plate
they’ve ever owned, you probably already choose good passwords. On the other
hand, if you’re the kind of person who can’t remember the number plate of the
car they’ve been driving for the past five years, you might want to start using
it as your password — at least that way you’ll have one less thing to remember.

(Forget I said that. If somebody is targeting you, specifically, instead of the
Internet At Random, they’re going to try passwords related to you. Things like
variations on your car numberplate.)

So what is authentication, anyway? It’s being able to demonstrate that you are
who you claim to be. For example, when I log in to my Google Mail account, with
the email address “mathie@woss.name” and the password, “Password1234”, I’m
authenticating myself as the individual entitled to access that email account.

The trouble is, especially now that I’ve told you my super-secret password,
passwords by themselves just aren’t secure enough. As we’ve discovered, a bunch
of clever hackers, with their hands on a frightening amount of computing power,
can easily guess a password if they really want to (and often they do it just
because there’s money to be made from having access to other people’s email
accounts).

What more can we do? There are three things we can offer when we’re trying to
authenticate ourselves:

* Something only you *know*. This would be the password from before.

* Something you *have*. This could be a credit card (the actual, physical, bit
  of plastic, complete with a built-in chip), a door key, some other physical
  token, or even just your mobile phone/computer.

* Something you *are*. This last one refers to biometrics: your fingerprint, a
  retina scan, a skin sample, or something even more invasive.

Each one of these can be compromised. Passwords can be guessed. Credit cards
can be lost or stolen. (I still haven’t replaced our “spare” car key after
losing it on the sleeper train to London last year!) Even biometrics can be
faked well enough to fool our current technologies for reading them.

But what if we were to combine a couple of these? Sure, a l33t h4x0r in Russia
coordinating a botnet of thousands of computers can brute force my password,
but it’s unlikely that he’ll steal my mobile phone, too. Some schemey ned might
mug me and steal my credit cards, but it’s unlikely he’ll stop long enough to
torture me into revealing my PIN, too.

That’s what two-factor authentication is all about. Since biometric sensors are
relatively expensive (though there are some things available to us mere
mortals, like Apple’s TouchID on the newer phones), the two factors are usually
something you have and something you know. Like a credit card and a PIN. Or a
key fob and a password. The key (pun intended) is that it’s two separate
factors. It’s not just two passwords (which you write on the same Post-It
note), or two door keys (which you keep them on the same keyring), which isn’t
much more secure than one.

Given that we understand two factors are better than one, how does that work in
practice? We need to enable "two-factor authentication" on all the web apps we
want to trust (at least those who implement it!). Most (UK, at least) banks
support this by supplying their customers with a Chip & PIN reader. This is a
small, battery-powered, device that can communicate with the chip on your
credit card. When you supply with Chip & PIN reader with a valid PIN for your
card (which combines something you have -- the card -- with something you know
-- the PIN) then it responds with a unique code which demonstrates your
knowledge. This code is, helpfully, short enough that you can then type it into
a web form to confirm that you are who you claim to be.

Unless you're a credit card provider, though, it's difficult to justify the
cost of issuing unique cards -- which, if I recall correctly from University
days, run JVM byte code -- and card readers. On the plus side, most people have
mobile phones, and there are a couple of standard protocols that enable apps on
disconnected devices to generate codes that are suitable for two-factor
authentication. The actual details of these protocols are well beyond the scope
of this article, but suffice to say they're "good enough" to be trusted by
security professionals. Which is good enough for me. Mostly, they rely on a
universal concept of the current time (within a minute or so).
