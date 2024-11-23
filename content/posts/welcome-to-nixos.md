+++
title = "Welcome to NixOS"
date = 2022-05-22
draft = false

[taxonomies]
categories = [ "nixos" ]
tags = [ "nixos", "nixos-22.05" ]
+++


## Automate the OS

With NixOS you can setup your OS using the "configuration.nix" file which is in "/etc/nixos" and mine enables the following:

- Xorg
- OpenSSH
- PipeWire
- Bluetooth
- CUPS
- fwupd
- Flatpak

This installs my desktop, default applications and other tools that I need. I'm still working on it but this gets me up and running out of the box. You can see the full file [here](https://gitlab.com/ahoneybun/nyxi-installer/-/blob/main/config.nix).

## Rollback the OS

One of the cool features that I have loved the idea of before I found out about NixOS is rolling back an update. We have similar features in [Fedora Silverblue](https://docs.fedoraproject.org/en-US/fedora-silverblue/updates-upgrades-rollbacks/) and how NixOS does it is similar at least from the users POV, every time that you run `nixos-rebuild switch` you create a new generation though you would have to have changed your "configuration.nix" file before running the command. You can read more about Generations [here](https://nixos.wiki/wiki/NixOS#Generations).

## Spliting the user-wide and system-wide

Another cool feature is allowing the user and system to have different applications/versions, of the benefits of this is the following:

- The user can have Inkscape 1.1.2 (unstable) while the system would have version 1.1.1 (stable) (this is based on version 21.11)
- The system can have Python 3.9 while the user who needs a newer version can have Python 3.10

### The Nyxi Installer

I created this installer based on my Arch-itect installer which you can find [here](https://gitlab.com/ahoneybun/arch-itect) and expended based on a co-workers request of using an encrypted LVM which includes a BTRFS root fs and swap. This installer creates the swap partition based on the amount of RAM for hibernation and it is fairly safe since the swap is in an encrypted LVM. 

