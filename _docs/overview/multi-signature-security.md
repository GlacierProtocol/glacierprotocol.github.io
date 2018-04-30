---
title: Multi-signature security
description: Glacier uses multiple keys to protect your Bitcoins. This makes it
  harder for someone to steal your Bitcoins, and allows you to still access them
  even if you lose one keys.
---

Central to our security protocols is
a technique called "multisignature security." You'll need a quick primer on
this topic to understand the Glacier protocol.

## Regular Private Keys are Risky

Remember that anybody with access to your private key can access your
funds. And if you lose your private key, you cannot access your money; it is
lost forever. There is no mechanism for reversal, and nobody to appeal
to.

This makes it difficult to keep funds highly secure. For example, you
might store a private key on paper in a safe deposit box at a bank, and feel
fairly safe. But even this is not the most robust solution. The box could be
destroyed in a disaster, or be robbed (perhaps via identity theft), or
[intentionally seized](http://abcnews.go.com/GMA/story?id=4832471).

You can try to mitigate these risks by storing the key yourself, perhaps in a
fireproof home safe (as opposed to a bank). But this introduces new risks. A
determined thief (perhaps a professional who brings safe-drilling tools on their
burglary jobs, or who somehow got wind of the fact that you have a $100,000
slip of paper sitting in a safe) might break into the safe and steal the wallet.

Or a major natural disaster might prevent you from returning home for an
extended period, during which time your safe is looted.

## What is Multisignature Security?

To address these
issues, Bitcoin provides a way to secure funds with a set of private keys,
such that some of the keys (but not necessarily all) are required to
withdraw funds. For example, you might secure your bitcoins with 3 keys but
only need any 2 of those keys to withdraw funds. (This example is known as
a "2-of-3" withdrawal policy.)

The keys are then stored in different
locations, so someone who gets access to one key will not automatically
have access to the others. Sometimes, a key is entrusted to the custody of
another person, known as a "signatory."

This approach of using multiple
keys is known as "multisignature security." The "signature" part of
"multisignature" comes from the process of using a private key to access
bitcoins, which is referred to as "signing a transaction." Multisignature
security is analogous to a bank requiring signatures from multiple people
(for example, any 2 of a company's 3 designated officers) to access funds in
an account.

## How Does Multisignature Security Help?

Multisignature security protects against the following scenarios:

* **Theft**: Even if somebody physically breaks into a safe, any one key is not
enough to steal the money.
* **Loss**: If a key is destroyed or simply misplaced, you can recover your money
using the remaining keys.
* **Betrayal**:
You may want to entrust one or more signatories with keys to facilitate
access to your funds when you are dead or incapacitated. With multisignature
security, entrusting them with a key will not enable them to steal your
funds (unless they steal additional key(s), or collude with another
signatory).

## Choosing a Multisignature Withdrawal Policy

Below are common options for withdrawal policies. You will need to select one
before beginning the protocol.

### Option 1: Self-custody of keys

Our default
recommendation is a 2-of-4 withdrawal policy where you manage all of your
own keys (i.e. you do not entrust any to the custody of friends or family).
2-of-4 means there are four keys, and any two of those keys can be combined
to access your money, ensuring access even if two keys are lost or
stolen.

The keys will be distributed as follows:

* One in a safe at home
* The remaining three in safe deposit boxes or [private vaults](https://www.google.com/search?q=private+safe+deposit+box) at
different locations

It's important to think about estate planning -- making
arrangements for your designated agents to be able to access your funds when
you are dead (e.g. for distribution to your heirs) or incapacitated (e.g. to
pay medical bills). This usually requires significant legal arrangements to
be made in advance.

The most failsafe way to ensure your agents will have access to your safe
deposit box is to check with the bank. Standard estate planning legal documents
should allow your agent to access the box upon your incapacity, and to get into
it upon your death. But banks can be fussy and sometimes prefer their own forms.

If you have a living trust, one option may be to have your trust as the co-owner
of your safe deposit box. That generally allows a successor trustee to access
the box.

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
