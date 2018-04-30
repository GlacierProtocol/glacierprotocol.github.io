---
title: Create boot USBs
description: Learn how to prepare your USB drives for Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

Because the eternally quarantined computers cannot connect to a network, they
cannot download software. We'll be using USB drives to transfer the necessary
software to them.

We will prepare four bootable
[Ubuntu](https://en.wikipedia.org/wiki/Ubuntu_(operating_system))
USB drives. ("Bootable" means that the Ubuntu operating system will be booted
directly from the USB drive, without using the computer's hard drive in any
way.)

The first two USB drives ("Setup Boot USBs") are the USB drives you labeled
"SETUP 1 BOOT" and "SETUP 2 BOOT" in Section II. They will be prepared using
your Setup Computers, which may be running Windows, macOS, or something else.

The last two USB drives ("Quarantined Boot USBs") are the USB drives you
labeled "Q1 BOOT" and "Q2 BOOT" in Section II. They will be prepared using your
Setup Computers while booted off a Setup Boot USB.

Technical details: The Non-Quarantined OS USBs serve two purposes:

* First, they are used for creating the Quarantined App USBs in the next
section, which greatly simplifies the process of doing so because we know
it'll always be done from an Ubuntu environment. (We can't use the
Quarantined OS USBs for this -- they're eternally quarantined, so they need to
be permanently unplugged from their Setup Computer the moment they are created.)
* Second, it will be harder for any malware infections on a Setup Computer's
default OS to undermine a Quarantined USB setup process (the malware would
first have to propagate itself to the Non-Quarantined OS USB).

1. Perform the following steps on your SETUP 1 computer.
2. If you are not already reading this document on the SETUP 1 computer, open a
copy there.
3. Download Ubuntu by going to this link:

    [http://old-releases.ubuntu.com/releases/xenial/ubuntu-16.04.1-desktop-amd64.iso](http://old-releases.ubuntu.com/releases/xenial/ubuntu-16.04.1-desktop-amd64.iso)
    Wait until the download is complete.

4. Open a terminal window.

    1. **Windows**: Press Windows-R, type "powershell" and click OK.
    2. **macOS**: Click the Searchlight (magnifying glass) icon in the menu bar,
    and type "terminal". Select the Terminal application from the search results.
    3. **Linux**: Varies; on Ubuntu, press Ctrl-Alt-T. (On Ubuntu, press
    Ctrl-Alt-T.)

5. Verify the integrity of the Ubuntu download.

    1. Change the terminal window's active folder to the folder where you
    downloaded Ubuntu, customizing the folder name if necessary:

        1. **Windows**: `> cd $HOME/Downloads`
        2. **macOs**: `$ cd $HOME/Downloads`
        3. **Linux**: `$ cd $HOME/Downloads`

    2. View the fingerprint of the file:

        1. **Windows**: `> Get-FileHash -a sha256 ubuntu-16.04.1-desktop-amd64.iso`
        2. **macOs**: `$ shasum -a 256 ubuntu-16.04.1-desktop-amd64.iso`
        3. **Linux**: `$ sha256sum ubuntu-16.04.1-desktop-amd64.iso`

    3. The following fingerprint should be displayed:

        ```
        dc7dee086faabc9553d5ff8ff1b490a7f85c379f49de20c076f11fb6ac7c0f34
        ```

        It's not important to check every single character when visually
        verifying a fingerprint. It's sufficient to check the first 8
        characters, last 8 characters, and a few somewhere in the middle.

        Technical details: Because you verified the checksum & checksum
        signature for this document in Section I, we are omitting the GPG
        verification of some other fingerprints in the protocol. For a detailed
        security analysis, see the design document.

        You can verify this is the official Ubuntu fingerprint
        [here](http://releases.ubuntu.com/16.04/SHA256SUMS),
        or follow Ubuntu's full verification process using this guide.

6. Create the SETUP 1 BOOT USB.

    1. **Windows**
        1. Download the
        [Rufus disk utility](https://rufus.akeo.ie/)
        and run it.
        2. Insert the SETUP 1 BOOT USB in an empty USB slot.
        3. In the "Device" dropdown at the top of the Rufus window, ensure the
        empty USB drive is selected.
        4. Next to the text "Create a bootable disk using", select "ISO Image"
        in the dropdown.
        5. Click the CD icon next to the "ISO Image" dropdown.
        6. A file explorer will pop up. Select `ubuntu-16.04.1-desktop-amd64.iso`
        from your downloads folder and click Open.
        7. Click Start.
        8. If prompted to download Syslinux software, click "Yes".
        9. When asked to write in "ISO Image Mode (Recommended)" or
        "DD Image Mode", select "ISO Image Mode" and press OK.
        10. The program will take a few minutes to write the USB.

    2. **macOS**
        1. Prepare the Ubuntu download for copying to the USB.
            ```
            $ cd $HOME/Downloads
            $ hdiutil convert ubuntu-16.04.1-desktop-amd64.iso -format UDRW -o ubuntu-16.04.1-desktop-amd64.img
            ```
        2. Determine the macOS "device identifier" for the Boot USB.
            1. `$ diskutil list`
            2. Insert the SETUP 1 BOOT USB in an empty USB slot.
            3. Wait 10 seconds for the operating system to recognize the USB.
            4. Once more: `$ diskutil list`
            5. The output of the second command should include an additional
            section that was not present in the first command's output.
                1. This section will have (external, physical) in the header.
                2. The first line of the section's SIZE column should reflect
                the capacity of the USB drive.
            6. Make a note of the device identifier.
                1. The device identifier is the part of the new section header
                that comes before (external, physical) (for example /dev/disk2).

        3. Put Ubuntu on the SETUP 1 BOOT USB.
            1. First, unmount the usb
                ```
                $ diskutil unmountDisk USB-device-identifier-here
                ```
            2. Enter the following command, making sure to use the correct
            device identifier; using the wrong one could overwrite your hard
            drive!
                ```
                $ sudo dd if=ubuntu-16.04.1-desktop-amd64.img.dmg of= USB-device-identifier-here bs=1m
                ```
                Example:
                ```
                $ sudo dd if=ubuntu-16.04.1-desktop-amd64.img.dmg of=/dev/disk2 bs=1m
                ```
            3. Enter your administrator password when requested.
            4. Wait several minutes for the copying process to complete. When
            it does, you may see an error box pop up. This is expected; it's
            because the USB is written in a format readable by Ubuntu, but not
            readable by macOS.
            5. Click Ignore.

        4. Verify the integrity of the SETUP 1 BOOT USB (i.e. no errors or
        malware infection).
            1. Remove the USB drive from the USB slot and immediately reinsert it.
            2. Wait 10 seconds for the operating system to recognize the USB.
            3. You may see the same error box pop up again. Select Ignore.
            4. The USB's device identifier may have changed. Find it again:
                ```
                $  diskutil list
                ```
            5.  
                ```
                $ cd $HOME/Downloads
                ```
            6.  
                ```
                $ sudo cmp -n `stat -f '%z' ubuntu-16.04.1-desktop-amd64.img.dmg` ubuntu-16.04.1-desktop-amd64.img.dmg USB-device-identifier-here
                ```
            7. Wait a few minutes for the verification process to complete.
            8. If all goes well, the command will output no data, returning to
            your usual terminal prompt.
            9. If there is a discrepancy, you’ll see a message like:
                ```
                ubuntu-16.04.1-desktop-amd64.img.dmg /dev/disk2 differ: byte 1, line 1
                ```
                If you see a message like this, STOP -- this may be a security
                risk. Restart this section from the beginning. If the
                issue persists, try using a different USB drive or a different
                Setup Computer.

    3. **Ubuntu**
        1. If this is your first time using Ubuntu, note:
            1. You can copy-paste text in most applications (e.g. Firefox) by
            pressing Ctrl-C or Ctrl-V.
            2. You can copy-paste text in a terminal window by pressing
            Ctrl-Shift-C or Ctrl-Shift-V.
        2. Put Ubuntu on the SETUP BOOT 1 USB.
            1. Open the Ubuntu search console by clicking the purple
            circle/swirl icon in the upper-left corner of the screen.
            2. Type "startup disk creator" in the text box that appears
            3. Click on the "Startup Disk Creator" icon that appears.
            4. The "Source disc image" panel should show the.iso file you
            downloaded. If it does not, click the "Other" button and find it
            in the folder you downloaded it to.
            5. In the "Disk to use" panel, you should see two lines. They may
            vary from system to system, but each line will have a device
            identifier in it, highlighted in the example below.
                ```
                Generic Flash Disk (/dev/sda)
                Kanguru Flash Trust ( /dev/sdb)
                ```
            6. Select the line containing SETUP 1 BOOT USB.49 Make note of the
            disk identifier (e.g. /dev/sdb).
            7. Click "Make Startup Disk" and then click "Yes".
            8. Wait a few minutes for the copying process to complete.

        3. Verify the integrity of the SETUP 1 BOOT USB (i.e. no errors or malware
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
            4.  
                ```
                $ cd $HOME/Downloads
                ```
            5.  
                ```
                $ sudo cmp -n `stat -c '%s' ubuntu-16.04.1-desktop-amd64.iso` ubuntu-16.04.1-desktop-amd64.iso USB-device-identifier-here
                ```
            6. If prompted for a password, enter the computer's root password.
            7. Wait a few minutes for the verification process to complete.
            8. If all goes well, the command will output no data, returning to
            your usual terminal prompt.
            9. If there is an issue, you'll see a message like:
                ```
                ubuntu-16.04.1-desktop-amd64.iso /dev/sda differ: byte 1, line 1
                ```
                If you see a message like this, STOP -- this may be a security
                risk. Restart this section from the beginning. If the issue
                persists, try using a different USB drive or a different Setup
                Computer.

7. Create the Q1 BOOT USB
    1. Boot the SETUP 1 computer from the SETUP 1 BOOT USB.
        1. Reboot the computer.
        2. Press your laptop's key sequence to bring up the boot device
        selection menu. (Some PCs may offer a boot device selection menu;
        see below.)
            1. **PC**: Varies by manufacturer, but is often F12 or Del. The
            timing may vary as well; try pressing it when the boot logo appears.
                1. On the recommended Dell laptop, press F12. You should see a
                horizontal blue bar appear underneath the Dell logo.
                2. The recommended Acer laptop does not have a boot menu. See
                below for instructions.
            2. **Mac**: When you hear the startup chime, press and hold
            Option (⌥) .

        3. Select the proper device to boot from.
            1. **PC**: Varies by manufacturer; option will often say "USB"
            and/or "UEFI".
                1. On the recommended Dell laptop, select "USB1" under "UEFI
                OPTIONS".
                2. The recommended Acer laptop does not have a boot menu. See below
                for instructions.
            2. **Mac**: Click the "EFI Boot" option and then click the up
            arrow underneath it.

                You do not need to select a network at this time. If more than
                one identical "EFI boot" option is shown, you may need to guess
                and reboot if you pick the wrong one.

        4. Some laptops don't have a boot device selection menu, and you need to go into the BIOS configuration and change the boot order so that the USB drive is first.
            1. On the recommended Acer laptop:
                1. Press F2 while booting to enter BIOS configuration.
                2. Navigate to the Boot menu.
                3. Select USB HDD, and press F6 until it is at the top of the list.
                4. Press F10 to save and automatically reboot from the USB.
        5. If the computer boots into its regular OS rather than presenting you
        with a boot device or BIOS configuration screen, you probably pressed
        the wrong button, or waited too long.
            1. Hold down your laptop's power button for 10 seconds. (The
              screen may turn black sooner than that; keep holding it down.)
            2. Turn the laptop back on and try again. Spam the appropriate
            button(s) repeatedly as it boots.
            3. If the computer boots immediately to where it left off, you
            probably didn't hold down the power button long enough.
        6. You'll see a menu that says "GNU GRUB" at the top of the screen.
        Select the option "Try Ubuntu without installing" and press Enter.
        7. The computer should boot into the USB's Ubuntu desktop.

    2. Enable WiFi connectivity.
        1. Click the cone-shaped WiFi icon near the right side of the menu bar.
        2. If the dropdown says "No network devices available" at the top, you need to enable your networking drivers:
            1. Click on "System Settings". It's the gear-and-wrench icon along
            the left side of the screen.
            2. A System Settings window will appear. Click the "Software &
            Updates" icon.
            3. A Software & Updates window will appear. Click the "Additional
            Drivers" tab.
            4. In the Additional Drivers tab, you'll see a section for a
            Wireless Network Adapter. In that section, "Do not use the device"
            will be selected. Select any other option besides "Do not use the
            device.""
            5. Click "Apply Changes".
            6. Click the cone-shaped WiFi icon near the right side of the menu
            bar again. There should be a list of WiFi networks this time.
        3. Select your WiFi network from the list and enter the password.
    3. Repeat steps 1-6 using the SETUP 1 computer to create the Q1 BOOT USB
    rather than the SETUP 1 BOOT USB.
        1. The instruction to plug a Quarantined Boot USB into your Setup
        computer should raise a red flag for you, because you should never
        plug a quarantined USB into anything other than the quarantined
        computer it is designated for! This setup process is the ONE exception.
        2. Because you have booted the SETUP 1 computer off the SETUP 1 BOOT
        USB, you will follow the instructions for Ubuntu, even if your computer
        normally runs Windows or macOS.
        3. Immediately after you are finished executing steps 1-6 with the Q1
        BOOT USB, remove the Q1 BOOT USB from the SETUP 1 computer.
            1. On your desktop, right-click the corresponding USB drive icon
            in your dock and select Eject from the pop-up menu.
            2. Remove the USB drive from the USB slot.
        4. **The Q1 BOOT USB is now eternally quarantined. It should never again
        be plugged into anything besides the Q1 computer.**
8. Create the SETUP 2 BOOT USB and Q2 BOOT USB
    1. Repeat steps 1-7 using the SETUP 2 computer, SETUP 2 BOOT USB, and Q2
    BOOT USB.
