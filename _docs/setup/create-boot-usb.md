---
title: Create boot USB drives
description: Learn how to prepare the USB drives for Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

To ensure isolation from any network, USB drives will be used to transfer the necessary
software to the eternally quarantined computers. Four bootable Linux USB drives will be 
used to directly boot to the [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu_(operating_system))
operating system, eliminating the use of the computer's hard drive in any way.

In accordance with the [Prepare hardware](/docs/setup/prepare-hardware/#non-quarantined-hardware)
section:
* The Setup Boot USB drives, "SETUP 1 BOOT" and "SETUP 2 BOOT", will be prepared using
the Setup Computers "SETUP 1" and "SETUP 2", respectively.
* The Quarantined Boot USB drives, "Q1 BOOT" and "Q2 BOOT", will be prepared using
the Setup Computers "SETUP 1" and "SETUP 2", *while booted from the Setup Boot USB drives*,
“SETUP 1 BOOT” and “SETUP 2 BOOT”, respectively.

Technical details: The non-quarantined Setup Boot USB drives serve two purposes:

* To greatly simplify the steps for creation of the Quarantined App USB drives in the next
section, since only operations on an Ubuntu environment need outlined. The Quarantined Boot USB drives
cannot be used for this since they are eternally quarantined and should be permanently
unplugged from the Setup Computers the moment they are created.
* To reduce the risk of malware spreading from the native operating system of a
Setup Computer to a Quarantined USB drive. The malware would first have to propagate itself
to a Non-Quarantined "SETUP 1 BOOT" or "SETUP 2 BOOT" USB drive.

## On Setup Computer “SETUP 1”
Open a copy of this document.

### Download and verify Ubuntu

1. Download [Ubuntu](http://old-releases.ubuntu.com/releases/xenial/ubuntu-16.04.1-desktop-amd64.iso).

2. Once the download is complete, open a terminal window:

    * **Windows**: Press "Windows-R", type "powershell" and click "OK".
    * **MacOS**: Click the Searchlight (magnifying glass) icon in the menu bar,
    and type "terminal". Select the "Terminal" application from the search results.
    * **Linux**: Varies; on Ubuntu, press "Ctrl-Alt-T".

3. Verify the Ubuntu download integrity:

    1. Change the terminal’s current working folder to the download folder,
    customizing the folder name if necessary:

        * **Windows**: 
        ```
        > cd $HOME/Downloads
        ```
        * **MacOS**: 
        ```
        $ cd $HOME/Downloads
        ```
        * **Linux**: 
        ```
        $ cd $HOME/Downloads
        ```

    2. View the fingerprint of the file:

        * **Windows**: 
        ```
        > Get-FileHash -a sha256 ubuntu-16.04.1-desktop-amd64.iso
        ```
        * **MacOS**: 
        ```
        $ shasum -a 256 ubuntu-16.04.1-desktop-amd64.iso
        ```
        * **Linux**: 
        ```
        $ sha256sum ubuntu-16.04.1-desktop-amd64.iso
        ```

    3. The following fingerprint, further verified in 
    [the official Ubuntu fingerprint list](http://releases.ubuntu.com/16.04.1/SHA256SUMS)
    against "*ubuntu-16.04.1-desktop-amd64.iso",
    should be displayed:

        ```
        dc7dee086faabc9553d5ff8ff1b490a7f85c379f49de20c076f11fb6ac7c0f34
        ```

        Alternatively, follow [Ubuntu's official full verification process](https://tutorials.ubuntu.com/tutorial/tutorial-how-to-verify-ubuntu#0).

        It is not important to check every single character when visually
        verifying a fingerprint. It is sufficient to check the **first 8
        characters, last 8 characters, and a few somewhere in the middle.**

        Technical details: The GPG verification of some fingerprints in the 
        protocol are omitted because the checksum & checksum
        signatures for this document were verified in the [Verify and print protocol document](/docs/setup/verify/#document-verification) section. For a detailed
        security analysis, see the [design document](/docs/design-doc/overview).

### Create the "SETUP 1 BOOT" USB drive

**Windows**:
1. Download and run [Rufus disk utility](https://rufus.akeo.ie/).
2. Insert the "SETUP 1 BOOT" USB drive into an empty USB slot.
3. In the "Device" dropdown at the top of the Rufus window, ensure the
empty USB drive is selected.
4. Next to the text "Create a bootable disk using", select "ISO Image"
in the dropdown.
5. Click the CD icon next to the "ISO Image" dropdown.
6. In the file explorer that pops up, select `ubuntu-16.04.1-desktop-amd64.iso`
from the downloads folder and click "Open".
7. Click "Start".
8. If prompted to download Syslinux software, click "Yes".
9. When asked to write in "ISO Image Mode (Recommended)" or
"DD Image Mode", select "ISO Image Mode" and press "OK".

The program will take a few minutes to write the USB drive.

**MacOS**:
1. Prepare the Ubuntu download for copying to the USB drive:
    ```
    $ cd $HOME/Downloads
    $ hdiutil convert ubuntu-16.04.1-desktop-amd64.iso -format UDRW -o ubuntu-16.04.1-desktop-amd64.img
    ```
2. Determine the MacOS "device identifier" for the Boot USB drive:
    1. List all disks and partitions:
    ```
    $ diskutil list
    ```
    2. Insert the "SETUP 1 BOOT" USB drive in an empty USB slot.
    3. Wait 10 seconds for the operating system to recognize the USB drive.
    4. List all disks and partitions again:
    ```
    $ diskutil list
    ```
    5. The output from the second `diskutil list` should include an additional
    "(external, physical)" heading that was not present in the first `diskutil list`. 
    The first line of the section's "SIZE" column should reflect the capacity of the USB drive.
    6. Make a note of the device identifier, which is the part of the section header
    that comes before "(external, physical)", for example "/dev/disk2". This will be referred
    to as <span class="primary">USB-device-identifier</span> in the coming steps.

3. Copy the Ubuntu image onto the "SETUP 1 BOOT" USB drive:
    1. Unmount the USB drive:
        <pre><code>$ diskutil unmountDisk <span class="primary">USB-device-identifier</span></code></pre>
    2. Enter the following command, **making sure to use the correct
    device identifier; <span style="color: red;">using the wrong one could overwrite the hard
    drive!</span>**:
        <pre><code>$ sudo dd if=ubuntu-16.04.1-desktop-amd64.img.dmg of=<span class="primary">USB-device-identifier</span> bs=1m</code></pre>
        Example:
        ```
        $ sudo dd if=ubuntu-16.04.1-desktop-amd64.img.dmg of=/dev/disk2 bs=1m
        ```
    3. Enter the administrator password when requested.
    4. Wait several minutes for the copying process to complete.
    5. The resulting USB drive will not be readable by MacOS, which may result in an
    error box pop up. This is expected; click "Ignore".

4. Verify the integrity of the "SETUP 1 BOOT" USB drive to prove the absence of errors or
malware infection:
    1. Remove the "SETUP 1 BOOT" USB drive from the USB slot and immediately reinsert it.
    2. Wait 10 seconds for the operating system to recognize the USB drive.
    3. The USB drive will, again, not be readable by MacOS, which may result in an
    error box pop up. This is expected; click "Ignore".
    4. The USB drive's device identifier may have changed. List all disks and partitions again:
        ```
        $ diskutil list
        ```
    5. Change the terminal’s current working folder to the download folder,
    customizing the folder name if necessary:
        ```
        $ cd $HOME/Downloads
        ```
    6. Compare the "SETUP 1 BOOT" USB drive to the verified image:
        <pre><code>$ sudo cmp -n `stat -f '%z' ubuntu-16.04.1-desktop-amd64.img.dmg ubuntu-16.04.1-desktop-amd64.img.dmg` <span class="primary">USB-device-identifier</span></code></pre>
    7. Wait a few minutes for the verification process to complete.
    8. Successful verification will return to the terminal prompt, outputting no data.
    Failure will return a message showing how the USB drive differs from the downloaded image, for example:
        ```
        ubuntu-16.04.1-desktop-amd64.img.dmg /dev/disk2
        differ: byte 1, line 1
        ```
        If a message is returned, **STOP**. This may be a security
        risk. Restart the [Create the "SETUP 1 BOOT" USB drive](/docs/setup/create-boot-usb/#create-the-setup-1-boot-usb-drive)
        section from the beginning. If the issue persists, try repeating with a
        different USB drive or a different Setup Computer.

**Linux**:

Note that, for most applications (e.g. Firefox), copy and paste keyboard shortcuts are
"Ctrl-C" and "Ctrl-V" respectively, but, in a terminal window, the shortcuts are
"Ctrl-Shift-C" and "Ctrl-Shift-V".

1. Copy the Ubuntu image onto the “SETUP 1 BOOT” USB drive:
    1. Open the Ubuntu search console by clicking the purple
    circle/swirl icon in the upper-left corner of the screen.
    2. Type "startup disk creator" in the text box.
    3. Click on the "Startup Disk Creator" icon.
    4. The "Source disc image" panel should show the downloaded iso image file. If not,
    click "Other" and manually locate the download folder.
    5. The "Disk to use" panel should show two devices. The device descriptions may
    vary from system to system, but each one will have a device
    identifier, highlighted in the example below:
        <pre><code> Generic Flash Disk (<span class="primary">/dev/sda</span>)
    Kanguru Flash Trust (<span class="primary">/dev/sdb</span>)</code></pre>
    6. Select the "SETUP 1 BOOT" USB drive and make note of the disk identifier (e.g.
    "/dev/sdb"). This will be referred to as 
    <span class="primary">USB-device-identifier</span> in the coming steps.
    7. Click "Make Startup Disk" and then click "Yes".
    8. Wait a few minutes for the copying process to complete.

2. Verify the integrity of the “SETUP 1 BOOT” USB drive to prove the absence
of errors or malware infection:
    1. On the desktop, right-click the USB drive icon corresponding to the
    "SETUP 1 BOOT" USB drive, and select "Eject" from the pop-up menu.
    2. Remove the USB drive from the USB slot and immediately re-insert it.

        Technical details: In order to avoid detection, malware
        may wait until a USB drive is in the process of ejecting (i.e. once all
        integrity checks are completed) before infecting the USB drive. Ejecting and
        re-inserting the USB drive before checking integrity is a simple defence against this.

    3. Wait 10 seconds for the operating system to recognize the USB drive.
    4. Change the terminal’s current working folder to the download folder,
    customizing the folder name if necessary:
        ```
        $ cd $HOME/Downloads
        ```
    5. Compare the "SETUP 1 BOOT" USB drive to the verified image:
        <pre><code>$ sudo cmp -n `stat -c '%s' ubuntu-16.04.1-desktop-amd64.iso` ubuntu-16.04.1-desktop-amd64.iso <span class="primary">USB-device-identifier</span></code></pre>
    6. Enter the root password if requested.
    7. Wait a few minutes for the verification process to complete.
    8. Successful verification will return to the terminal prompt, outputting no data.
    Failure will return a message showing how the USB drive differs from the downloaded image, for example:
        ```
        ubuntu-16.04.1-desktop-amd64.iso /dev/sda differ:
        byte 1, line 1
        ```
        If a message is returned, **STOP**. This may be a security
        risk. Restart the [Create the "SETUP 1 BOOT" USB drive](/docs/setup/create-boot-usb/#create-the-setup-1-boot-usb-drive)
        section from the beginning. If the issue persists, try using a
        different USB drive or a different Setup Computer.

### Create the "Q1 BOOT" USB drive

1. Boot the "SETUP 1" computer from the "SETUP 1 BOOT" USB drive:
    1. Reboot the computer.
    2. Alter the boot device:

        If a boot device selection menu is not available, the boot device
        must be set in the BIOS configuration by putting the USB drive
        first in the boot order. Since specific menus vary from manufacturer
        to manufacturer, details are only offered for the recommended Acer laptop.

        * **PC with boot device selection menu**:
            1. Depending on manufacturer, tap "F12" or "Del". Timing
            can also vary, try tapping when the boot logo appears. Pressing
            "F12" on the recommended Dell laptop should produce a horizontal
            blue bar below the Dell boot logo to indicate the selection menu
            will appear.
            2. Depending on manufacturer, option may say "USB" and/or "UEFI".
            On the recommended Dell laptop, select "USB1" under "UEFI
            OPTIONS".
        * **PC without boot device selection menu**:
            1. Press "F2" when the boot logo appears.
            2. Navigate to the boot menu.
            3. Select "USB HDD", and press "F6" until it moves to the top of the list.
            4. Press "F10" to save and automatically reboot from the USB drive.
        * **Mac**:
            1. Press and hold "Option" (⌥) when the startup chime is heard.
            2. Click the "EFI Boot" option and then click the up arrow below. Do not
            select a network at this time. If more than one identical
            "EFI boot" option is shown, guess and repeat if boot is not
            successful.

        If, while trying to get into either the BIOS or boot device selection menu,
        the computer boots into its factory-installed operating system, the wrong button may have
        been pressed, or not pressed soon enough. Hold down the power button for a full
        ten seconds, even if the screen turns black sooner, and turn the computer back on.
        Repeat this step, tapping the appropriate button(s) repeatedly as it boots. If
        the computer boots *immediately* to where it left off, the power button was not
        held down long enough and should be held down again.
    3. On successful reboot, the "GNU GRUB" menu will appear. Select the option "Try
    Ubuntu without installing" and press "Enter". The computer should boot into the USB drive's
    Ubuntu desktop.

2. Enable WiFi connectivity:
    1. Click the cone-shaped WiFi icon near the right side of the menu bar.
    2. If the dropdown says "No network devices available" at the top, networking drivers
    need enabled:
        1. Click on the gear-and-wrench icon along the left side of the screen to open
        the system settings window.
        2. Click the "Software & Updates" icon to open the "Software & Updates" window
        3. Click the "Additional Drivers" tab.
        4. Select any other option besides "Do not use the device" in the "Wireless
        Network Adapter" section.
        5. Click "Apply Changes".
        6. Click the cone-shaped WiFi icon near the right side of the menu
        bar again. There should be a list of WiFi networks this time.
    3. Select the relevant WiFi network from the list and enter the password.
3. Create the "Q1 BOOT" USB drive by repeating the
[Download and verify Ubuntu](/docs/setup/create-boot-usb/#download-and-verify-ubuntu) and 
[Create the “SETUP 1 BOOT” USB](/docs/setup/create-boot-usb/#create-the-setup-1-boot-usb-drive)
sections, replacing each occurance of "SETUP 1 BOOT" with "Q1 BOOT". Also
take note of the following:
    * The instruction to plug a Quarantined Boot USB drive into the Setup
    Computer should raise a red flag, because **<span style="color: red;">a quarantined USB drive should never be plugged into anything other than its designated quarantined computer!</span>**
    This setup process is the **ONE** necessary exception.
    * The "SETUP 1" computer should boot from the "SETUP 1 BOOT" USB drive this time, meaning
    the Linux instructions are to be followed, even if the computer
    normally runs Windows or MacOS.
4. Immediately remove the "Q1 BOOT" USB drive from the "SETUP 1" computer:
    1. On the desktop, right-click the USB drive icon corresponding to the
    "SETUP 1 BOOT" USB drive, and select "Eject" from the pop-up menu.
    2. Remove the "Q1 BOOT" USB drive from the USB slot.

**The "Q1 BOOT" USB drive is now eternally quarantined and should only ever be plugged into the "Q1" computer.**

## On Setup Computer “SETUP 2”

### Create the "SETUP 2 BOOT" USB drive

Create the "SETUP 2 BOOT" USB drive by repeating the 
[Download and verify Ubuntu](/docs/setup/create-boot-usb/#download-and-verify-ubuntu) and
[Create the "SETUP 1 BOOT" USB drive](/docs/setup/create-boot-usb/#create-the-setup-1-boot-usb-drive)
sections, replacing occurances of "SETUP 1" and "SETUP 1 BOOT" with
"SETUP 2" and "SETUP 2 BOOT", respectively.

### Create the "Q2 BOOT" USB drive

Create the "Q2 BOOT" USB drive by repeating the 
[Create the "Q1 BOOT" USB drive](/docs/setup/create-boot-usb/#create-the-q1-boot-usb-drive)
section, replacing occurances of "SETUP 1", "SETUP 1 BOOT" and "Q1 BOOT" with
"SETUP 2", "SETUP 2 BOOT" and "Q2 BOOT", respectively.