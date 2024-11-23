+++
title = "Unstable software in NixOS"
date = 2022-06-18
draft = false

[taxonomies]
categories = [ "nixos" ]
tags = [ "nixos", "nixos-22.05" ]
+++

## Installing newer software

Recently I ran into this [bug](https://github.com/NixOS/nixpkgs/issues/175512) with the stable (22.05 at this writing) of the ProtonVPN software in NixOS. A way to work around it was use the unstable version of the software which had the fix. I did a bit of Googling to find how to do that so I wanted to share what I found, this is the file that I use:

    { config, pkgs, ...}:

    let
      unstable = import
        (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/master)
        # reuse the current configuration
        { config = config.nixpkgs.config; };
    in
    {
      environment.systemPackages = with pkgs; [
        unstable.protonvpn-cli
        unstable.protonvpn-gui
      ];
    }

Now I made this in a file like this `/etc/nixos/unstable-programs.nix` and then edit my `/etc/nixos/configuration.nix` file to import it like this:

        [
            ./hardware-configuration.nix
            ./plasma.nix
            ./programs.nix
            ./unstable-programs.nix
        ];

That way I can comment it out once the fix is released or if I want to remove it for some reason. Once I made these edits to those two files I would rebuild and switch with this command `sudo nixos-rebuild switch` now if you want to test it just for the next reboot in case you are worried you can run this command instead `sudo nixos-rebuild test`. Now when you reboot it boots into that generation but if it doesn't work just reboot and you'll be in the previous generation without the change. 
