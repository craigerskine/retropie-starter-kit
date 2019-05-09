RetroPie Starter Kit
====================

This repo would only be useful for my own personal setup. I keep my roms on a USB Drive (optional NAS config as well), I renamed all my rom folders to a `company-system` format so they all line up nicely, and I re-organized the `es_systems.cfg` so systems in the UI appear in a more logical `console > portable > year` order rather than default alphabetical.

Some of these "steps" are just references in case I need to re-download artwork, get button ids for a new controller, etc.

SuperPi Case Power Button:
--------------------------
+ [Script](https://github.com/RetroFlag/retroflag-picase)

Theme:
-------
+ Download [art-book](https://github.com/anthonycaccese/es-theme-art-book) and upload to `//configs/all/emulationstation/themes/`
+ If you want __TurboDuo__ and a better __SuperGrafx__ system logos, upload `configs/all/emulationstation/themes/art-book/tg-cd/_inc/system.svg` and `configs/all/emulationstation/themes/art-book/supergrafx/_inc/system.svg`

__Alternate Game List View__
+ Edit `art-book/theme.xml`, search for "gamelist", and make the following changes:

      <!-- <forceUppercase>1</forceUppercase> -->
      <!-- <alignment>center</alignment> -->
      <horizontalMargin>.005</horizontalMargin>

Games over USB:
---------------
1. Turn __OFF__ USB rom service __before__ inserting USB drive containing roms:  
`RetroPie Setup > Configuration / tools > usbromservice`
2. Upload `configs/all/autostart.sh` (all rom folders should be in a `games` folder at the root of the drive)
3. Shutdown
4. Insert USB drive containing roms
5. Power on

Games over Network Share:
-------------------------
+ Edit `configs/all/autostart.sh`, modify user, password, path, and upload

__If you can't save (states/battery/etc.) to share:__
- `sudo chown -R pi /home/pi/RetroPie/roms`

Proper SuperGrafx Support:
--------------------------
+ Upload `configs/supergrafx`

Systems List:
-------------
+ Upload `configs/all/emulationstation/es_systems.cfg`

Sega CD CHD Support:
--------------------
+ Upload `configs/segacd/emulators.cfg`

Video Modes:
------------
+ Upload `configs/all/videomodes.cfg`

Artwork:
--------
+ `cd /home/pi/RetroPie/roms/[system]` - replace `[system]` with game system folder name
+ `/opt/retropie/supplementary/scraper/scraper -console_src=ss -max_height=540 -max_width=505 -image_dir=media -image_path=media -use_nointro_name=false`

8bitdo USB Adapter + SF30 Pro:
------------------------------
+ Press Pair on Adapter
+ Press B + Start on Controller
+ Press Pair for 2 seconds on Controller
+ After paired, press Select + Left for 2 seconds (controller will reconnect)... you will have to do this step after each power cycle on the pi. Does anyone know a better way?

After Update:
-------------
+ `RetroPie Setup > Configuration / tools > autostart > Boot to EmulationStation`

JoyStick Test:
--------------
+ `jstest /dev/input/js0`

Rotate Logs:
------------
Some controllers will create endless error logs. This technique will force the logs to obey normal logic and not fill your system SD card to the point where it is unusable.

+ Edit `/etc/logrotate.d/rsyslog`

      monthly
      size 10m
      rotate 12
      missingok
      notifempty
      compress
      delaycompress

      /var/log/syslog {
        postrotate
          invoke-rc.d rsyslog rotate > /dev/null
        endscript
      }

      /var/log/mail.info /var/log/mail.warn /var/log/mail.err
      /var/log/*.log /var/log/debug /var/log/messages {
        sharedscripts
        postrotate
          invoke-rc.d rsyslog rotate > /dev/null
        endscript
      }
