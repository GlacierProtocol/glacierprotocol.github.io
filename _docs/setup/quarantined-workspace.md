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
        1. Ensure both computers are fully charged as running out of battery
        will mean starting over. Computers should run **only on battery power**
        throughout this protocol.
        2. Unplug both Quarantined Computers from the wall.
    4. Radio and other side channels, including seismic, thermal, and magnetic:
        1. Turn off all other computers and smartphones in the room.
        2. Seal portable computing devices in the Faraday bag.
        3. Unplug desktop computers.
2. Boot the “Q1” computer from the “Q1 BOOT” USB drive, referring to steps 1 and 2
from [Create the “Q1 BOOT” USB drive](/docs/setup/create-boot-usb/#create-the-q1-boot-usb-drive)
in the Create boot USB drives section if necessary.
3. Insert the "Q1 APP" USB into the "Q1" computer.
4. Copy the "Q1 APP" software to the "Q1" computer's RAM disk:
    1. Click the "File Manager" icon from the launchpad on the left side of the
    screen.
    2. Click on the "App USB" on the left of the file manager.
    3. Drag the contents of the "App USB" to the "Home" folder on the left side of
    the file manager.
5. Open the "Glacier.pdf" file on the "Q1" computer. It will be in the "glacier"
folder, a sub-folder of "Home".

    External links in the document will not be available, since there is no
    network connection. If necessary, accessing the internet should be done in
    a distant room. Do not remove devices from the Faraday bag before doing so.

6. Open a terminal window by pressing "Ctrl-Alt-T".
7. Install the application software on the Q1 computer's RAM disk:
    ```
    $ cd ~/apps
    $ sudo dpkg -i *.deb
    ```
8. Change the terminal’s current working folder to the "glacier" folder. This folder
will be used to execute software for the protocol:
    ```
    $ cd ~/glacier
    ```
9. Prepare GlacierScript for execution:
    ```
    $ chmod +x glacierscript.py
    ```
10. Prepare the "Quarantined Scratchpad" for jotting notes:
    1. Click the "Search your computer" icon at the top of the launcher along
    the left side of the screen.
    2. Type "text editor".
    3. Click the "Text Editor" icon to bring up a blank text editor window.
11. Repeat the above steps, replacing each occurance of "Q1" with "Q2", to prepare
a quarantined workspace on the "Q2" computer.