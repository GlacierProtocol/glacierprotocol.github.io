---
title: About Glacier
description: Glacier is a step-by-step protocol for long-term storage of
  Bitcoins, in an offline and secure way.
redirect_from:
  - /docs/
---

## A step-by-step, highly secure protocol for storing bitcoin

It thoroughly considers corner cases such as obscure vectors for malware 
infection, personal estate planning and human error resulting in loss of funds, as 
well as the future Bitcoin landscape where bitcoin is much more valuable and 
attracting many more security threats.

### Intended for

* **Personal storage**: Bitcoin owned solely by a single individual.
* **Investment-level value**: Bitcoin holdings around the level of a small
property in the local economy. Consideration should also be given to potential
future value appreciation.
* **Long-term storage**: Several months to years.
* **Technically unskilled users**: No technical expertise is required. Although
the Glacier protocol is long, it is clear and straightforward to follow.

### Not intended for

* **Institutional storage**: Internal controls, transparent auditing, and 
preventing access to funds by a single individual are outside the scope of this 
document.
* **Frequently-accessed funds**: Accessing highly secured bitcoin is cumbersome, 
introducing security risk through the possibility of human error with each 
interaction.
* **Procurement**: This document covers bitcoin storage, not procurement. It assumes
bitcoin has been procured and is ready to store.

### Protocol credentials

* **Expert advisors**: Development is guided with input from Bitcoin technology and 
security experts. See the [advisor list](https://glacierprotocol.org/contributors/) and [contributor list](/docs/contribute/acknowledgments/).
* **Open source**: The [design document](/docs/design-doc/overview), the [protocol document](https://github.com/GlacierProtocol/glacierprotocol.github.io) 
and the [GlacierScript](https://github.com/GlacierProtocol/GlacierProtocol) companion
software are all open source. This allows for continuous peer review and
examination to eliminate flaws and vulnerabilities. The protocol has evolved in 
conjunction with the wider Bitcoin community, and the code is straightforward and 
well commented. Both are available on Github.

## Alternatives
There is no such thing as perfect security, only degrees of security with corresponding
trade-offs in time, money, convenience, etc. Glacier focuses exclusively
on self-managed storage, but there are cheaper, lower security and more convenient options.

A reader familiar with Bitcoin security concepts may prefer to skip to the section
[Choosing a Multisignature Withdrawal Policy](/docs/overview/multi-signature-security#choosing-a-multisignature-withdrawal-policy).

### Online storage

For most people, most of the time, storing Bitcoin using a high-quality online storage 
service is sufficient. The pros and cons of the various online services are beyond the 
scope of this document. However, all online storage services entail risks which are
not present in a self-managed storage system:

1. **Identity spoofing**: Online accounts can be compromised, allowing a hacker to
assume the identity of a legitimate user.
2. **Network exposure**: Online services need to transmit security-critical
information over the Internet, which creates an opportunity for that information
to be stolen. In contrast, self-managed storage can be done with no network
exposure.
3. **Under constant attack**: Online services can be hacked by attackers from anywhere in
the world at any time of the day, week or year.
4. **Vastly larger target**: Customer funds are a part of a considerably larger asset pool, making
them much more attractive targets for hackers.
5. **Internal theft**: A large group of employees & contractors are trusted with internal
access to service funds.
6. **Seizure by service**: The service has the ability to seize customer funds. There are
examples where a hacked system has chosen to socialise its losses across all users. In 2016, 
[all users shared the total loss after Bitfinex was hacked](http://www.bbc.com/news/technology-37009319).
There are also examples of withdrawals being closed before the company files for bankruptcy protection.
In 2014, [Mt. Gox filed for bankruptcy after being hacked](https://www.bbc.co.uk/news/technology-25233230).
Both scenarios lead to huge losses for customers.
7. **Seizure by government decree**: Currently, in many countries, Bitcoin operates in a political
and legal grey zone. There is historical precedence of citizen funds being seized without any
suspicion of criminal activity. In 2010, [Cyprus unilaterally seized many bank depositors' funds](https://www.theguardian.com/world/2013/mar/25/cyprus-bailout-deal-eu-closes-bank)
to cope with an economic crisis and, in 1933, [the US government demanded citizens surrender almost all gold](https://en.wikipedia.org/wiki/Executive_Order_6102). Similar action during a future financial
crisis cannot be discounted.

Some online wallet services have insurance to cover losses, although that
insurance doesn't protect against all of these scenarios, and often has limits
on the amount insured.

Hybrid services, combining features of online and self-managed storage, are available. The design
of these services reduce, without eliminating entirely, some of the risks described above. However,
they still require care and technical competence to securely manage the electronic "keys" which
provide access to funds.

### Hardware wallets

Hardware wallets can provide a form of self-managed storage with good security. Again, the pros
and cons of the various hardware wallets are beyond the scope of this document. However, all
hardware wallets entail risks which are not present in a system adhering to Glacier:

1. **USB link**: All hardware wallets operate via a physical USB link to a regular computer. While
they employ extensive safeguards to prevent any sensitive data (such as private keys) from being
transmitted over this connection, it is possible that an undiscovered vulnerability could be
exploited by malware to steal private keys from the device.
2. **Potential tampering**: Verification that the hardware or software has not been tampered with is
nearly impossible. An attacker could compromise the manufacturing processes, or ship a malicious
device that looks like the hardware wallet you ordered.

For details on this and other security considerations, see the "No Hardware Wallets" section of the
[design document](/docs/design-doc/overview).