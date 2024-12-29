+++
title = "Review of my open source work in 2024"
date = 2024-12-31
draft = false

[taxonomies]
categories = [ "year in review" ]
tags = [ "open source", "nixos" ]
+++

## New and updated packages in [nixpkgs](https://github.com/NixOS/nixpkgs)!

With the launch of the new [System76 Thelio Astra](https://system76.com/desktops/thelio-astra) we saw some updated system76 packages such as 

- [system76-power](https://github.com/NixOS/nixpkgs/pull/350954) 
- [system76-io-dkms](https://github.com/NixOS/nixpkgs/pull/350933)
- system76-dkms: [1.0.13 -> 1.0.16](https://github.com/NixOS/nixpkgs/pull/349177) and [1.0.16 -> 1.0.17](https://github.com/NixOS/nixpkgs/pull/365787)

but this update of the system76-io-dkms package in nixpkgs also added support for the [Thelio Io v2](https://github.com/system76/thelio-io) which is helpful for newer Thelio's that use that version of the board.

We also saw the first Alpha, second and third  Alpha of the COSMIC packages that I (co)-maintain in nixpkgs though some skipped Alpha 2 going right from Alpha 1 to Alpha 3.

I would like to highlight the help from the following people who have helped me with my work in nixpkgs:

- [nyabinary](https://github.com/nyabinary)
- [lilyinstarlight](https://github.com/lilyinstarlight)
- [a-kenji](https://github.com/a-kenji)
- [khumba](https://github.com/khumba)

## New update to [nixos-hardware](https://github.com/NixOS/nixos-hardware)

I added the System76 galp5-1650 version with this [PR](https://github.com/NixOS/nixos-hardware/pull/1126). This enables the GPU and places the system in Hybrid mode basically where the system uses the Intel GPU for everything but you can launch application using the NVIDIA GPU like this:

```
nvidia-prime steam
```

## Planned to adopt System76 packages

The current plan is to take over the packages for System76 packages:

- system76 (open firmware systems)
- system76-io (DKMS for Thelio Io board)
- system76-acpi (non-open firmware systems)

The wonderful [khumba](https://github.com/khumba) has been maintaining these and I plan on taking over updates for them from him as we enter into 2025. Thank you for the work that you have done and wonderful groundwork plus answers to my questions as well! The [PR for removing him has been done](https://github.com/NixOS/nixpkgs/pull/365789) and I have my [PR for taking them over](https://github.com/NixOS/nixpkgs/pull/366236) is currently up for review.

## Updated packages in [Arch Linux AUR](https://aur.archlinux.org/cgit/aur.git/log/?h=system76-keyboard-configurator)

![AUR Keyboard Configurator](/images/{{ page.url }}/AUR-keyboard-configurator.png)

We have had 11 releases of the System76 Keyboard Configurator for the Arch Linux AUR package! For those who don't know you can use this on the [System76 Launch](https://system76.com/keyboards/) and Intel [System76 Laptops](https://system76.com/laptops)!

![AUR Keyboard Configurator Releases](/images/{{ page.url }}/AUR-keyboard-configurator-releases.png)

## Work in Hydra

My first [PR](https://github.com/NixOS/hydra/pull/1271) to Hydra was merged and it is live! This fixes the hello example and it works!

{{ figure(src="/images/review-2024/hydra-hello-example.png", alt="Hydra building the hello example", caption="Hydra building the hello example") }}

## COSMIC DE

### Fixes

I added the feature to use the Player Controls (Next, Pause/Play, Prev) with this [PR](https://github.com/pop-os/cosmic-comp/pull/678)

### Bug reports

I reported a few issues in COSMIC and reporting them are as important as fixing them:

[COSMIC Greeter](https://github.com/pop-os/cosmic-greeter/issues/created_by/ahoneybun)
[COSMIC Edit](https://github.com/pop-os/cosmic-edit/issues/created_by/ahoneybun)
[COSMIC Files](https://github.com/pop-os/cosmic-files/issues/created_by/ahoneybun)

## COSMIC Utils Org

[Ed](https://github.com/edfloreshz) and I have formed the [COSMIC Utils Org](https://github.com/cosmic-utils) which has over 10 awesome folks (including ourselves) which is to have 3rd party COSMIC applications and applets in one place so that developers can help each other improve their application and/or applet or create one news!

### Stellarshot

This project also includes our own application called [Stellarshot](https://github.com/cosmic-utils/stellarshot) which is a backup tool for COSMIC using rustic on the backend to handle the snapshots which are also encrypted!
