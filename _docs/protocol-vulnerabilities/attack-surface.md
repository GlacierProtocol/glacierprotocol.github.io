---
title: Attack surface and failure points
description: Learn about the attack survace for Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

This section describes the attack surface and failure points for The Glacier
Protocol. Only attacks and failures related to The Glacier Protocol, as
opposed to other methods, are included. Any attack or failure related
to the Bitcoin system as a whole is ignored. A newly discovered cryptographic
flaw, or a critical Bitcoin protocol security or scalability failure, would
impact all bitcoins, regardless of whether they are secured with Glacier or
some other method.

It is assumed that no security measures from the [Extend Glacier security](/docs/extend/security)
section are implemented.

There are two layers to Glacier's attack surface, malware and critical failure.

## Malware infection vectors

Most attacks require the presence of malware, malicious code, either in or near the quarantined environment.

### Software

The operating system or application distributions could be compromised. In particular,
Glacier relies on the following packages and their dependencies:
* Ubuntu desktop
* Bitcoin Core
* zbar-tools (via Ubuntu Package Archive)
* qrencode (via Ubuntu Package Archive)

An infected Setup Computer could infect the Setup USB drive software, which could infect the
Quarantined USB drive software. This could produce false positives during the checksum
verification process or alter the display of the verification process results. Verifying
the integrity of GnuPG requires access to a trusted installation of GnuPG, which many
users won't have. The current recommendation is to trust the downloaded version of GnuPG.

An infected Setup Computer could infect the operating system or application USB drive software
AFTER checksum verification produces a true positive, either before/during copying of
software to the USB drive, or during USB ejection.

### Firmware

An infected Setup Computer could infect the Setup Boot USB drive firmware, which could infect
the Quarantined Boot/App USB drive.

A laptop or USB drive firmware could have been infected at any point between manufacture and
delivery, before being shrinkwrapped.

### Hardware

A laptop or USB drive hardware could have been infected at any point between manufacture and
delivery, before being shrinkwrapped. "Malware" usually refers to software, but we're
using it here more broadly to mean "computing technology which undermines the integrity
of the computing environment in which it resides.", as in a 
[USB JTAG exploit](https://www.itnews.com.au/news/intel-debugger-interface-open-to-hacking-via-usb-446889)
or [chip-level backdoor](https://www.wired.com/2016/06/demonically-clever-backdoor-hides-inside-computer-chip/). 

## Failure scenarios

Scenarios in which a critical failure might happen. Possibly, but not necessarily, due
to a malware infection.

### Exfiltration of critically sensitive data
A Quarantined Computer could leak critically sensitive data via a 
[side-channel attack](https://en.wikipedia.org/wiki/Side-channel_attack), which is a form
of electronic threat based on the physical nature of computing hardware as
opposed to algorithms or their software implementations. Complementary malware, on a 
networked or attacker-controlled device in range, is then used to steal data. Side channel
attacks are rare, but most are relatively straightforward to defend against. Possibilities
include:
  * **Visual side channel**: Exploit of sensitive visual data. Data is displayed on the
  screen as part of the protocol, so does not require malware on the quarantined computer.
  If the protocol is followed, the attack surface here should be narrow, as users are
  instructed to block all visual side channels. However, at a minimum, a smartphone with a
  camera is used for reading QR codes.
  * **[Acoustic side channel](https://en.wikipedia.org/wiki/Acoustic_cryptanalysis)**:
  Exploit of sounds emitted by computer or other device, if
  inadequately blocked by sound insulation or masking noise. [Data theft by fan noise](https://www.wired.com/2016/06/clever-attack-uses-sound-computers-fan-steal-data), for example.
  * **Radio side channel**: [Exploit of electromagnetic emanations from wired and wireless
  keyboards](https://www.usenix.org/legacy/event/sec09/tech/full_papers/vuagnoux.pdf),
  [transmission of radio signals from monitor to FM radio receiver](https://cyber.bgu.ac.il/content/how-leak-sensitive-data-isolated-computer-air-gap-near-mobile-phone-airhopper)
  or [radio waves leaked by a processor's power use](https://www.wired.com/2015/06/radio-bug-can-steal-laptop-crypto-keys-fits-inside-pita/),
  for example.
  * **Seismic side channel**: Decoding vibrations from nearby keyboard using mobile phone accelerometer, for example.
  * **Thermal side channel**: [Exploit using thermal sensors to detect heat emission](https://cyber.bgu.ac.il/blog/bitwhisper-heat-air-gap), for example.
  * **Magnetic side channel**: [Exploit using smartphone magnetic field sensors to extract hard drive data](https://fc15.ifca.ai/preproceedings/paper_14.pdf), for example.
  * **Rogue QR code**: Malware on a Quarantined Computer could exfiltrate critically
  sensitive data via QR codes IF cooperating malware on the QR reading device is prepared
  to steal the data. The risk of this scenario is negligible; unless the attacker
  simultaneously compromised every major smartphone QR reader with cooperating malware,
  any manipulation of QR codes would be quickly detected by users of non-compromised QR
  reader software, leading to widespread awareness and isolation of the threat. This makes
  it a very unattractive attack vector.
  * **Data leak**: Critically sensitive data could be leaked, intentionally or otherwise, as part of the
  payload of valid data. For example, the nonce used for a transaction signature could contains
  bits of the private key.
  * **Flawed data generation**: Undetected generation of flawed sensitive data IF compatible
  malware is present on BOTH quarantined environments. For example, standard software algorithms that
  generate random numbers, such as those used to generate Bitcoin private keys, are
  [vulnerable to exploitation](https://bitcoin.org/en/alert/2013-08-11-android), either due to malware
  or algorithmic weakness. This can often provide numbers that are not truly random.
  * **Guessable private keys**: Private key creation could be compromised to make keys easily guessable.
  * **Compromised addresses**: Transaction creation is compromised to use output addresses belonging to an attacker,
  AND cooperating malware on a networked computer sends the malicious transaction before the
  manual address verification is done.

### Physical failures

* Two paper keys are stolen by an attacker
* All (or all but one) paper keys are lost or destroyed
* An attacker with physical line-of-sight to the laptop takes a photo of the screen while sensitive data is displayed
* Malware on the quarantined machines writes sensitive data to persistent media (USB drive or laptop hard drive) AND the hardware is physically stolen afterward

### Glacier protocol failures

* Glacier hosting (i.e. DNS, Github, website hosting, etc.) is compromised
to inject weaknesses into the protocol documentation or GlacierScript
* Protocol delivery is compromised (e.g. with
a man-in-the-middle attack on the user's computer or network) to deliver
or display a weakened version of the protocol documentation or
software
* Protocol hardcopy is compromised (e.g. by malware to alter the user's hardcopy as it is printed)
* A flaw in GlacierScript causes sensitive data to be leaked or flawed
* Human error during protocol execution
* Design failure in the protocol misses or inadequately addresses a risk

Potential man-in-the-middle vulnerabilities are mitigated by including steps in
the protocol for verifying the signature and checksum of the Glacier document
itself. Unfortunatley, vulnerabilities remain:

* An attacker could remove the self-verification procedure from the protocol document.
* An attacker could compromise the Glacier Protocol keypair and create a fraudulent
signature. This is exceedingly unlikely, due to Keybase's key verification systems.
* The protocol document is verified on the first Setup Computer. It is not
verified on the second Setup Computer, nor when booting into the Setup Computers
to create the Quarantined Boot USB drives. If the protocol document had been
compromised between the initial validation and later re-validation, the user would
probably not notice, even without a forged signature.
* The protocol hardcopy could be compromised. For example, malware could alter the
hardcopy as it is printed)
* A flaw in GlacierScript could cause sensitive data to be leaked or flawed
* Human error could occur during protocol execution
* Design failure in the protocol could miss or inadequately address a risk