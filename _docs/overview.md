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

## Background
A reader familiar with Bitcoin security concepts may prefer to skip to the section
[Choosing a Multisignature Withdrawal Policy](/docs/overview/multi-signature-security#choosing-a-multisignature-withdrawal-policy).

### Self-Managed vs. Online Storage

There is no such thing as perfect security. There are only degrees of security,
and those degrees come at a cost (in time, money, convenience, etc.) So the
first question is: How much security are you willing to invest in?
For most people, most of the time, the authors recommend storing Bitcoin using a
high-quality online storage service. The pros and cons of the various online
services are beyond the scope of this document, but most popular ones are fairly
secure and easy to use.

However, all online storage services still come with some notable risks
which self-managed storage does not have:

1. **Identity spoofing**: Your account on the service could be hacked (including
through methods such as identity theft, where someone convinces the service they
are you).
2. **Network exposure**: Online services still need to transmit security-critical
information over the Internet, which creates an opportunity for that information
to be stolen. In contrast, self-managed storage can be done with no network
exposure.
3. **Under constant attack**: Online services can be hacked by attackers from
anywhere in the world. People know these services store lots of funds, which
makes them much larger targets. If there's a flaw in their security, it's more
likely to be found and exploited.
4. **Internal theft**: They have to protect against internal theft from a large
group of employees & contractors.
5. **Intentional seizure**: They have the ability (whether of their own volition,
or under pressure from governments) to seize your funds.
There is historical precedent for this, even if funds are not suspected of
criminal involvement. In 2010,
[Cyprus unilaterally seized many bank depositors' funds ](https://www.theguardian.com/world/2013/mar/25/cyprus-bailout-deal-eu-closes-bank)
to cope with an economic crisis. In 1933, the US abruptly
[demanded citizens surrender almost all gold they owned to the government](https://en.wikipedia.org/wiki/Executive_Order_6102).
Regardless of how one views the political desirability of these particular
decisions, there is precedent for governments taking such an action, and one
cannot necessarily predict the reasons they might do so in the future.
Furthermore,Bitcoin still operates in a political and legal grey zone, which
increases these political risks.

Some online wallet services have insurance to cover losses, although that
insurance doesn't protect against all of these scenarios, and often has limits
on the amount insured.

These risks are not theoretical. Many online services have lost customers' funds
(and not reimbursed them), including
[Mt. Gox](https://www.bloomberg.com/news/articles/2014-02-28/mt-gox-exchange-files-for-bankruptcy),
[Bitfinex](http://www.bbc.com/news/technology-37009319),
and many more.

Recently, some providers are rolling out services which are a hybrid
of an online service and self-managed storage. Examples include
[Coinbase's multisig vault](https://www.coinbase.com/vault)
and [Green Address](https://greenaddress.it/en/).
The design of these services
significantly reduces (though does not eliminate) the risks described above.

However, they also require some care and technical competence to securely
manage the electronic "keys" which provide access to funds.

Many people do use online or hybrid solutions to store sizeable amounts of
money. We recommend self-managed storage for large investments, but ultimately
it's a personal decision based on your risk tolerance and costs you're willing
to pay (in money and time) for security.

Glacier focuses exclusively on self-managed storage.

### Glacier vs. Hardware Wallets

Many people who choose
self-managed storage (as opposed to an online storage service) use "hardware
wallets" such as the
[Trezor](https://trezor.io/),
[Ledger](https://www.ledgerwallet.com/),
and [KeepKey](https://www.keepkey.com/)
to store their bitcoins. While these are great products that provide strong security,
Glacier is intended to offer an even higher level of protection than today's
hardware wallets can provide.

The primary security consideration is that
all hardware wallets today operate via a physical USB link to a regular
computer. While they employ extensive safeguards to prevent any sensitive
data (such as private keys) from being transmitted over this connection,
it's possible that an undiscovered vulnerability could be exploited by
malware to steal private keys from the device.

For details on this and other security considerations, see the
"No Hardware Wallets" section of the [design document](/docs/design-doc/overview)
As with online multisig
vaults, many people do use hardware wallets to store sizeable amounts of
money. We personally recommend Glacier for large investments, but ultimately
it's a personal decision based on your risk tolerance and costs you're
willing to pay (in money and time) for security.
