+++
title = "systemd-boot and efibootmgr"
date = 2022-04-15
draft = false

[taxonomies]
categories = [ "tutorials" ]
tags = [ "tips-&-tricks" ]
+++

## systemd-boot

Systemd-boot started with just support for UEFI which means the code base is much smaller when compared to GRUB which has a ton of code to work with different types of drives that have been released in the last decade. Pop!_OS has been using it since the 18.04 LTS release and I have  been using it as my go to boot manager ever since. 

## efibootmgr

This command allows us to edit the EFI variables though EFISTUB, the [Arch Wiki](https://wiki.archlinux.org/title/EFISTUB#Using_UEFI_directly) has a really good selection about using `efibootmgr`. Here is my output as an example since I will be using the output in the next section:

```
BootNext: 0001
BootCurrent: 0001
Timeout: 2 seconds
BootOrder: 0001,000A,0002,0006,0000
Boot0000* UiApp
Boot0001* Pop!_OS 22.04 LTS
Boot0002* WDC WDS120G2G0B-00EPW0 
Boot0006* WDC WDS100T2B0C-00PXH0 
Boot000A* Linux Boot Manager
```

Now you may not have the "BootNext:" option if you haven't used `efibootmgr` before.

## Desktop files

You can make your own desktop file and for system-wide you would put them in `/usr/share/applications/` but if you want them just for your user you can use `~/.local/share/applications/`. We can make .desktop files for these boot entries to set them as the next boot target but once you reboot again it reverts to using "BootOrder" order instead. 

This is my file for booting Arch on the next reboot:

```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=sh -c "pkexec efibootmgr -n 000A"
Name=Boot to Arch
Icon=/home/aaronh/Documents/archlinux-icon.svg
```

and this is my file for booting Pop!_OS on the next boot:

```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=sh -c "pkexec efibootmgr -n 0001"
Name=Boot to Pop!_OS
Icon=/home/aaronh/Documents/pop_icon.svg
```
