---
title: Protocol overview
description: Learn the basic concepts used in Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
redirect_from: /docs/before-you-start/
---

This section
establishes a basic understanding of the Glacier protocol in order to
facilitate its execution. For more background on the protocol's design, see
the [design document](/docs/design-doc/overview).

As described previously, the Glacier
protocol involves putting bitcoins in cold storage, using multisignature
security, with the keys stored only on paper.

## Eternally quarantined hardware

This bulk of the Glacier protocol consists of ways to safeguard
against theft of private keys due to malware infection. To accomplish this,
Glacier uses eternally quarantined hardware.

Quarantined hardware means
we drastically limit the ways in which a piece of hardware interfaces with
the outside world in order to prevent the transmission of sensitive data
(e.g. private keys) or harmful data (e.g. malware). We consider all
interfaces -- network, USB, printer, and so on -- because any of them
might be used to transmit malware or private keys.

Eternally quarantined
hardware means we use factory-new hardware for this purpose (to minimize
risk of prior malware infection), and never lift the quarantine. The
quarantine is permanent because any malware infection which does somehow
get through the quarantine might wait indefinitely for an opportunity to use
an available interface (e.g. the Internet, if a quarantined laptop is later
used to access the web). Eternal quarantining renders the hardware
essentially useless for anything else but executing this protocol.

## Parallel hardware stacks

There is a class of attacks which rely not on stealing
your sensitive data (e.g. private keys), but in subverting the process of
generating your sensitive data so it can be more easily guessed by a third
party. We call this "flawed data."

For example, a variant of the Trojan.Bitclip attack which replaces keys
displayed on your screen (or keys stored in your clipboard) with insecure keys.

Because we are generating our data in
eternally quarantined environments, any malware infection attempting this is
unlikely to have come from your other computers -- it would likely have
already been present when the quarantined system arrived from the
manufacturer. For example, the Lenovo rootkit or this Dell firmware malware
infection.

The way to defeat these attacks is to detect them before
we actually use the flawed data. We can detect such an attack by
replicating the entire data generation process on two sets of eternally
quarantined hardware, from different manufacturers. If the process
generates identical data on both sets of hardware, we can be highly
confident the data is not flawed because it would have to be an identical
attack present on both sets of hardware, factory-new from different
manufacturers. This is exceptionally unlikely.


## Bitcoin Core and GlacierScript

Glacier uses the [Bitcoin Core](https://bitcoincore.org/)
software for all cryptographic and financial operations, as its open source code
is the most trustworthy. This is due to its track record of securing large amounts
of money for many years, and the high degree of code review scrutiny it has
received.

Glacier also utilizes GlacierScript, a software program that
automates much of the manual work involved in executing the protocol.
GlacierScript's [open source code](https://github.com/GlacierProtocol/GlacierProtocol) is straightforward and extensively
commented to facilitate easy review for flaws or vulnerabilities.

## Protocol output

The end result of the Glacier protocol is a set of paper information
packets, one for each private key needed for the multisignature withdrawal
policy. Each packet includes the following information:

* One **private key** -- an alphanumeric string used to secure the funds
* The **cold storage address** -- an alphanumeric string designating the virtual "location" of the funds
* The **"redemption script"** -- an additional code needed to access funds, shared
by all private keys.

Technical details: The Glacier protocol reuses Bitcoin addresses. See the
[design document](/docs/design-doc/overview) for a detailed analysis.

## Protocol cost

The Glacier protocol requires over $600 in equipment, and approximately 8 hours of work to perform an initial cold storage deposit. This excludes time for:

* Obtaining equipment
* Printing documents
* Downloading files
* Physically storing the resulting Bitcoin keys

Subsequent deposits and withdrawals re-use the same equipment and take a
fraction of the time.

## No formal support

As a free, volunteer-developed community project, there is no formal support
channel for Glacier should you encounter any issues. However, you may be able to
ask advice of community members on our [Gitter chat room](https://gitter.im/glacierprotocol/Lobby)
or other Bitcoin community forums.

## Privacy considerations

Because the Bitcoin blockchain is public, the way you route and store funds has
privacy implications. For example, any person to whom you give your cold storage
address (because, for example, they're sending you funds which you want to keep
in cold storage) can see your total cold storage balance. This is easy to do
with many free services (e.g.
[Blockr](https://www.coinbase.com/) ).

This is true not just of individuals, but entities. That is, any online wallet
service which you use to send funds to cold storage can see your cold storage
balance, and may deduce that it belongs to you. They may, of course, also choose
to share this information with others.

If this is a concern for you, the easiest way to keep your
cold storage balance private from a particular entity is to route the
payment through one (or more) intermediary addresses before sending it to
your cold storage address, with a few transactions going to each
intermediate address. This does not provide perfect privacy, but each
intermediate address provides increasing levels of obfuscation and
uncertainty.

If privacy is very important to you, you might consider using
a service like
[Shapeshift](https://shapeshift.io/#/coins)
to exchange your Bitcoins for an more anonymous cryptocurrency, such as
[Monero](http://monero.org/),
and then exchange them back to Bitcoins.
However, this will cost you fees, and importantly, it requires you trust the
operator of the exchange service not to steal or lose your
funds.

[This guide](https://bitcoinnewsmagazine.com/how-to-use-monero-to-anonymize-bitcoin/)
gives additional detail about how to increase Bitcoin anonymity using Monero &
Tor.

## Out of scope

There's always more one could do to increase security. While
Glacier is designed to provide strong protection for almost everyone, some
situations (e.g. being the focus of a targeted attack by a sophisticated,
well-resourced criminal organization) are beyond its scope.

For some
additional security precautions beyond those provided in the standard
protocol, see the [possible improvements to Glacier](/docs/extend/improvements/).
