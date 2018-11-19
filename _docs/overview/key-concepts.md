---
title: Key concepts
description: Overview of key concepts leveraged by Glacier to provide
Bitcoin key security
---

## Private Keys

Bitcoin balances are stored in the Bitcoin blockchain, a global
decentralized ledger, which can be unlocked with a piece of information
known as a "private key". This is analogous to storing coins in a
padlocked box, of which there can be multiple padlocks - see the 
[Multi-signature Security](/docs/overview/multi-signature-security)
 section.

Unlike a password, a private key is not meant to be memorized. It is a
256-bit number, usually expressed as a 64-character hexadecimal string.
It is important to understand that the holder of the private key is the
owner of the bitcoin and, unlike traditional financial instruments, 
there is no legal recourse in the event of the key falling into the
hands of someone else. Bitcoin is decentralized, meaning there is no
company, person or entity that is liable.

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
