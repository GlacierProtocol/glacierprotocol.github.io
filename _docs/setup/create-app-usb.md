---
title: Create App USB drives
description: Learn how to prepare the App USB drives for Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

This section will prepare the two Quarantined App USB drives, "Q1 APP" and "Q2 APP" in the
[Hardware required](/docs/before-you-start/hardware/#eternally-quarantined) section, with
the software needed to execute the remainder of the protocol.

1. Boot the "SETUP 1" computer from the "SETUP 1 BOOT" USB drive, following step 1 of
[Create the “Q1 BOOT” USB drive](/docs/setup/create-boot-usb/#create-the-setup-1-boot-usb-drive)
in the Create boot USB drives section.
2. Insert the "Q1 APP" USB drive into the the "SETUP 1" computer.

    The instruction to plug a Quarantined App USB drive into the Setup Computer
    should raise a red flag, because  **<span style="color: red;">a quarantined USB drive
    should never be plugged into anything other than its designated quarantined computer!</span>**.
    This setup process is the **ONE** necessary exception.

3. Press "Ctrl-Alt-T" to open a terminal window.
4. Install the Glacier document and GlacierScript on the "Q1 APP" USB drive:
    1. Download the latest full release of Glacier, *not* just the protocol
    document, from the "Source code (zip)" link at
    [Glacier's Github repo](https://github.com/GlacierProtocol/GlacierProtocol/releases).
    2. Unpack the Glacier ZIP file into a staging area:
        1. When the download starts, Firefox will prompt for the action to take with the file
        once downloaded. Click "OK" to open with Archive Manager.
        2. In the Archive Manager window, click on the single entry in the list named
        "GlacierProtocol-<span class="primary">version</span>", where
        <span class="primary">version</span> is replaced with
        the current version number (for example, "v1.0"). Click "Extract".
        3. Select "Home" on the left panel of the file browser that appears and click "Extract" again.
        4. Click "Show the Files" once a popup declares the files are extracted.
        5. In the folder window that appears, rename the unzipped folder from "GlacierProtocol-<span class="primary">version</span>" to "glacier".
    3. Obtain the Glacier "public key," used to cryptographically verify the
    Glacier document and GlacierScript.

        **If you are ever using Glacier in the future and notice that this step
        has changed (or that this warning has been removed), there is a
        security risk.** Stop and seek assistance.

        1. Access Glacier's Keybase profile at https://keybase.io/glacierprotocol.
        2. Click the string of letters and numbers next to the key icon.
        3. In the pop-up that appears, locate the link reading "this key".
        4. Right-click the link and select "Save Link As..."
        5. Name the file "glacier.asc".

    4. Verify the integrity of the Glacier download.

        1. Import the Glacier public key into your local GPG installation:
           ```
           $ gpg --import ~/Downloads/glacier.asc
           ```
        2. Switch to the glacier folder:
           ```
           $ cd ~/glacier
           ```
        3. Use the public key to verify that the Glacier "fingerprint file" is
        legitimate:
           ```
           $ gpg --verify SHA256SUMS.sig SHA256SUMS
           ```
           Expected output (timestamp will vary, but
           e-mail and fingerprint should match):
           <pre><code><span style="font-size: 10px;">gpg: Signature made Thu Jan 19 13:45:48 2017 PST using RSA key ID 4B43EAB0
           gpg: Good signature from "Glacier Team <contact@glacierprotocol.org>"
           gpg: WARNING: This key is not certified with a trusted signature!
           gpg: There is no indication that the signature belongs to the owner.
           Primary key fingerprint: E1AA EBB7 AC90 C1FE 80F0 1034 9D1B 7F53 4B43</span>
           </code></pre>

           The warning message is expected, and is not cause for alarm.

        4. Verify the fingerprints in the fingerprint file match the fingerprints
        of the downloaded Glacier files:
           ```
           $ sha256sum -c SHA256SUMS 2>&1
           ```
           Expected output:
           ```
           Glacier.pdf: OK
           glacierscript.py: OK
           base58.py: OK
           README.md: OK
           ```

    5. Copy the glacier folder to the "Q1 APP" USB drive.
        1. Click on the File Manager icon in the launching dock along the left
        side of the screen.
        2. Find the "glacier" folder under "Home".
        3. Click and drag the glacier folder to the icon representing the USB
        drive on the left.
        4. If you see an "Error while copying" pop-up, you may be suffering from
        [this Ubuntu bug](https://bugs.launchpad.net/ubuntu/+source/nautilus/+bug/1021375).
        To fix it, do the following and then retry copying the files:

            1.  
                ```
                $ mv ~/.config/nautilus ~/.config/nautilus-bak
                ```
            2. Log out of Ubuntu: Click the power icon in the top right of the
            screen and select "logout" from the drop-down menu.
            3. Login again with user "ubuntu" and leave the password blank.

5. Open the Glacier protocol document so that it is available for copy-pasting terminal commands.
6. Install the remaining application software on the "Q1 APP" USB drive.
    1. Configure our system to enable access to the software we need in Ubuntu's
    "package repository".On Ubuntu 16.04.01  [there is a bug](https://bugs.launchpad.net/ubuntu/+source/appstream/+bug/1601971) in Ubuntu's package manager that affects systems
    running off a bootable Ubuntu USB drive. The commands in steps a and b are a
    workaround.
        1. ```
        $ sudo mv /var/cache/app-info/xapian/default /var/cache/app-info/xapian/default_old
        ```
        2. ```
        $ sudo mv /var/cache/app-info/xapian/default_old /var/cache/app-info/xapian/default
        ```
        3. ```
        $ sudo apt-add-repository universe
        ```
        4. ```
        $ sudo apt-add-repository ppa:bitcoin/bitcoin
        ```
        5. ```
        $ sudo apt-get update
        ```
    2. Download and perform integrity verification59 of software available from Ubuntu's package repository:
        * **bitcoind**: [Bitcoin Core](https://bitcoincore.org/):
        , which we'll use for cryptography & financial operations
        * **qrencode**: Used for creating QR codes to move data off quarantined
        computers
        * **zbar-tools**: Used for reading QR codes to import data into quarantined
        computers
            ```
            $ sudo apt-get install qrencode=3.4.4-1 zbar-tools=0.10+doc-10ubuntu1 bitcoind
            ```
    3. Copy that software to the "Q1 APP" USB drive.
        1. Create a folder for the application files that will be moved to the
        USB drive:
            ```
            $ mkdir ~/apps
            ```
        2. Copy the software into the apps folder:
            ```
            $ cp /var/cache/apt/archives/*.deb ~/apps
            ```
        3. Copy the contents of the apps folder to the "Q1 APP" USB drive:
            1. Click on the File Manager icon in the launching dock:
            2. Navigate to the "Home" folder.
            3. Click and drag "apps" folder to the icon representing
            the USB drive on the left panel.
7. Click on the USB drive icon to verify that it has the correct files. The
contents should look like this
    ```
    apps
    glacier
    ```

    Click the apps folder. It will have the following content.
    Note that the version number of the Bitcoin package may change as new
    versions are released. Future versions of Glacier may pin to a specific
    version.

    ```
    bitcoind_0.13.2-xenial1_amd64.deb
    libboost-chrono1.58.0_1.58.0+dfsg-5ubuntu3.1_amd64.deb
    libboost-program-options1.58.0_1.58.0+dfsg-5ubuntu3.1_amd64.deb
    libboost-thread1.58.0_1.58.0+dfsg-5ubuntu3.1_amd64.deb
    libdb4.8++_4.8.30-xenial2_amd64.deb
    libevent-core-2.0-5_2.0.21-stable-2_amd64.deb
    libevent-pthreads-2.0-5_2.0.21-stable-2_amd64.deb
    libqrencode3_3.4.4-1_amd64.deb
    libsodium18_1.0.8-5_amd64.deb
    libzbar0_0.10+doc-10ubuntu1_amd64.deb libzmq5_4.1.4-7_amd64.deb
    qrencode_3.4.4-1_amd64.deb zbar-tools_0.10+doc-10ubuntu1_amd64.deb
    ```
    Click the glacier folder. It will have the following content:
    ```
    base58.py
    Glacier.pdf
    glacierscript.py
    LICENSE README.md
    SHA256SUMS
    SHA256SUMS.sig
    ```
8. Eject and physically remove the "Q1 APP" USB drive from the "SETUP 1" computer.

    **The "Q1 APP" USB drive is now eternally quarantined. It should never again be
    plugged into anything besides the "Q1" computer.**

9. Repeat all above steps using the "SETUP 2" computer, "SETUP 2 BOOT" USB drive, and "Q2
APP" USB drive.
10. Find a container in which to store all of your labeled hardware, along
with the Glacier document hardcopy, when you are finished.
