---
title: Key concepts
description: Overview of some of the key concepts leveraged by Glacier to make
  sure your Bitcoin keys are kept safe.
---

## Private Key

Your currency balance is effectively stored in the Bitcoin
blockchain -- the global decentralized ledger. You can imagine a locked box
with all of your bitcoins sitting inside of it. This box is unlocked with
a piece of information known as "private key". (Some boxes require multiple
private keys to unlock; see the section "Multisignature Security"
below.)

Unlike a password, a private key is not meant for you to remember.
It's a long string of gibberish.
The private key is what you need to keep
secure. If anyone gets it, they can take your money. Unlike traditional
financial instruments, there is no recourse. There is no company that is
liable, because Bitcoin is a decentralized system not run by any person or
entity. And no law enforcement agency is likely to investigate your
case.

## Offline Key Storage ("Cold Storage")

You don't want to store your
private key on any computer that's connected to the Internet ("hot
storage"), because that exposes it to more hacking attempts. There are
viruses out there that search computers for private keys and steal them
(thereby stealing your money).

One way to protect against this is by
encrypting your private key, so even if a thief steals it, they can't read
it. This helps, but is not foolproof. For example, a thief might install
[keylogger malware](https://en.wikipedia.org/wiki/Keystroke_logging)
so that they steal your password too.

Online keys are
inherently exposed to hackers. You therefore need to make sure your private
key stays offline ("cold storage") at all times.

## Paper Key Storage

Because
the private key is a relatively small piece of information, it can be stored
on paper as easily as it can be stored on a computer. And when it comes to
key storage, paper has various advantages compared to computers: It's always
offline (no chance of accidentally connecting it to the Internet!), it's
easy & cheap to make multiple copies for backups (and different keys for
multisignature security -- see below), and it's not susceptible to
mechanical failure.
