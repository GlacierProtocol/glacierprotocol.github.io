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
protocol involves securing bitcoins in cold storage, using multisignature
security, with the keys stored only on paper.

## Eternally quarantined hardware

Eternally quarantined hardware is hardware with drastically limited
interfaces with the outside world. This prevents the transmission of
sensitive or harmful data, for example, private keys or malware. All
interfaces are considered, including network, USB and printer, because
all may be used to transmit data.

To ensure hardware is eternally quarantined, factory-new hardware is used to
minimize the risk of prior malware infection. This hardware must be
permanantly quarantined, effectively rendering it useless for anything other
than executing the protocol. The quarantine is *strictly* permanent because
any malware infection which gets through the quarantine may wait
indefinitely for an opportunity to use an available interface, for example,
if a quarantined laptop is later used to access the web. 

## Parallel hardware stacks

"Flawed data" is a class of attack which relies not on stealing
your sensitive data (e.g. private keys), but in subverting the process of
generating the sensitive data, with the intention of making it more easily
guessed by a third party. For example, a variant of the Trojan.Bitclip
attack replaces keys displayed on your screen, or stored in your clipboard,
with insecure keys.

By using eternally quarantined hardware, any malware attempting to take advantage
of flawed data would likely have already been present when the system arrived
from the manufacturer. For example, [the Lenovo Service Engine rootkit](https://thehackernews.com/2015/08/lenovo-rootkit-malware.html)
or [the Dell W32.Spybot worm](https://www.theregister.co.uk/2010/07/23/dell_malware_update/).

These attacks are defeated by detecting them before the flawed data is used.
This is done by replicating the entire data generation process on two
sets of eternally quarantined hardware from different manufacturers. If the
process generates identical data on both sets of hardware, it is exceptionally
unlikely that the data is flawed. Identical attacks would have to be present on
both sets of hardware, both of which are factory-new and both of which are from
different manufacturers.

## Bitcoin Core and GlacierScript

Glacier uses [Bitcoin Core](https://bitcoincore.org/) for all cryptographic and
financial operations. Its open source code has proven to be the most trustworthy,
most secure, and has had the highest degree of code review scrutiny over many years.

Glacier also utilizes GlacierScript to automate much of the manual work involved
in executing the protocol. GlacierScript's [open source code](https://github.com/GlacierProtocol/GlacierProtocol)
is straightforward, and extensively commented, to facilitate easy review for flaws
or vulnerabilities.

## Protocol output

The end result of the Glacier protocol is a set of paper information
packets, one for each private key needed for the multisignature withdrawal
policy. Each packet includes the following information:

* **One private key**: an alphanumeric string used to secure the funds
* **One cold storage address**: an alphanumeric string designating the virtual
"location" of the funds
* **One redeem script**: an additional code needed to access funds, shared
by all private keys.

Technical detail: The Glacier protocol reuses Bitcoin addresses. See the
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
