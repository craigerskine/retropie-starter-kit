RetroPie Starter Kit
====================

This repo may only be useful for my own personal setup. I keep my roms on a USB Drive (optional NAS config as well), I renamed all my rom folders to a `company-system` format so they all line up nicely, my PSX collection is entirely set up as `.m3u` playlists to prevent duplicate listings, and I re-organized the `es_systems.cfg` so systems in the UI appear in a more logical `console > portable > year` order rather than nonsensical alphabetical.

Some of these "steps" are just references in case I need to re-download artwork, get button ids for a new controller, etc.

 Power Button:
--------------
+ [SuperPi](https://github.com/RetroFlag/retroflag-picase) Case Script
+ [Argon ONE](https://github.com/Argon40Tech/Argon40case) Case Script  
`curl https://download.argon40.com/argon1.sh | bash`

Games on USB:
-------------
1. Turn __OFF__ USB rom service __before__ inserting USB drive containing roms:  
`RetroPie Setup > Configuration / tools > usbromservice`
2. Upload `configs/all/autostart.sh` (all rom folders should be at `/System/games` on the USB drive)
3. Shutdown
4. Insert USB drive containing roms
5. Power on

Games on Network Share:
-----------------------
+ Edit `configs/all/autostart.sh`, modify user, password, path, and upload

__If you can't save (states/battery/etc.) to the mounted share:__
+ `sudo chown -R pi /home/pi/RetroPie/roms/games`

[art-book-next-retropie](https://github.com/anthonycaccese/art-book-next-retropie)
----------------------
+ Replace config files for better UX

*Proper* SuperGrafx Support:
--------------------------
+ Upload `configs/supergrafx`

Systems List:
-------------
+ Upload `configs/all/emulationstation/es_systems.cfg`

Sega CD CHD Support:
--------------------
+ Upload `configs/segacd/emulators.cfg`

PSX Controller Not Working:
---------------------------
+ Change the controller type from `standard` to `analog` (this can only be done in the RetroArch core for PSX (hotkey + X)

Artwork:
--------
+ `cd /home/pi/RetroPie/roms/games/[system]` - replace `[system]` with game system folder name
+ `/opt/retropie/supplementary/scraper/scraper -append -console_src=gdb,ss -max_width=505 -max_height=540 -image_dir=media -image_path=media`

After Update:
-------------
+ `RetroPie Setup > Configuration / tools > autostart > Boot to EmulationStation`

JoyStick Test:
--------------
+ `jstest /dev/input/js0`

Rotate Logs:
------------
Some controllers will create endless error logs (this technique will force the logs to obey normal logic and not fill your system SD card to the point where it is unusable)

+ Edit `/etc/logrotate.d/rsyslog`

```
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
```
