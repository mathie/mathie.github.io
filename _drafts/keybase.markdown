---
title: "Keybase: A Web 2.0 of Trust"
---

Ever since [Tim Bray introduced me to Keybase][ongoing1], I've been waiting
patiently to get in on the beta. (OK, not so patiently.) At last, yesterday, my
invitation came through, and I've been messing around with it since.

So, what's it all about? Secure communication with people you trust. The secure
communication part isn't anything new. It's using public key cryptography --
specifically that provided by [GnuPG][] -- to:

* Allow you to encrypt a message you send to a third party so only they can
  decode -- read -- it; and

* sign a message that you send to a third party, so that they can verify it was
  really you that sent the message, and that the message they're reading hasn't
  been tampered with since it was signed.

This technology has been around for a good couple of decades now, and has
become easier to acquire since the US relaxed their attitude to cryptography
being a 'munition' and, therefore, subject to strict export regulations. Public
key cryptography is great. The implementations of it are fast enough for
general use, and it's generally understood to be secure 'enough'.

There are two components to public key cryptography:

* A **public** key, which you can share with the world. Anyone can know your
  public key. In fact, in order to verify the signature on something you've
  sent, or in order to send you something which is encrypted, the other person
  *needs* your public key.

* Your **private** key, which you must keep to yourself. This is a sequence of
  characters which uniquely identifies your authority to sign messages, and
  your ability to decode encrypted messages sent to you. Most software allows
  you to attach a password to the private key, giving you [two factor
  authentication][] (something you have -- the private key file -- along with
  something you know -- the password).

I'm comfortable that you know how to keep stuff private. You have a personal
laptop, FileVault protecting the contents of the hard disk, with encrypted
backups, have a password on your private key, and you don't leave your laptop
lying unlocked in public places. That's cool. You've got a safe place to store
that private key.

But it leaves one key problem: how do you share your public key? And how do I
know that this public key, here, is really your key, not just somebody
pretending to be you? After all, the security of the whole system relies on me
having a public key that I trust really belongs to you.

Sharing public keys themselves is easy enough. There are many public key
servers which you can publish your key to. From there, it's just a case of
asking your encryption software to download that key from the servers. In my
case, I'll demonstrate with the GnuPG command line client, but the same
principle applies to most PGP implementations, including more friendly GUI
tools. I can tell you that my key id (a short, unique, identifier for every
public key) is `002DC29B`. You can now retrieve that key from the public key
servers:

    $ gpg --recv-keys 002DC29B
    [ FIXME: Fill this in later. ]

But how do you know that I'm really who I say I am? This whole article could be
an elaborate hoax from hackers in Estonia, who have commandeered my blog and
published this article, just to fool you into believing that this is really my
public key. If you're sending sensitive data, encrypted using this public key,
if it's not really me who owns the corresponding private key, the whole effort
has been in vain.

The traditional way to exchange public keys -- and therefore allow trustworthy,
secure, communication over the Internet -- is to meet in person. We'd meet up,
prove who we each were to the other's satisfaction (often with some
Government-issued photographic ID), and exchange bits of bits which had,
written or printed, a PGP fingerprint. This is a shorter, easier to verify (and
type!) representation of your PGP public key. For example, my public key's
fingerprint is:

    CF61 9DD5 6116 D3CD 4380 C1AE 8F7E 58DD 002D C29B

This hexadecimal string is enough to uniquely identify my public key, and to
verify that the key has not been tampered with. (Notice that the last two
blocks of the string correspond to the key id.) When you get back to your
computer, you can download my key from the public key server, as above, and
show its fingerprint:

    $ gpg --fingerprint 002DC29B
    pub   4096R/002DC29B 2012-07-20
          Key fingerprint = CF61 9DD5 6116 D3CD 4380  C1AE 8F7E 58DD 002D C29B
    uid       [ultimate] Graeme Mathieson <mathie@woss.name>
    uid       [ultimate] [jpeg image of size 9198]
    uid       [ultimate] Graeme Mathieson <mathie@rubaidh.com>
    uid       [ultimate] keybase.io/mathie <mathie@keybase.io>
    sub   4096R/4BDD1F4C 2012-07-20

If the fingerprint I handed you matches the fingerprint displayed, you can be
confident that the public key you've downloaded from the key servers really is
my key. If I'm confident that a particular key, and the identities on the key
(names, email addresses, sometimes a photograph), are correct, then I can
assert my confidence by "signing" the key, and publishing that signature back
to the public key servers.

Once I've verified that I have the right public key by checking the
fingerprints, the next step is to verify that the identities on the key are
accurate. In the case of a photograph, this is easy enough to do, by viewing
the image on the key. Does it match the person I just met? In the case of email
addresses, the easiest way to check is to send an email to each of the
addresses, encrypted using the public key we're verifying, including some pass
phrase. If the owner of the key responds with knowledge of the pass phrase,
then we have successfully confirmed they have control over both the key and the
email address.

Once we've verified the authenticity of the key itself, and of the identities
on it, all that remains is to sign the key. This indicates to our own
encryption software that we've successfully been through this process and don't
need to do so again. It also publishes to the world the assertion that I have
verified your identity.

That's all well and good if we can meet up in person to exchange public key
information in the first place. What if we can't? Is it still possible to
establish each other's public keys, and have a secure conversation? That's
where the web of trust comes in. In short, if I can't meet directly with you to
exchange keys, but we've each met with Bob, and exchanged keys with him, and I
trust Bob's protocol for signing keys, then I can be confident that the key Bob
asserts is yours, really is yours. This is where publishing the signatures back
to the key server comes in useful. If I can see Bob has signed your key, and I
trust Bob's verification process, then I can be confident that you really are
who you say you are.

The web can extend further than just one hop, so long as we trust all the
intermediate nodes in the graph to follow a rigorous verification process.
This, combined with [keysigning parties][] (where a large group of people,
often at user group meetings or conferences, get together to all exchange keys)
means a large network of people with whom we can securely communicate.

All these bits and pieces have been around for a long time. They're well
established protocols, have been battle tested, and I have confidence that
they're secure 'enough' for me (not only for secure communication, but for
software development[^1], and the distribution of software packages[^2]).

The trouble is that, despite all these systems having been around for a while,
they've never really reached mainstream acceptance. I suspect, if you've read
this far you can see why: it's complicated. It relies on a number of protocols,
and careful verification. You kinda have to trust individuals to follow the
protocols correctly, and completely, in order to trust what they assert.

PGP does allow you to assign a 'level' of trust to each individual in your web
of trust -- that's where the output above says `[ultimate]` since I trust
myself completely! -- so you can reflect the likelihood of an overall path
between two people being trustworthy based on the trustworthiness of the
intermediate people. But it's still complex and, well, you'd have to *really*
want secure communication in order to go to all this trouble, and it's not like
most of us have anything to hide, right?

The overall message, though, is that it's about assertions. And it's about
following the paths of those assertions so that you can make a single main
inference: the person I want to communicate with is the owner of this public
key. Let's follow through the protocol with a concrete example. I would like to
send a secure communication to my friend, [Mark Brown][]. We both use GnuPG to
send secure communications, and both already have established key pairs.
However, I haven't verified Mark's key id yet, so I cannot say for sure that
the key published on the public key servers really is the one he has control of.

The first step is to meet with Mark. As is tradition with such things, we'll
retire to the Holyrood Tavern for a pint or two, and to exchange key
fingerprints. We've each brought our government-issued photographic ID (a
driving license in my case, and a passport in Mark's case). We've established
that the photograph on the ID is a good likeness, verified the name matches who
we expect, and had a laugh because, despite knowing each other for 20 years, we
didn't know each other's middle names!


[ongoing1]: https://www.tbray.org/ongoing/When/201x/2014/03/19/Keybase

[^1]: Git allows authors to PGP-sign tags in their source control system. This provides a verifiable way of saying that the author is confident the source code contains the code they intended. Since an individual commit is a function of all the preceding commits, signing a single one asserts the history of the entire tree.

[^2]: Most Linux distributions (both dpkg- and rpm-based distributions, at least) allow authors to PGP-sign their packages. That, combined with the complete web of trust (every Debian developer has their key signed by at least one other Debian developer, in order to develop this web of trust), means we can be confident that a software package really did come from that developer.
