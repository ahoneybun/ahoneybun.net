+++
title = "Automounting a drive in NixOS"
date = 2022-09-02
draft = false

[taxonomies]
categories = [ "nixos" ]
tags = [ "nixos", "nixos-22.05", "nixos-22.11", "tips-&-tricks" ]
+++

After you create the mount point then we'll add that drive to our `/etc/nixos/configuration.nix':
  
```
  fileSystems."/mnt/ExtraDrive" =
    { device = "/dev/disk/by-uuid/72315f9e-ceda-4152-8e8d-09590affba28";
      fsType = "ext4";
    };
```

> *NOTE:* You can find the UUID by using the `blkid` command, you will need to use `sudo` or change to the root user.

```
sudo blkid
```

or 

```
sudo -i
blkid
```

then rebuild NixOS:

```
sudo nixos-rebuild switch
```

You'll see the following if done correctly:

```
unpacking channels...
building Nix...
building the system configuration...
these 3 derivations will be built:
  /nix/store/3ryw7m6gvim8zs593wkibcg143pix7zd-etc-fstab.drv
  /nix/store/va8nfw2j4i5jviibqy5cggnmjsjmds2v-etc.drv
  /nix/store/hpm2aykvls876qgjrkva2ys3xmn08sri-nixos-system-rpi4-22.11pre405560.2da64a81275.drv
building '/nix/store/3ryw7m6gvim8zs593wkibcg143pix7zd-etc-fstab.drv'...
building '/nix/store/va8nfw2j4i5jviibqy5cggnmjsjmds2v-etc.drv'...
building '/nix/store/hpm2aykvls876qgjrkva2ys3xmn08sri-nixos-system-rpi4-22.11pre405560.2da64a81275.drv'...
stopping the following units: mnt-ExtraDrive.mount
activating the configuration...
setting up /etc...
reloading user units for gdm...
reloading user units for aaronh...
setting up tmpfiles
starting the following units: mnt-ExtraDrive.mount
the following new units were started: systemd-fsck@dev-sda1.service
```

Now we'll see it when we reboot:

```
[aaronh@rpi4:~]$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    0 232.9G  0 disk 
└─sda1        8:1    0 232.9G  0 part /mnt/ExtraDrive
mmcblk0     179:0    0  29.7G  0 disk 
├─mmcblk0p1 179:1    0    30M  0 part 
└─mmcblk0p2 179:2    0  29.7G  0 part /nix/store
                                      /

[aaronh@rpi4:~]$ ls /mnt/ExtraDrive/
Backups  lost+found  test
```
