---
title: Ecosystem improvements
description: Here's a list of how the Bitcoin ecosystem could be improved with
  increased security.
---

The Glacier protocol is lengthy and complex because the tools for high-security cold storage do not exist. This appendix briefly outlines some of the tool functionality that would address this gap. For additional technical details, see the Glacier [design document](../design-doc/overview.md).

Ideally, the Bitcoin community (and other cryptocurrency communities) will create these tools as soon as possible and render Glacier obsolete. We invite inquiry and consultation by others interested in developing these tools.

## Cold Storage Hardware Wallets

* Function like conventional hardware wallets, but
eternally quarantined (no wireless or wired connections)
* I/O
  * Keyboard for entering data (key recovery, user entropy for key generation)
  * Camera for reading QR codes (for unsigned transactions)
  * Screen for displaying data, including QR codes (for complex data such as signed transactions)
* Generate keys from user-provided entropy (ideally two combined sources)
* Support for BIP39 and HD keys
* Multisig support
  * Each wallet storing one key is probably the way to go
  * Ability to for each device to add one single signature to a transaction, so only one key needs to be stored on a given device
  * Compatibility with HD keys
* Verifiability
  * All deterministic algorithms (for key generation, transaction generation, etc.)
  * Multiple wallet products on the market which use as many different hardware components as possible (to minimize the possibility of a common flaw / vulnerability)
* Simple
to use
* Display steps user through security steps -- how to safely generate their entropy, double-checking that addresses are correct,
verifying duplicate algorithm results on an alternate device, etc.
* Optional side channel protection
  * Partner with a company that manufactures some sort of Faraday glove box, and market it to customers who have extra-high security concerns

## Bitcoin Core improvements

Until robust cold storage hardware wallets are created, improvements in Bitcoin
Core could go a long way towards improving and simplifying Glacier,
including reducing the necessary complexity of GlacierScript.

* Add support for importing and using BIP32 HD keys.
* Generate keys based on raw user entropy so that key generation can be deterministically checked by a second quarantine computer.
* BIP39 key generation support
  * Promotes security through ease of use, and reduces risk of transcription errors
