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

The central concept the Glacier protocol uses to safeguard against theft
of private keys due to malware infection, is eternally quarantined hardware.

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

Performing an initial cold storage deposit requires a not-insignificant investment
in hardware (see [Hardware required](/docs/before-you-start/hardware)), along with
approximately 8 hours of work. This excludes time for:

* Obtaining equipment
* Printing documents
* Downloading files
* Physically storing the private keys

Subsequent deposits and withdrawals re-use the same equipment and take a
fraction of the time.

## No formal support

As a free, volunteer-developed community project, there is no formal support
channel for Glacier. However, advice may be available from community
members on the Glacier [Gitter chat room](https://gitter.im/glacierprotocol/Lobby)
or other Bitcoin community forums.

## Privacy considerations

Because the Bitcoin blockchain is public, the routing and storage of funds has
privacy implications. For example, any person receiving a cold storage
address for the purpose of sending funds, will be able to see the total cold
storage balance. This is easy to do with many free services, for example,
[BlockCypher](https://live.blockcypher.com).

This is true not just of individuals, but entities. That is, any online wallet
service used to send funds to cold storage can see the cold storage
balance, and may deduce the owner. The online wallet may, of course, also choose
to share this information with others.

If privacy is a concern, the easiest way to keep a cold storage balance private is
to route the payment through one (or more) intermediary addresses before sending
it to the cold storage address, with a few transactions going to each
intermediate address. This does not provide perfect privacy, but each
intermediate address provides increasing levels of obfuscation and
uncertainty.

If privacy is a *major* concern, consider exchanging bitcoin for a privacy coin,
then exchanging the privacy coin back to bitcoin. Each exchange will incur a fee
and, more importantly, will require trust that the exchange service will not
steal/lose the funds, or reveal personal details. The exact details of this process
is outside the scope of this document.

## Scope limits

Security can always be improved. While Glacier is designed to provide strong
protection for most, some situations, for example, being the focus of a targeted
attack by a sophisticated, well-resourced criminal organization, are beyond its scope.

For some additional security precautions beyond those provided in the standard
protocol, see the [possible improvements to Glacier](/docs/extend/improvements/)
section.