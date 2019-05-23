# NAS
#sudo mount -t cifs -o username=xxxxxx,password=xxxxxx,vers=1.0 //qmedia/games/games /home/pi/RetroPie/roms
# USB
sudo mount --bind /media/usb0/games /home/pi/RetroPie/roms/games
sudo mount --bind /media/usb0/bios /home/pi/RetroPie/bios
emulationstation #auto
