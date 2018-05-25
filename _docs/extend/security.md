---
title: Extend Glacier security
description: Learn how to extend the security of Glacier, beyond what's already
  considered in the main protocol.
redirect_from: /docs/extend/
---

Glacier is designed to provide strong protection for almost everyone -- even
those storing many millions of dollars.

However, it is not designed to provide adequate protection for truly
exceptional circumstances, such as a targeted attack/surveillance effort
(electronic or physical) by a well-resourced criminal organization. This
appendix briefly outlines additional measures one might consider if further
security were needed above and beyond those in the formal Glacier protocol.

We do not recommend considering these measures unless you feel you have a
strong need. This list is neither complete nor are the practices
cost-effective for almost any circumstances. In addition, implementing these
measures incorrectly may decrease security rather than increase it.

## Digital software security

* **Verify GnuPG installation**: When downloading a new copy of GnuPG on the
setup computer, one would ideally also verify the integrity of the download
using the signed checksum. This requires having a pre-existing trusted
installation of GnuPG available for verifying the checksum signature.
* **Cross-network checksum sourcing**: Using two different computers on two
different networks, obtain all the software checksums from the Internet and
verify they are identical, to reduce the risk that the checksums are being
compromised by a man-in-the-middle attack.
* **Quarantined checksum verification**: Verify all USB checksums on the
quarantined computers to eliminate any risk that software was altered between
checksum verification on the Setup Computers and when the USB is used in the
quarantined environment.
The only reason Glacier doesn't currently do this is because the process of
verifying the App USB checksums happens as part of Ubuntu's apt-get
application, which requires network connectivity. It can be done by hand
without apt-get, but it's significantly more involved and so was not included
in the protocol.
* **Greater differentiation of quarantined environments**: Instead of simply
using different hardware in each quarantined environment, use different
software (including a non-Linux-derived OS and a different Bitcoin wallet),
different smartphones (and different smartphone software, i.e. QR code
readers). Different software stacks eliminate the risk that a software bug or
vulnerability may generate a flawed key. See the
[design document](../design-doc/overview.md) for details on why this risk is
small enough to justify leaving it unaddressed in the formal protocol.
* **Dedicated pair of environments for each private key**: Use extra
environments such that each environment only touches one key both when
generating keys and signing transactions. Expand the definition of
"environment" to include the physical location in which Glacier is executed.
This way, compromising one environment will only compromise one key.
* **Deposit transaction verification**: If depositing bitcoins out of
self-managed storage, don't immediately send a transaction directly from one's
own wallet software. Instead, first export a raw signed transaction, and use a
service like Blockr to verify the transaction is actually sending the funds to
the correct address.
* **Avoid software random number generators**: Use a
[hardware random number generator](https://en.wikipedia.org/wiki/Comparison_of_hardware_random_number_generators)
instead.

## Side channel security

* **Faraday cage**: Use a
[Faraday cage](https://en.wikipedia.org/wiki/Faraday_cage)
to protect against electromagnetic side channels
([example](https://www.usenix.org/legacy/event/sec09/tech/full_papers/vuagnoux.pdf)).
Faraday cages can be
[self-built](https://www.thesurvivalistblog.net/build-your-own-faraday-cage-heres-how/)
or
[professionally built](https://www.faradaycages.com/server-rooms).

* **No QR codes**: Reading and relaying QR codes to a printer requires a
networked device, such as a smartphone, which could potentially receive data
from side channels. Instead of using QR codes, copy all redemption scripts and
transactions by hand, and keep all nearby smartphones powered off and in
Faraday bags through protocol execution. Note that transcription of redeem
scripts and transactions is not only a painstakingly long process, but
dangerously vulnerable to human error: any mistakes in the initial
transcription & storage of the redemption script will cause all funds to be
lost.

## Hardware security

* **Purchase factory-new Setup Computers**: Don't use existing computers for
your Setup Computers. Purchase them factory-new, and never use them on the same
network (to reduce the risk of infection by identical malware).
* **Use firmware-protected USBs**: Some USBs have extra features to protect
against malware targeting their firmware (e.g.
[BadUSB](https://arstechnica.com/information-technology/2014/07/this-thumbdrive-hacks-computers-badusb-exploit-makes-devices-turn-evil/)
or
[Psychson](https://github.com/brandonlw/Psychson)).
Examples include
[Kanguru drives](https://www.kanguru.com/secure-storage/defender-secure-flash-drives.shtml)
and
[IronKey drives](http://www.ironkey.com/en-US/encrypted-storage-drives/250-basic.html).
* **Purchase a factory-new printer**: Printers can have malware, which could
conceivably interfere with printing the hardcopy of the Glacier document. Use
a new printer for printing the Glacier document. Choose one without wireless
capabilities.
* **Purchase non-recommended equipment**: Don't purchase any
of the suggested equipment linked in this document -- if Glacier achieves
widespread adoption, that particular equipment may be targeted for sabotage to
undermine the protocol (e.g. loaded dice, malware pre-installed on
computers, etc.) Select your own comparable equipment from different
manufacturers.
* **Purchase from stores**:  Buy all equipment from stores,
to reduce the risk it will be
[tampered with before it is delivered to you](https://arstechnica.com/tech-policy/2014/05/photos-of-an-nsa-upgrade-factory-show-cisco-router-getting-implant/).
Don't choose the stores nearest your home or office. Don't leave the
equipment unattended until you are done using it.
* **Improved tamper-evident seals on laptops**: After you are done using the
laptop, paint over the hinge joints and cover screws with glitter nail polish
and take a picture. The randomness of the glitter is difficult to
recreate, so if the laptop is tampered with, you can see it, and know not
to use it for future protocol operations.
* **Secure or destroy quarantined hardware after use**:
If sensitive data was somehow stored on quarantined
hardware's permanent media due to a protocol error or malware, then
physical theft of the hardware becomes a concern. Store the hardware
somewhere secure such as a vault, or physically destroy it first.
Glacier is designed to only use a RAM disk, but it's possible some data is saved to
permanent media (hard drive or USB) without us realizing it.

## Paper key security

* **Paper key encryption**: Encrypt the contents of your paper keys using
[BIP38](https://github.com/bitcoin/bips/blob/master/bip-0038.mediawiki)
to further protect against physical theft.
Note that the question of how to securely store the passphrase is non-trivial. It
should be unique and hard to guess, which means it is non-trivial to remember. If
you are confident you can remember it, storing it only in your own memory will not
address estate planning needs. If you record it on paper, you need to make sure
those papers are stored securely -- they should not be stored with the keys, and
there should be a process for checking on them periodically to make sure they are
not lost or damaged.
* **Durable storage medium**: TerraSlate paper is extremely rugged, but you
might also consider laminating the paper for additional protection. You'll
need a [thermal laminator](http://a.co/cZBN1YU) and
[laminating pouches](http://a.co/ifISzje). An
even more durable approach would be to engrave the private keys in
metal.
* **High-security vaults**: Store keys in high-security vaults that
are more resistant to theft and disaster.
[See example](http://mountainvault.net/).
* **Geographically distributed storage**: Store keys in distant cities for
resilience against a major disaster that wipes out all keys at once.
* **Multiple fund stores**: Mitigate risk by splitting funds across more than
one Bitcoin address, each secured using Glacier, and don't keep printed keys
from different store in the same place.


## Personal security

* **Unique protocol execution site**: Rather than executing Glacier at your
home, office, or anywhere else you frequent, choose a new location (e.g.
a hotel) that is unlikely to have compromised or surveillance devices
present.
* **Avoid location tracking**: To avoid surveillance (including
from adjacent rooms, via side channels like radio waves), take steps to
avoid location tracking when executing Glacier. Don't carry a GPS-enabled
smartphone with you, don't use credit cards for purchases, etc.
* **Deliver keys by hand**: Don't use couriers or [phones](https://www.cbsnews.com/news/60-minutes-hacking-your-phone/) to
send keys to trusted associates. Hand-deliver them personally or using a trusted party.
* **Conventional personal security**: Home surveillance systems, bodyguards,
etc.
