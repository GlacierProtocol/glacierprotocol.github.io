---
title: Protocol structure
description: This page explains the overall structure of Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

The Glacier protocol consists of several distinct sub-protocols:

* **Setup**: Preparing the hardware, downloading and verifying the software and
documentation.
* **Deposit**: Storing the bitcoin.
* **Withdrawal**: Transferring some or all stored bitcoin to another
bitcoin address.
* **Viewing**: Viewing the balance held in secure storage.
* **Balance and maintenance**: Ensuring the bitcoin in cold storage remains accessible and
secure.

## Sensitive data

*Critically-sensitive data* (e.g. private keys) will be highlighted in red,
like this: <span class="danger">critically-sensitive-data-here</span>.

*Critically* sensitive data can be used by thieves to to steal bitcoin. Follow
the protocol precisely to ensure critically sensitive data remains secure.

Do *not* do anything with critically sensitive data that is not *specifically*
outlined in the protocol. In particular:

* *Never* send critically sensitive data over email or instant messenger
* *Never* save critically sensitive data to disk (hard drive, USB drive, etc.)
* *Never* paste or type critically sensitive data into any non-eternally-quarantined
device
* *Never* take a picture of critically sensitive data
* *Never* allow critically sensitive data to be seen by any untrusted person

*Moderately-sensitive data* (e.g. a cold storage address or redeem script) will
be highlighted in yellow, like this: <span class="warning">moderately-sensitive-data-here</span>.

*Moderately* sensitive data impacts privacy, because it can be used to see the total
amount of bitcoin in storage, but does not directly impact security since it cannot
be used to withdraw the funds. However, it can indirectly impact security in
that potential thieves, knowing the amount held, may have the incentive to rob or
extort.

The protocol recommends storing copies of moderately-sensitive
data electronically, in a "conventionally secure" manner, for example, in
a password manager such as [1Password](https://1password.com/). This means that knowledge
of the cold storage balance will be as secure as access to other credentials stored in
the password manager. For most people, this is sufficient.

Although not recommended, the electronic storage of moderately-sensitive data can be
omitted to improve privacy, because the protocol also stores copies of
moderately-sensitive data in cold storage with each private key. It should be considered,
though, that moderately-sensitive data stored on paper will need to be typed by hand
every time funds are to be withdrawn from cold storage. The lengthy, complex nature of
this data makes errors likely.

### Terminal usage

Many protocol steps involve typing commands into a terminal window. Analogous to
working under the hood of a car, this allows the user to give the
computer more precise commands than can be given through the regular
interface.

Commands to be entered into a terminal window will be
displayed in a fixed-width font like this:

```
$ echo "all text after the $, on both lines, should either be copy-pasted from
this document or manually typed into a terminal window"
```

The `$` at the beginning of the line signifies that the text which follows is to be
executed from the terminal. The actual prompt varies depending on the operating
system and its configuration; it may be `$`, `>` , or something else. Usually,
the terminal will show additional information preceding every prompt, such as
a computer name, user ID and/or folder name.

In the above example, the text splits across two lines because of document margins. 
Each line is *not* a separate command; it is one command to be entered in its
entirety. This is clear because there is no `$` at the beginning of the second
line. Proceed carefully.

If the terminal response is in any way different to the expected response stated
in the protocol, **stop and seek help**. Continue only if all possible causes and
implications of the discrepancy are understood.

**In general, follow the protocol carefully, keep track of the current step and
double-check all work**. Any errors or deviations can undermine the security of the
process.