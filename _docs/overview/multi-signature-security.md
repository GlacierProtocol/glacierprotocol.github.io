---
title: Multi-signature security
description: Glacier uses multiple private keys. This provides greater security,
 and protects against total loss in the event of the loss of a single key.
---

Multisignature security, or multisig, is central to Glacier.


## Single private keys are risky

The bearer asset nature of bitcoin makes it very difficult to secure. For example,
a private key, on paper, in a safe deposit box at a bank may seem secure, but 
there are various eventualities that could lead to total loss. The box could be
destroyed in a disaster, [seized](https://abcnews.go.com/GMA/story?id=4832471),
accessed after identity theft, or the entire bank could be robbed.

Self storage, perhaps in a fireproof safe at home, can mitigate some of these issues,
but it also introduces new risks. A home safe is considerably easier to access and
enter than a bank, as well as potentially introducing personal harm to home
occupants.

## What is multisignature security?

Multisignature security is analogous to a bank requiring signatures from multiple
people (for example, any two of a company's three designated officers) to access
funds in a company account.

Bitcoin provides a way to secure funds with a set of private keys, such that some
of the keys, but not necessarily all, are required to sign a transaction. For
example, a "2-of-3" withdrawal policy means that, of the three existing keys, two
are required. In general, a multisignature policy is described as being "m-of-n",
where n>=m.

The keys can then be stored in different locations to reduce the chance of any single
third party gaining access to the minimum required number of keys. Keys can also be
entrusted to the custody of another person, known as a "signatory."

## How does multisignature security help?

Multisignature security mitigates risk in the following scenarios:

* **Theft**: Control of a single key does not give access to the bitcoin
* **Loss**: Bitcoin can be recovered after the loss of a single key, if
misplaced or if the owner is incapacitated, by using the remaining keys

## Choosing a multisignature withdrawal policy

Below are common options for withdrawal policies, with option 1 being The Glacier
Protocol recommendation.

### Option 1: Self-custody of keys

A 2-of-4 withdrawal policy, with all private keys in the custody of the bitcoin owner,
where any two private keys can be combined to sign a transaction. This provides access
even in a scenario where two keys are lost or stolen.

The keys should be distributed as follows:

* One in a safe at home
* Three in safe deposit boxes, or private vaults, at different locations

In a self-custody system, estate planning becomes critical. Arrangements must be made
to provide third party access to funds in the event of death (e.g. for inheritance) or
incapacitation (e.g. for medical bills). This usually requires significant legal
arrangement to be made in advance.

The most failsafe way to ensure third party access to a safe deposit box is directly
via the bank. Standard estate planning legal documents should allow access to each box
upon personal incapacity or death, although banks may offer their own forms.

Another option may be to arrange a living trust, or local equivalent, where the trust
is the co-owner of the safe deposit box. A successor trustee could then access the box.

### Option 2: Distributed custody of keys

A 2-of-5 withdrawal policy is recommended, with private keys distributed to a number
of trusted individuals, or signatories. The extra key, five rather than the recommended
four in Option 1, mitigates the extra risk of signatories not sufficiently protecting
the key against loss. This has the following advantages:

* **Availability**: Vaults or safe deposit boxes may not be available in the local area.
* **Ease of setup**: It may be simpler to distribute keys to signatories than to travel
to multiple available vaults and set up accounts.
* **Ease of estate planning**: No complicated legal arrangements for signatories to
access funds.

Key distribution also has the following disadvantages:

* **Privacy**: All signatories can see the balance via the multisignature redeem script.
An alternate version of this protocol could be created using a different multisig
approach besides P2SH transactions, which would eliminate the ability of signatories to
view balances. See [Possible improvements to Glacier](/docs/extend/improvements#consider-shamirs-secret-sharing-or-vanilla-multisig-vs-p2sh-transactions) for details.
* **Signatory collusion**: Two signatories may collude to gain access to funds.
* **Signatory reliability**: A signatory may fail to store the key securely.
* **Signatory safety**: Signatories may be exposed to the risk of targeted physical theft.

Thorough estate planning arrangements, which allow executors to access the keys if
necessary, will allow the policy to be reduced from 2-of-5 to 2-of-4. Two keys should
be issued to trusted signatories rather than three.

Whether 2-of-5 or 2-of-4, each signatory should be able to communicate with each other
when needed.