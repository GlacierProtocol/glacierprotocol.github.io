---
title: Prepare quarantined workspaces
description: Learn how to prepare your quarantined hardware for Glacier, the
  step-by-step protocol for storing bitcoins in a highly secure way
---

This section is meant to be done immediately before executing the Deposit or
Withdrawal protocols. If you are executing the Setup Protocol for the
first time and do not plan on executing the Deposit or Withdrawal protocol now, you can stop here.

1. Block side channels

    [Side-channel attacks](https://en.wikipedia.org/wiki/Side-channel_attack)
    are a form of electronic threat based on the physical nature of computing
    hardware (as opposed to algorithms or their software implementations).
    Side channel attacks are rare, but it's relatively straightforward to
    defend against most of them.

    1. Visual side channel
        1. Ensure that no humans or cameras (e.g. home security cameras, which
        can be hacked) have visual line-of-sight to the Quarantined Computers.
        2. Close doors and window shades.
    2. [Acoustic side channel](https://en.wikipedia.org/wiki/Acoustic_cryptanalysis)
        1. Choose a room where sound will not travel easily outside.
        2. Shut down nearby devices with microphones (e.g. smartphones and
        other laptops).
        3. Plug in and turn on a table fan to generate white noise.
    3. [Power side channel](http://sharps.org/wp-content/uploads/CLARK-ESORICS13.pdf)
        1. Unplug both Quarantined Computers from the wall.
        2. Run them only on battery power throughout this protocol.
        3. Make sure they are fully charged first! If you run out of battery,
        you'll need to start over.
    4. [Radio](https://cyber.bgu.ac.il/how-leak-sensitive-data-isolated-computer-air-gap-near-mobile-phone-airhopper/)
    and other side channels. Including
    [seismic](https://www.cc.gatech.edu/fac/traynor/papers/traynor-ccs11.pdf),
    [thermal](https://cyber.bgu.ac.il/bitwhisper-heat-air-gap/),
    and [magnetic](http://fc15.ifca.ai/preproceedings/paper_14.pdf).
        1. Turn off all other computers and smartphones in the room.
        2. Put portable computing devices in the Faraday bag and seal the bag.
        3. Unplug desktop computers.
2. Put your Q1 BOOT USB into an open slot in your Q1 computer.
3. Boot off the USB drive. If you've forgotten how, refer to the procedure in Section IV.
4. Plug the Q1 APP USB into the Q1 computer
5. Copy the software from the Q1 computer's RAM disk.
    1. Click the File Manager icon from the launchpad on the left side of the
    screen.
    2. Click on the App USB on the left of the file manager. It will look like
    the image on the right, but may have a different name.
    3. Drag the contents of the USB to the "Home" directory on the left side of
    file manager.
6. Open a copy of this document on the Q1 computer.
    1. In the File Manager find the glacier folder. The PDF file for this
    document should be visible with the name "Glacier.pdf." Open it.

        You won't be able to click any external links in the document, since you
        don't have a network connection. If you need to look something up on the
        internet, do so in a distant room. Do not remove devices from the Faraday
        bag before doing going to the other room.

7. Open a Terminal window by pressing Ctrl-Alt-T.
8. Install the application software on the Q1 computer's RAM disk.
    ```
    $ cd ~/apps
    $ sudo dpkg -i *.deb
    ```
9. Change into the glacier directory. You'll be using this directory to execute
software for the protocol.
    ```
    $ cd ~/glacier
    ```
10. Prepare GlacierScript for execution.
    ```
    $ chmod +x glacierscript.py
    ```
11. Prepare the "Quarantined Scratchpad" -- an empty file you'll use as a place
to jot notes.
    1. Click the "Search your computer" icon at the top of the launcher along
    the left side of the screen.
    2. Type "text editor".
    3. Click the Text Editor icon.
    4. A blank window should appear.
12. Repeat the above steps using the Q2 computer, Q2 SETUP USB and Q2 APP USB.
