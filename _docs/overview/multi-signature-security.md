---
title: Multi-signature security
description: Glacier uses multiple private keys. This provides greater security,
 and protects against total loss in the event of the loss of a single key.
---

Multisignature security, or multisig, is central to The Glacier Protocol.


## Single private keys are risky

The bearer asset nature of bitcoin makes it very difficult to secure. For example,
a private key, on paper, in a safe deposit box at a bank may seem secure, but 
there are various eventualities that could lead to total loss. The box could be
destroyed in a disaster, [seized](http://abcnews.go.com/GMA/story?id=4832471),
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

Another option is to distribute some of your
keys to individuals who you trust ("signatories"). This can offer some
advantages:

* **Availability**: If you live in a rural area, there may not be many vaults
or safe deposit boxes that are practical to get to.
* **Ease of setup**: It may be simpler to distribute keys to signatories than
to find available vaults, travel to them, and set up accounts.
* **Ease of estate planning**: You don't need to make complicated legal
arrangements for your signatories to access your funds. They'll have the keys
they need to do so.

However, there are significant drawbacks:

* **Privacy**: Other signatories will have the ability to see your balance.
Technical details: Every private key needs to be packaged with the multisig
redemption script (since losing all redemption scripts is just as bad as losing
all keys). Redemption scripts, however, allow one to view funds. An alternate
version of this protocol could be created using a different multisig approach
besides P2SH transactions, which would eliminate the ability of signatories to
view balances; see Appendix C for details.
* **Signatory collusion**: Although possessing one key won't allow a signatory
to access your funds, two signatories might collude with each other to steal
your money.
* **Signatory reliability**: A signatory may fail to store the key securely, or
they may lose it.
* **Signatory safety**: Giving your signatories custody of a valuable key may
expose them to the risk of targeted physical theft.
* **Kidnapping risk**: If you anticipate traveling in
[high-crime areas with kidnapping risk](http://www.nytimes.com/2012/05/03/business/kidnapping-becomes-a-growing-travel-risk.html),
your funds will be at greater risk because you'll
have the ability to access them remotely (by contacting your signatories and
asking for their keys).
Financially-motivated kidnapping hinges on your ability to access funds to give
to the kidnappers. If you are literally unable to access additional funds
(because the keys are stored in remote vaults which you must be physically
present to access, as opposed to held by friends or family who you can call),
kidnappers will have no incentive to hold you.

For distributed custody, we recommend a 2-of-5 withdrawal policy. The extra key
(5 keys, rather than the recommended
4 keys in Option 1) is recommended since you have less control over whether
a signatory effectively protects their key against theft or loss

If you have estate planning arrangements which you are confident will allow your
agents to access the keys in your custody when needed, you should be fine with
4 keys instead of 5 (two keys going to trusted signatories rather than three).
Make sure your executors and signatories know to get in touch with each other
when needed.
