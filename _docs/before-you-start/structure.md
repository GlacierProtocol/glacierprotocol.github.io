---
title: Protocol structure
description: This page explains the overall structure of Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

The overall Glacier protocol consists of several distinct subprotocols:

* **Setup**: Prepares hardware,
and downloads and verifies needed software & documentation.
* **Deposit**: For securely storing bitcoins.
* **Withdrawal**: For transferring some or all of your stored funds to another
bitcoin address.
* **Viewing**: For viewing the balance of your funds in secure storage.
* **Maintenance**: For ensuring funds in cold storage remain accessible and
secure.

## Sensitive Data

Critically-sensitive data (e.g. private keys) will be highlighted in red,
like this: <span class="danger">critically-sensitive-data-here</span>.

Critically sensitive data can be used by thieves to to steal your bitcoins. If
you follow the protocol precisely, your critically sensitive data will remain
secure.

Do
not do anything with critically sensitive data that the protocol does not
specifically instruct you to. In particular:

* Never send it over email or instant messenger
* Never save it to disk (hard drive, USB drive,
etc.)
* Never paste or type it into any non-eternally-quarantined
device
* Never take a picture of it
* Never let any untrusted person see it

Moderately-sensitive data (e.g. a cold storage address or redemption
script) will be highlighted in yellow, like this:
<span class="warning">moderately-sensitive-data-here</span>.

Moderately sensitive data impacts
privacy, but does not directly impact security. It cannot be used to
steal your bitcoins, but it can be used to see how many bitcoins you own
(if someone knows that the moderately sensitive data in question belongs
to you).

It does indirectly impact security, in that if someone knows you own a lot of
difficult-to-trace money, they have some incentive to rob, extort, or attack you
to get it.

The protocol recommends storing copies of moderately-sensitive
data electronically, in a "conventionally secure" manner (for example, in
a password manager such as
[1Password](https://1password.com/)). If you're particularly
concerned about privacy, you can forego electronic storage, because the protocol
also stores copies of moderately-sensitive data in cold storage with each private
key. However, this is not recommended.

This means that knowledge of your cold storage balance will be as secure as
access to any accounts which have their credentials stored in your password
manager. For most people, this is sufficient.

If you use only hardcopies, you'll need to manually type in a large amount of
gibberish data, by hand, with no errors, every time you withdraw funds from
cold storage.

### Terminal Usage

Many protocol steps involve
typing commands into a terminal window. Working in a terminal window is
analogous to working under the hood of a car. It allows you to give the
computer more precise commands than you can through the regular
interface.

Commands to be entered into a terminal window will be
displayed in a fixed-width font like this:

```
$ echo "everything after the $ could be copy-pasted into a terminal window"
```

The `$` at the beginning
of the line represents a terminal prompt, indicating readiness for user
input. The actual prompt varies depending on your operating system and its
configuration; it may be `$` , `>` , or something else. Usually the terminal
will show additional information (such as a computer name, user ID and/or
folder name) preceding every prompt.

In the above example, the text
splits across two lines because of the margins of this document. Each line
is not a separate command; it is all one command, meant to be entered
all at once. This is clear because there is no terminal prompt at the
beginning of the second line.
Proceed Carefully

If you encounter
**anything that is different** from what the protocol says you should
expect, **the recommendation is that you stop and seek help** unless your
expert opinion gives you high confidence that you understand all possible
causes and implications of the discrepancy.

**In general, follow the
protocol carefully, keep track of what step you are on, and double-check
your work**. Any errors or deviations can undermine your security.
