+++
title = "Welcome to Hydra"
date = 2025-05-17
draft = false

[taxonomies]
categories = [ "nixos" ]
tags = [ "nixos", "nixos-25.05" ]
+++

## CB (Continuous Build system)

This is what [NixOS](https://hydra.nixos.org/) itself uses for building packages for it's [channels](https://nixos.wiki/wiki/Nix_channels). Setting it up yourself on NixOS is pretty easy with this nix config:

```nix
{ config, pkgs, lib, ... }:

{
  services.hydra = {
    enable = true;
    hydraURL = "localhost:3000";
    buildMachinesFiles = [ ];
    notificationSender = "hydra@localhost";
    useSubstitutes = true;
  };
}
```

once you add that to your `configuration.nix` (or another nix file that you import) and rebuild you'll find it running on port 3000 (localhost:3000). For creating a project and other admin roles I would recommand looking at [this page](https://nixos.wiki/wiki/Hydra).

### Your own nixpkgs

I started my own [nixpkgs repository](https://gitlab.com/ahoneybun-nix/nixpkgs) recently and this is my flake:

```nix
{
  description = "Aaron Honeycutt's packages";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux"] (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (import ./pkgs)
          ];
        };

      in {
        packages = (import ./pkgs {}) pkgs;

        hydraJobs = (import ./pkgs {}) pkgs;
      }
    );
}
```

With this you can run `nix build .#honeyfetch` (one of the packages in that repository) to build it for the host architecture. Now the part for Hydra itself is `HydraJobs` so that Hydra will pick up those packages and build them:

{{ figure(src="/images/nixos-hydra-ci/built-x86-64-linux.png", alt="Hydra building for x86_64-linux", caption="Hydra building for x86_64-linux") }}

## Building for other architectures

NixOS is great at supporting 4 main architectures (known as Platforms):

- x86_64-linux
- aarch64-linux
- x86_64-darwin
- aarch64-darwin

there is a 5th one which is i686-linux though it is not as common.

Hydra can build for all of them and this example we'll add aarch64-linux (for devices such as the Raspberry Pi in my case), this is how our Hydra configuration looks with that enabled:

```nix
{ config, pkgs, lib, ... }:

{
  services.hydra = {
    enable = true;
    hydraURL = "localhost:3000";
    buildMachinesFiles = [ "/etc/nix/machines" ];
    notificationSender = "hydra@localhost";
    useSubstitutes = true;
  };

  nix.buildMachines = [
    {
      hostName = "localhost";
      protocol = null;
#      system = "x86_64-linux";
      systems = [ "x86_64-linux" "aarch64-linux" ];
      supportedFeatures = ["kvm" "nixos-test" "big-parallel" "benchmark"];
      maxJobs = 8;
    }
  ];
}
```

If you just want to build for x86_64-linux or a certain Platform only you can use the `system` variable instead of the `systems` one. If you use both the `system` one will override everything so only that one will be used. Once the change is made simply rebuild your configuration with `sudo nixos-rebuild` and you should see this, it is important to note that building on a non-native Platform will take a while. 

{{ figure(src="/images/nixos-hydra-ci/built-systems.png", alt="Hydra building for x86_64-linux and aarch64-linux", caption="Hydra building for x86_64-linux and aarch64-linux") }}

