---
title: Release notes
description: Check the release notes for Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

## Version 0.91: Upgrade Guidance
You should upgrade to v0.91 before executing the Withdrawal Protocol.

v0.91 has no security improvements, but withdrawals will fail
in some cases. Funds stored with earlier Deposit Protocols are perfectly
secure.

Changes
* The protocol was incapable of properly handling raw unspent transactions past a certain length:
* QR codes failed with transactions of a certain length
* With extremely large transactions, GlacierScript was incapable of processing them Workarounds have been implemented for both issues.
* Fixed minor errors in Setup Protocol for Windows machines
* Updated Ubuntu release link (old link broke when it became not-the-latest Ubuntu release)
* Added Errata section to website (for issues / fixes which haven't yet made it into an official release), and included protocol steps to check the Errata section.
* Fixed various typos (thanks /u/dooglus)

## Version 0.9 Beta: February 10, 2017

* Enabled HTTPS on website for improved security of protocol distribution
* Added Windows support to Setup Protocol
* Required the second Setup Computer to be "distinct" (e.g. preferably one not previously owned by the Glacier user) to minimize the chance of identical malware on both Setup Computers propagating to the quarantined environments (and generating an identical flawed key in both environments)
* Revised online wallet section to describe a wider variety of market options

## Version 0.1 Alpha: January 24, 2017
Initial non-public release to selected reviewers.
