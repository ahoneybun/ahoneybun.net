+++
title = "Review of my open source work in 2024"
date = 2024-12-31
draft = false

[taxonomies]
categories = [ "year in review" ]
tags = [ "open source", "linux", "nixos", "archlinux", "pop-os" ]
+++

# NixOS/nix
 
## New and updated packages in [nixpkgs](https://github.com/NixOS/nixpkgs)!

- system76-firmware: [1.0.50 -> 1.0.69](https://github.com/NixOS/nixpkgs/pull/382153) : The public key changed in 1.0.68 causing the software to not work with the older release of 1.0.50.

I would like to highlight the help from the following people who have helped me with my work in nixpkgs:

- [nyabinary](https://github.com/nyabinary)
- [lilyinstarlight](https://github.com/lilyinstarlight)
- [a-kenji](https://github.com/a-kenji)
- [khumba](https://github.com/khumba)

## New update to [nixos-hardware](https://github.com/NixOS/nixos-hardware)

## nix-minecraft

I started testing a Minecraft server for my NixOS homelab for my wife and wanted to use nix and I found this awesome [project](https://github.com/Infinidoge/nix-minecraft)! There were no examples so after looking around I found an [issue](https://github.com/Infinidoge/nix-minecraft/issues/6) for it so once I got it working I made a [PR](https://github.com/Infinidoge/nix-minecraft/pull/125) to get that added to the README!

## pinix

If you have ever used pacman and wanted something like that for updates on NixOS meet [pinix](https://github.com/remi-dupre/pinix). I made a [PR](https://github.com/remi-dupre/pinix/pull/6) was manually changed to add an example of using it once you add it as an input in your flake.

## Adopted System76 packages

- system76 (open firmware systems)
- system76-io (DKMS for Thelio Io board)
- system76-acpi (non-open firmware systems)

I have adopted these packages after the  wonderful [khumba](https://github.com/khumba) maintained these packages. Thank you again for the work that you have done and wonderful groundwork plus answers to my questions as well!

# Arch Linux

## Updated packages in [Arch Linux AUR](https://aur.archlinux.org/cgit/aur.git/log/?h=system76-keyboard-configurator)

- system76-keyboard-configurator

# Pop!_OS

I have my first [PR](https://github.com/pop-os/linux/pull/344) to the kernel that Pop!_OS uses to add support for a new Bluetooth device (this was changed by the OEM of the controller after the system passed testing and started shipping).
