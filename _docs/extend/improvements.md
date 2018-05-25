---
title: Possible improvements to Glacier
description: Here's a list of improvements that can be made to Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---


## Don't store electronic copy of Cold Storage Information Page
Glacier recommends stores an electronic copy of the Cold Storage
Information Page for easy copy-pasting for subsequent deposits or
withdrawals. However, this is slightly less secure & complicated -- and
it's still a good idea to check a physical copy of the Cold Storage
Information Page to verify the electronic copy hasn't been tampered
with.

Printing QR codes on the Cold Storage Information Page would be
another way to avoid the need to manually transcribe the deposits and
withdrawals

## No Address Reuse
Currently, Glacier reuses addresses for
both depositing and withdrawing funds. As discussed in the protocol design
document, this has both privacy and security implications.

This could be
implemented with HD wallets, which would allow one to generate one master
key and then use new derived addresses for each deposit or change
transaction. Bitcoin Core does not yet support importing user-generated HD
wallets in a straightforward way.

Avoiding address re-use would also
prevent the use of a test withdrawal. Careful consideration would need to
be given as to whether there is another way to safely test funds access,
perhaps using something like the signrawtransaction Bitcoin Core
RPC.

## BIP39 Mnemonic Support
[BIP39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki) supports the creation of private keys
encoded as an English mnemonic for ease and reliability of transcription.
It's not yet supported by Glacier because it's not supported by Bitcoin
Core.

## Sign Withdrawal Transactions With Individual Signatures
Bringing
multiple private keys together in the same physical location for the
Withdrawal Protocol entails risk (they could be physically stolen). It
would be good to have an option to sign the withdrawal one transaction at
a time, probably by bringing a QR-encoded physical hardcopy of the
partially-signed transaction to the storage location of each private
key.

## Consider Shamir's Secret Sharing or Vanilla Multisig vs. P2SH Transactions
Glacier currently uses P2SH transactions. This allows all
signatories storing private keys to view the user's balance, because
a copy of the redeem script must be kept with each private key.

Vanilla
multisig transactions would address this, but it's not clear if it's
possible to do vanilla multisig configurations with
[over 3 keys](https://bitcoin.stackexchange.com/questions/23893/what-are-the-limits-of-m-and-n-in-m-of-n-multisig-addresses).
Another option is to use a single Bitcoin private key, split into n pieces
using [Shamir's Secret Sharing](https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing), which would not have any limitations on
the number of keyholders, but would require additional cryptographic
software be integrated into Glacier.

## Automate Quarantined USB creation
Many of the steps for creating the Quarantined USBs could be
automated in a simple script.

## Security With Biased Dice
Assess integration of this paper and/or [this algorithm](http://pit-claudel.fr/clement/blog/generating-uniformly-random-data-from-skewed-input-biased-coins-loaded-dice-skew-correction-and-the-von-neumann-extractor/) so that the quality of
our randomness is not vulnerable to dice bias.

## Entropy Quality Testing
Use an entropy test suite such as [ent](http://www.fourmilab.ch/random/) to verify the quality of
generated entropy before it's used.

## Bitcoin Core Version
Pinning Currently, we download Bitcoin Core on to the Quarantined App
USBs via the Ubuntu Package archive. However, because Bitcoin is
a privately-managed archive, it only hosts the latest release, rather than
all previous versions. This prevents us from pinning the protocol to use
a specific release (desireable for ongoing compatibility).
