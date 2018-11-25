---
title: Create boot USBs
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
the Setup Computers "SETUP 1" and "SETUP 2".
* The Quarantined Boot USB drives, "Q1 BOOT" and "Q2 BOOT", will be prepared using
the Setup Computers "SETUP 1" and "SETUP 2" *while booted from* a *Setup Boot USB*,
“SETUP 1 BOOT” or “SETUP 2 BOOT”.

Technical details: The non-quarantined Setup Boot USB drives serve two purposes:

* They greatly simplify the steps for creation of the Quarantined App USBs in the next
section, because only an Ubuntu environment needs outlined. The Quarantined operating system USBs
cannot be used for this since they are eternally quarantined and should be permanently
unplugged from the Setup Computers the moment they are created.
* Malware infection of a Setup Computer's default operating system becomes more difficult. To
undermine a Quarantined USB setup process, the malware would first have to propagate
itself to the Non-Quarantined operating system USB.

## On Setup Computer “SETUP 1”
Open a copy of this document.

### Download and verify Ubuntu

1. Download Ubuntu from this link:

    [http://old-releases.ubuntu.com/releases/xenial/ubuntu-16.04.1-desktop-amd64.iso](http://old-releases.ubuntu.com/releases/xenial/ubuntu-16.04.1-desktop-amd64.iso)

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

        It's not important to check every single character when visually
        verifying a fingerprint. It's sufficient to check the **first 8
        characters, last 8 characters, and a few somewhere in the middle.**

        Technical details: The GPG verification of some fingerprints in the 
        protocol are omitted because the checksum & checksum
        signatures for this document were verified in the [Verify and print protocol document](/docs/setup/verify/#document-verification) section. For a detailed
        security analysis, see the [design document](/docs/design-doc/overview).

### Create the "SETUP 1 BOOT" USB

**Windows**:
1. Download and run [Rufus disk utility](https://rufus.akeo.ie/).
2. Insert the "SETUP 1 BOOT" USB into an empty USB slot.
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

The program will take a few minutes to write the USB.

**MacOS**:
1. Prepare the Ubuntu download for copying to the USB.
    ```
    $ cd $HOME/Downloads
    $ hdiutil convert ubuntu-16.04.1-desktop-amd64.iso -format UDRW -o ubuntu-16.04.1-desktop-amd64.img
    ```
2. Determine the MacOS "device identifier" for the Boot USB.
    1. List all disks and partitions:
    ```
    $ diskutil list
    ```
    2. Insert the "SETUP 1 BOOT" USB in an empty USB slot.
    3. Wait 10 seconds for the operating system to recognize the USB.
    4. List all disks and partitions again:
    ```
    $ diskutil list
    ```
    5. The output from the second `diskutil list` should include an additional
    section that was not present in the first `diskutil list` . It will
    contain "(external, physical)" in the header. The first line of the section's
    "SIZE" column should reflect the capacity of the USB drive.
    6. Make a note of the device identifier, which is the part of the section header
    that comes before "(external, physical)", for example "/dev/disk2".

3. Copy the Ubuntu image onto the "SETUP 1 BOOT" USB.
    1. Unmount the USB drive
        <pre>
        $ diskutil unmountDisk <span class="primary">USB-device-identifier-here</span>
        </pre>
    2. Enter the following command, **making sure to use the correct
    device identifier; <span style="color: red;">using the wrong one could overwrite the hard
    drive!</span>**
        <pre>
        $ sudo dd if=ubuntu-16.04.1-desktop-amd64.img.dmg of=<span class="primary">USB-device-identifier-here</span> bs=1m
        </pre>
        Example:
        ```
        $ sudo dd if=ubuntu-16.04.1-desktop-amd64.img.dmg of=/dev/disk2 bs=1m
        ```
    3. Enter the administrator password when requested.
    4. Wait several minutes for the copying process to complete.
    5. The resulting USB drive will not be readable by MacOS, which may result in an
    error box pop up. This is expected; click "Ignore".

4. Verify the integrity of the "SETUP 1 BOOT" USB drive to prove the absence of errors or
malware infection.
    1. Remove the "SETUP 1 BOOT" USB drive from the USB slot and immediately reinsert it.
    2. Wait 10 seconds for the operating system to recognize the USB.
    3. The USB drive will, again, not be readable by MacOS, which may result in an
    error box pop up. This is expected; click "Ignore".
    4. The USB's device identifier may have changed. List all disks and partitions again:
        ```
        $ diskutil list
        ```
    5. Change the terminal’s current working folder to the download folder,
    customizing the folder name if necessary:
        ```
        $ cd $HOME/Downloads
        ```
    6. Compare the "SETUP 1 BOOT" USB drive to the verified image:
        ```
        $ sudo cmp -n `stat -f '%z' ubuntu-16.04.1-desktop-amd64.img.dmg ubuntu-16.04.1-desktop-amd64.img.dmg` USB-device-identifier-here
        ```
    7. Wait a few minutes for the verification process to complete.
    8. Successful verification will return to the terminal prompt, outputting no data.
    Failure will return a message showing how the USB differs from the downloaded image, for example:
        ```
        ubuntu-16.04.1-desktop-amd64.img.dmg /dev/disk2
        differ: byte 1, line 1
        ```
        If a message is returned, **STOP**. This may be a security
        risk. Restart the [Create the "SETUP 1 BOOT" USB](create-the-setup-1-boot-usb)
        section from the beginning. If the issue persists, try repeating with a
        different USB drive or a different Setup Computer.

**Ubuntu**:

Note that, for most applications (e.g. Firefox), copy and paste keyboard shortcuts are
**Ctrl-C** and **Ctrl-V** respectively, but, in a terminal window, the shortcuts are
**Ctrl-Shift-C** and **Ctrl-Shift-V**.

1. Copy the Ubuntu image onto the “SETUP 1 BOOT” USB. 
    1. Open the Ubuntu search console by clicking the purple
    circle/swirl icon in the upper-left corner of the screen.
    2. Type "startup disk creator" in the text box.
    3. Click on the "Startup Disk Creator" icon.
    4. The "Source disc image" panel should show the downloaded iso image file. If not,
    click "Other" and manually locate the download folder.
    5. The "Disk to use" panel should show two devices. The device descriptions may
    vary from system to system, but each one will have a device
    identifier, highlighted in the example below:
        <pre>
        Generic Flash Disk (<span class="primary">/dev/sda</span>)
        Kanguru Flash Trust (<span class="primary">/dev/sdb</span>)</pre>
    6. Select the "SETUP 1 BOOT" USB and make note of the disk identifier (e.g.
    "/dev/sdb").
    7. Click "Make Startup Disk" and then click "Yes".
    8. Wait a few minutes for the copying process to complete.

2. Verify the integrity of the "SETUP 1 BOOT" USB (i.e. no errors or malware)
    1. On your desktop, right-click the corresponding USB drive icon in
    your dock and select Eject from the pop-up menu.
    2. Remove the USB drive from the USB slot and immediately
    <a href="#" class="popovers" data-toggle="popover" data-placement="top" title=""
    data-content="
    Technical details: In order to avoid detection, it's conceivable that malware
    might wait until a USB drive is in the process of being ejected (and all
    integrity checks presumably completed) before infecting the USB. Ejecting and
    re-inserting the USB before integrity checking is a simple workaround to
    defend against this.
    ">re-insert it</a>.
    3. Wait 10 seconds for the operating system to recognize the USB.
    4. Change the terminal’s current working folder to the download folder,
    customizing the folder name if necessary:
        ```
        $ cd $HOME/Downloads
        ```
    5. Compare the "SETUP 1 BOOT" USB drive to the verified image:
        <pre>
        $ sudo cmp -n `stat -c '%s' ubuntu-16.04.1-desktop-amd64.iso` ubuntu-16.04.1-desktop-amd64.iso <span class="primary">USB-device-identifier-here</span></pre>
    6. If prompted for a password, enter the computer's root password.
    7. Wait a few minutes for the verification process to complete.
    8. If all goes well, the command will output no data, returning to
    your usual terminal prompt.
    9. If there is an issue, you'll see a message like:
        ```
        ubuntu-16.04.1-desktop-amd64.iso /dev/sda differ:
        byte 1, line 1
        ```
        If a message is returned, **STOP**. This may be a security
        risk. Restart the [Create the "SETUP 1 BOOT" USB](create-the-setup-1-boot-usb)
        section from the beginning. If the issue persists, try using a
        different USB drive or a different Setup Computer.

### Create the "Q1 BOOT" USB

1. Boot the "SETUP 1" computer from the "SETUP 1 BOOT" USB.
    1. Reboot the computer.
    2. Alter the boot device:
        * **PC with boot device selection menu**:
            1. Depending on manufacturer, tap **"F12"** or **"Del"**. Timing
            can also vary, try tapping when the boot logo appears. Pressing
            "F12" on the recommended Dell laptop should produce a horizontal
            blue bar below the Dell boot logo to indicate the selection menu
            will appear.
            2. Depending on manufacturer, option may say "USB" and/or "UEFI".
            On the recommended Dell laptop, select "USB1" under "UEFI
            OPTIONS".
        * **PC without boot device selection menu**:
            Boot device selection must be set in the BIOS configuration by
            putting the USB drive first in the boot order. Since specific
            menus vary from manufacturer to manufacturer, details are only
            offered for the recommended Acer laptop.
            1. Press **"F2"** when the boot logo appears.
            2. Navigate to the boot menu.
            3. Select "USB HDD", and press "F6" until it moves to the top of the list.
            4. Press "F10" to save and automatically reboot from the USB.
        * **Mac**:
            1. Press and hold **"Option"** (⌥) when the startup chime is heard.
            2. Click the "EFI Boot" option and then click the up arrow below.
            
            Do not select a network at this time. If more than one identical
            "EFI boot" option is shown, guess and repeat if boot is not
            successful.

        If, while trying to get into either the BIOS or boot device selection menu,
        the computer boots into its regular operating system, the wrong button may have
        been pressed, or not pressed soon enough. Hold down the power button for a full
        ten seconds, even if the screen turns black sooner, and turn the computer back on.
        Repeat this step, tapping the appropriate button(s) repeatedly as it boots. If
        the computer boots *immediately* to where it left off, the power button was not
        held down long enough and should be held down again.
    3. On successful reboot, the "GNU GRUB" menu will appear. Select the option "Try
    Ubuntu without installing" and press "Enter". The computer should boot into the USB's
    Ubuntu desktop.

2. Enable WiFi connectivity. 
    1. Click the cone-shaped WiFi icon near the right side of the menu bar.
    2. If the dropdown says "No network devices available" at the top, networking drivers
    need enabled:
        1. Click on the gear-and-wrench icon along the left side of the screen to open
        the system settings window.
        2. Click the "Software & Updates" icon to open the Software & Updates window
        3. Click the "Additional Drivers" tab.
        4. Select any other option besides "Do not use the device" in the "Wireless
        Network Adapter" section.
        5. Click "Apply Changes".
        6. Click the cone-shaped WiFi icon near the right side of the menu
        bar again. There should be a list of WiFi networks this time.
    3. Select the relevant WiFi network from the list and enter the password.
3. Repeat steps 1-6 using the "SETUP 1" computer to create the "Q1 BOOT" USB
rather than the "SETUP 1 BOOT" USB.
    1. **The instruction to plug a Quarantined Boot USB into your Setup
    computer should raise a red flag for you, because <span style="color: red;">you should never
    plug a quarantined USB into anything other than the quarantined
    computer it is designated for!</span>**

        This setup process is the ONE exception.
    2. Because you have booted the "SETUP 1" computer off the "SETUP 1 BOOT"
    USB, you will follow the instructions for Ubuntu, even if your computer
    normally runs Windows or MacOS.
    3. Immediately after you are finished executing steps 1-6 with the "Q1
    BOOT" USB, remove the "Q1 BOOT" USB from the "SETUP 1" computer.
        1. On your desktop, right-click the corresponding USB drive icon
        in your dock and select Eject from the pop-up menu.
        2. Remove the USB drive from the USB slot.
    4. **The "Q1 BOOT" USB is now eternally quarantined. It should never again
    be plugged into anything besides the "Q1" computer.**

## On Setup Computer “SETUP 2”

### Create the "SETUP 2 BOOT" USB

1. Repeat steps in the [Create the "SETUP 1 BOOT" USB](/docs/setup/create-boot-usb/#create-the-setup-1-boot-usb)
section above, using the "SETUP 2" computer and the "SETUP 2 BOOT" USB.

### Create the "Q2 BOOT" USB

1. Repeat steps in the [Create the "Q1 BOOT" USB](/docs/setup/create-boot-usb/#create-the-q1-boot-usb)
section above, using the "SETUP 2" computer and the "Q2 BOOT" USB.