---
title: Verify and print protocol document
description: Learn how to set up for Glacier, the step-by-step protocol for
  storing bitcoins in a highly secure way
redirect_from: /docs/setup/
---

This section outlines the download, verification and printing of the
protocol document. A verified electronic copy will not be accessible at all times
during protocol execution, due to reboots and other changes to the computing
environment. Working from a hardcopy ensures there is always a verified copy of
the document available.

### On the "SETUP 1" computer

The "SETUP 1" computer must have printer access.

1. Review the errata for the version of Glacier used at
[https://github.com/GlacierProtocol/GlacierProtocol/releases.](https://github.com/GlacierProtocol/GlacierProtocol/releases)
2. Download the latest full release of Glacier (*not* just the protocol document)
at [https://github.com/GlacierProtocol/GlacierProtocol/releases.](https://github.com/GlacierProtocol/GlacierProtocol/releases)
3. Extract the downloaded ZIP file within the downloads folder, if the browser has not done so automatically.
4. Rename the folder containing the extracted files as "glacier".

    If the user has used Glacier before, *and* has the Glacier public key imported into a local GPG keyring, skip the next step.
that's fine; proceed as normal.)
5. Obtain the Glacier PGP public key, used to cryptographically verify the protocol document.

    Technical detail: Glacier's GPG keys are handled with good security practices.
    They were generated while booting from an Ubuntu Live USB on a factory-new laptop
    with the wireless card removed, and transferred via USB to a MacBook. The private
    key is not stored in the cloud. The public key is hosted separately from the
    software distributions, on [Keybase](https://keybase.io/), and secured with separate credentials stored
    in password managers.

   **If this step changes in future uses of Glacier, or this warning is removed, there is a security risk.**
   Stop and seek assistance.
    Technical detail: There is a chicken-and-egg problem here, in that this document
    is giving instructions for how to verify itself. Any attacker that compromised
    this document could also compromise these instructions so that the verification
    (erroneously) passes. There's no way to prevent this, unless the reader is familiar
    with the document before the compromise and recognizes that the verification
    instructions have changed. This is why a direct download link to the public key 
    is not provided. If an attacker changed the link, it could very easily go unnoticed.
    In the unfortunate event of a legitimate need to change the verification
    instructions (i.e. to publish a new public key, or change the means of obtaining
    the existing key), the announcement will first be disseminated publicly, signed (at a
    minimum) with contributer personal keys, and hopefully with the keys of well-known
    individuals from the Bitcoin community.

    1. Navigate to Glacier's Keybase profile at [keybase.io/glacierprotocol](https://keybase.io/glacierprotocol).
    2. Click the string of 16 letters and numbers, formatted "XXXX XXXX XXXX XXXX" next to the key icon.
    3. In the pop-up that appears, right-click the link reading "this key" and select
    "Save Link As..." or "Download Linked File As...".
    4. Name the file "glacier.asc".

6. Download and install [GnuPG](https://gnupg.org/), the software used for cryptographic
verification. GnuPG is the same software recommended by the Electronic Frontier
Foundation's [Surveillance Self-Defense](https://ssd.eff.org/en/about-surveillance-self-defense)
protocol.

    Technical details: Verification of the integrity of GnuPG itself is omitted.
    Although a trusted installation is encouraged where possible, this
    would require having access to a pre-existing, trusted installation of GnuPG.
    For many Glacier users, this will not be easy to come by. The risk of an 
    unverified PGP installation is relatively small, since an attacker would have
    to compromise not just the hosting of GPG distributions, but also the hosting
    of other software distributions used by Glacier. Such a breach would
    quickly be detected by the global community.

    1. **Windows**: Download and install the latest available version of
    [Gpg4win](https://www.gpg4win.org/). Use the default
    options.
    2. **MacOS**: Download and install the latest available version of
    [GPG Suite](https://gpgtools.org/).
    3. **Linux**: GnuPG is pre-installed in Linux distributions.

7. Open a terminal window:

    1. **Windows**: Press Windows-R, type "powershell" and click OK.
    2. **MacOS**: Click the Searchlight (magnifying glass) icon in the menu bar, and
    type "terminal". Select the Terminal application from the search results.
    3. **Linux**: Varies; on Ubuntu, press Ctrl-Alt-T.

8. Change the terminal's current working folder to the download folder. The
commands below are based on default settings; if the defaults have been altered, 
these commands will need customized to match.

    1. **Windows**:  `> cd $HOME/Downloads/glacier`
    2. **MacOS**:  `$ cd $HOME/Downloads/glacier`
    3. **Linux**: `$ cd $HOME/Downloads/glacier`

9. Verify the integrity of the downloaded document. For technical background about
this process, see Wikipedia's [Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
entry.

    1. Import the Glacier public key into the local GPG installation:
       ```
       $ gpg --import $HOME/Downloads/glacier.asc
       ```

    2. Use the public key to verify that the Glacier "fingerprint file" is legitimate:
       ```
       $ gpg --verify SHA256SUMS.sig SHA256SUMS
       ```
       Expected output (timestamp will vary, but e-mail and fingerprint should match):
       <pre>
       <span style="font-size: 10px;">gpg: Signature made Fri Feb 10 22:23:45 2017 PST using RSA key ID 4B43EAB0
       gpg: Good signature from "Glacier Team <contact@glacierprotocol.org>"
       gpg: WARNING: This key is not certified with a trusted signature!
       gpg:          There is no indication that the signature belongs to the owner.
       Primary key fingerprint: E1AA EBB7 AC90 C1FE 80F0  1034 9D1B 7F53 4B43 EAB0</span>
       </pre>
       The warning message is expected, and is not cause for alarm.

       Technical details:
       GPG was designed on the premise that public keys would be
       verified as actually belonging to their owners, either directly, by receiving
       a key face-to-face from a trusted person, or indirectly, via the cryptographic
       signature of someone whose public key is already verified. The warning
       message merely indicates that neither of these verifications have been done for
       Glacier's public key.
       This is standard practice with software distribution,
       even for major software packages like Ubuntu.
       Although there is no opportunity to personally
       verify Glacier's public key came from the Glacier team, there can be
       some degree of trust in the validity of the key, to the extent that it was
       generated and is hosted in a secure manner, and that the community
       is likely to have raised an alarm if it were surreptitiously changed by an
       attacker.

    3. Verify the fingerprints in the fingerprint file match the fingerprints of the
    downloaded Glacier files.

        1. On Linux or MacOS:

            **Linux**: `$ sha256sum -c SHA256SUMS 2>&1`

            **MacOS**: `$ shasum -a 256 -c SHA256SUMS 2>&1`

            Expected output:
            ```
            Glacier.pdf: OK glacierscript.py: OK
            base58.py: OK README.md: OK
            ```

        2. **Windows**:

            ```
            > Get-FileHash -a sha256 Glacier.pdf
            > cat SHA256SUMS | select-string -pattern "Glacier.pdf"
            ```
            Ensure that the hash output from the first command matches the hash output of the
            second command, irrespective of case.

    **If you do not see the expected output, your copy of the document has not been verified**.
    Stop and seek assistance.

10. Switch to use the new document.

    1. Open the newly verified version of the document.
    2. Close the unverified version of the document used until this point.
    3. Delete the old, unverified copy of the document.

11. Print the verified document.

    Use of the printed copy as a checklist is strongly encouraged. Steps can be physically
    marked off once completed. This reduces the risk of execution error by repeating or skipping steps.
