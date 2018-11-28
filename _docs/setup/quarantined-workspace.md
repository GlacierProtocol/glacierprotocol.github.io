---
title: Prepare quarantined workspaces
description: Learn how to prepare the quarantined hardware for Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

This section is to be followed immediately before executing the Deposit or
Withdrawal protocols. There is no need to continue if no deposits or withdrawals
are being executed.

1. Block side channels:
    1. Visual side channel:
        1. Ensure that no humans or cameras (e.g. home security cameras, which
        can be hacked) have visual line-of-sight to the Quarantined Computers.
        2. Close doors and window shades.
    2. Acoustic side channel:
        1. Choose a room where sound will not travel easily outside.
        2. Shut down nearby devices with microphones (e.g. smartphones and
        other laptops).
        3. Plug in and turn on a table fan to generate white noise.
    3. Power side channel:
        1. Unplug both Quarantined Computers from the wall.
        2. Run them **only on battery power** throughout this protocol.
        3. Make sure they are fully charged first! If you run out of battery,
        you'll need to start over.
    4. Radio and other side channels, including seismic, thermal, and magnetic:
        1. Turn off all other computers and smartphones in the room.
        2. Put portable computing devices in the Faraday bag and seal the bag.
        3. Unplug desktop computers.
2. Boot the “Q1” computer from the “Q1 BOOT” USB drive, referring to steps 1 and 2
from [Create the “Q1 BOOT” USB drive](/docs/setup/create-boot-usb/#create-the-q1-boot-usb-drive)
in the Create boot USB drives section if necessary.
3. Plug the Q1 APP USB into the Q1 computer
4. Copy the software to the Q1 computer's RAM disk.
    1. Click the File Manager icon from the launchpad on the left side of the
    screen.
    2. Click on the App USB on the left of the file manager.
    3. Drag the contents of the USB to the "Home" directory on the left side of
    file manager.
5. Open the "Glacier.pdf" file on the "Q1" computer. It will be in the "glacier"
folder, a sub-folder of "Home".

        You won't be able to click any external links in the document, since you
        don't have a network connection. If you need to look something up on the
        internet, do so in a distant room. Do not remove devices from the Faraday
        bag before doing going to the other room.

6. Open a Terminal window by pressing Ctrl-Alt-T.
7. Install the application software on the Q1 computer's RAM disk.
    ```
    $ cd ~/apps
    $ sudo dpkg -i *.deb
    ```
8. Change into the glacier directory. You'll be using this directory to execute
software for the protocol.
    ```
    $ cd ~/glacier
    ```
9. Prepare GlacierScript for execution.
    ```
    $ chmod +x glacierscript.py
    ```
10. Prepare the "Quarantined Scratchpad" -- an empty file you'll use as a place
to jot notes.
    1. Click the "Search your computer" icon at the top of the launcher along
    the left side of the screen.
    2. Type "text editor".
    3. Click the Text Editor icon.
    4. A blank window should appear.
11. Repeat the above steps using the Q2 computer, Q2 SETUP USB and Q2 APP USB.
