---
title: About Glacier
description: Glacier is a step-by-step protocol for long-term storage of
  Bitcoins, in an offline and secure way.
redirect_from:
  - /docs/
---

Glacier is a step-by-step protocol for storing bitcoins in a highly secure
manner. It is intended for:

* **Personal storage**: Glacier does not address institutional security
needs such as internal controls, transparent auditing, and preventing access
to funds by a single individual.
* **Large amounts of money ($100,000+)**: Glacier thoroughly considers corner
cases such as obscure vectors for malware infection, personal estate
planning, human error resulting in loss of funds, and so on.
Even if your Bitcoin holdings are more modest, it's worth considering using
Glacier. If Bitcoin proves successful as a global currency, it will appreciate
10x (or much more) in the coming years. Security will become increasingly
important if your holdings appreciate and Bitcoin becomes a more attractive
target for thieves.
The "Protocol Overview" section also describes some lower-security, lower-cost
approaches to self-managed storage that may be more appropriate for smaller
amounts of funds.
* **Long-term storage**: Glacier not only considers the Bitcoin security
landscape today, but also a future world where Bitcoin is much more valuable
and attracts many more security threats.
* **Infrequently-accessed funds**: Accessing highly secure bitcoins is
cumbersome and introduces security risk through the possibility of human
error, so it is best done infrequently.
* **Technically unskilled users**: Although the Glacier protocol is long, it is
clear and straightforward to follow. No technical expertise is required.

The Glacier protocol covers bitcoin storage, not procurement. It assumes you
already possess bitcoins and wish to store them more securely.

If you are already familiar with Bitcoin security concepts and are certain that
you want high security cold storage, you may prefer to read
[Trusting This Protocol](#trusting-this-protocol) and then skip to the section
[Choosing a Multisignature Withdrawal Policy](/docs/overview/multi-signature-security#choosing-a-multisignature-withdrawal-policy).

## Trusting this protocol

Funds secured using Glacier can only be as secure as its design.
Here's what you can trust about this protocol:
* **Expert advisors**: The development of Glacier was guided with input from
Bitcoin technology and security experts. See our advisor list.
* **Open source**: GlacierScript, the Glacier companion software, is open
source. The code is straightforward and well-commented to facilitate easy review
for flaws or vulnerabilities. [View it on Github](https://github.com/GlacierProtocol/GlacierProtocol).
* **Community review**: The protocol has evolved in conjunction with the wider
Bitcoin community. Early versions were circulated during development, and
community feedback integrated. [See our list of contributors](/docs/contribute/acknowledgments/).
* **Natural selection**: All documentation and code related to this protocol is
under open licenses (Creative Commons for the document, MIT license for the
code), enabling others to publish their own revisions. Inferior alternatives
will tend to lose popularity over time.

If you like, you may review the [design document](/docs/design-doc/overview)
for details on the technical design.

## Background

### Self-Managed Storage vs. Online

Let's start by assessing whether Glacier is right for you.

There is no such thing as perfect security. There are only degrees of security,
and those degrees come at a cost (in time, money, convenience, etc.) So the
first question is: How much security are you willing to invest in?
For most people, most of the time, the authors recommend storing Bitcoin using a
high-quality online storage service. The pros and cons of the various online
services are beyond the scope of this document, but most popular ones are fairly
secure and easy to use. Some popular options are
[Blockchain](https://blockchain.info/),
[Coinbase](https://www.coinbase.com/),
[Gemini](https://gemini.com/),
and [Kraken](https://www.kraken.com/).

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
