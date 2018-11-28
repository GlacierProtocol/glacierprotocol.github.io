---
title: Key concepts
description: Overview of key concepts leveraged by Glacier to provide
 Bitcoin key security
---

## Signing

The process of using a private key to access bitcoins, referred to as "signing
a transaction". 

## Private key

A 256-bit number, usually expressed as a 64-character string of numbers and letters,
which can unlock bitcoin balances stored in the Bitcoin blockchain, a global
decentralized ledger.

Unlike a password, a private key is not meant to be memorized.
It is important to understand that the holder of the private key is the
holder of the bitcoin and, unlike traditional financial instruments, 
there is no legal recourse in the event of the key falling into the
hands of someone else. Bitcoin is decentralized, meaning there is no
company, person or entity that is liable.

## Single signature security

This is analogous to storing coins in a padlocked box, with a single key and padlock.

## Multisignature, or multisig, security

Utilizes multiple private keys to provide greater security, while also protecting
against total loss in the event of the loss of some keys.

This is analogous to storing coins in a padlocked box, with multiple keys and
padlocks which open in different combinations. See the [Multisignature Security](/docs/overview/multi-signature-security)
section for more detail.

## Redeem script

Multisignature requires each of the multiple private keys to be accompanied by a
redeem script. This script, each of which is identical, defines how the keys
combine to release funds. Losing all redeem scripts leads to the total loss of funds.

## Offline key storage

Private keys should only ever be offline, or in "cold storage". They should
never be stored on any internet-connected computer, or "in hot storage",
because it provides an opportunity for hacking attempts or virus infection
via the internet. Viruses can attack in many ways, including searching the
local system for private keys or keylogging data entry.

A private key can be encrypted, meaning a private key in a hacker's
possession is unreadable, but this would not protect against [keylogging malware](https://en.wikipedia.org/wiki/Keystroke_logging) where the encryption
password was also stolen.

## Paper key storage

Private keys, being relatively small pieces of information, can be stored
on paper as easily as they can in digital format. Paper has the following
advantages:

* **Always offline**: No chance of accidental network connection
* **Easy & cheap**: Multiple copies of multiple keys can be made for backups
* **Durable**: Robust against mechanical failure