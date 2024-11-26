+++
title = "A review of the Thinkpad X13s with Ubuntu Linux"
date = 2024-03-12
draft = false

[taxonomies]
categories = [ "reviews", "aarch64" ]
tags = [ "ubuntu", "ubuntu-23.10", "ubuntu-24.04", "ubuntu-24.10" ]
+++

{% note(header="Note") %}
I purchased this system from [Amazon's Renewed Store](https://www.amazon.com/dp/B0BVWKM463?psc=1&ref=ppx_yo2ov_dt_b_product_details#renewedProgramDescriptionBtfSection) and the listing for this model is also in that link if you wanted to purchase it after this review. This review has been done over a week of using the system with my findings broken down with the Good, Bad and Ugly system.
{% end %}

### Ubuntu support (general Linux support)

{{ figure(src="/images/Thinkpad-X13s-review/X13s-neofetch.png", alt="Neofetch", caption="Running Neofetch") }}

{{ figure(src="/images/Thinkpad-X13s-review/About-System.png", alt="About System", caption="About System in GNOME Settings") }}

Ubuntu has a custom image for this system which is nice until it can be merged into a general ARM64 image but with this platform it seems there is special settings that you need per device. This image is based on [Ubuntu 23.10](https://cdimage.ubuntu.com/ubuntu/releases/23.10.1/release/ubuntu-23.10.1-desktop-arm64+x13s.iso) but there are Noble Numbat (24.04) daily images as well [here](https://cdimage.ubuntu.com/daily-live/current/noble-desktop-arm64+x13s.iso) which is nice to see.

My original install was done using the 23.10 image but I have upgraded to 24.04 (which is still in testing until the end of April) but both have the 6.5.0 kernel series so other then possible newer versions of Mesa, PipeWire/PulseAudio everything should be pretty much the same for testing. 

**Ubuntu 24.10 note:** with this release there is now a generic arm64 image that works on this device from this [link](https://cdimage.ubuntu.com/releases/oracular/release/ubuntu-24.10-desktop-arm64.iso).

Now before you get try booting an ISO you will need to do two things in the BIOS (which you can get to with F1 at boot):

1. Enable Linux Boot (Config -> Linux -> Linux Boot (Beta))
2. Disable Secure Boot (Security -> Secure Boot -> Secure Boot)

Now you might be able to leave Secure Boot on if you use Ubuntu or another distro that supports it but I did not test that in this review. These steps are from the Debian Wiki for this model which you can find [here](https://wiki.debian.org/InstallingDebianOn/Thinkpad/X13s#BIOS_configuration). 

This is an updated table based on my testing on Ubuntu 23.10/24.04/24.10:

| Core Feature       | Status |
| ------------------ | ------ |
| Wi-Fi/Bluetooth    | Works  |
| Touchpad           | Works  |
| Touch Screen       | Works  | *
| Fingerprint Reader | Works  |
| Webcam             | Can work | **
| Speakers           | Works-ish  | ***
| Headphone port     | Works-ish  |
| USB-C ports        | Works  |
| SIM Slot           | Not tested | 

* Not in the default configuration
** Can be enabled in Ubuntu 24.10 with steps in this review
*** They are very low due to active speaker protection not being enabled [source](https://github.com/jhovold/linux/wiki/X13s#audio) 

NOTE: Like mentioned in the Debian Wiki page for this system I'm not sure if the special keys other then for the screen brightness and volume work. I'll need to use a SIM to test if those buttons work but I doubt they do. From the Debian Wiki page the SIM should work but it may have some hoops to go though but perhaps not on Ubuntu.

## The Elephant in the Room and it's name is something different then x86_64

One of the good things about x86_64 is since every application is packaged for it by default and aarch64 is more of an after thought other then packages in the [ports.ubuntu.com](http://ports.ubuntu.com) repo which is different then the default [us.archive.ubuntu.com](http://us.archive.ubuntu.com) that most folks are used to. 

Debian (and there for Ubuntu for the most part) have a fairly large repository of cross-compiled (meaning that it built for more then one architecture which is great and it means applications like Signal, LibreOffice and other software are packaged (Signal being a snap). 

Now applications like [Slack](https://flathub.org/apps/com.slack.Slack) and [Discord](https://flathub.org/apps/com.discordapp.Discord) that I use quite a bit don't have aarch64 support in either their Debian packaging, flatpak or snap since upstream does not create them or support them from what I can tell. You have odd expections like with [ProtonVPN](https://flathub.org/apps/com.protonvpn.www) which has both x86_64 and aarch64 support but not [Proton Mail Bridge](https://flathub.org/apps/ch.protonmail.protonmail-bridge) which is odd and I've pointed it out on their [social](https://twitter.com/ProtonSupport/status/1769714475433590792).

## The Good

These are the items that are amazing and work really well.

### BIOS/UEFI

I did enjoy seeing a Linux option in the BIOS though I think it should just be on by default and ideally not needed. The settings for swapping the Fn row from needing to press Fn+F5 to refresh a web page to just pressing F5 like I expect. I also liked the option to swap the Fn and Ctrl since I'm used to the Ctrl being on the bottom left rather then the Fn. 

### Upgradable

Now the RAM is soldered (there are 8GB/16GB/32GB options, I have the 16GB model) **BUT** the drive is actually a M.2 2242 (not 2230 like the Steam Deck and Surface line and not 2280 like most desktops) based on the [overview sheet from Lenovo](https://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad_X13s_Gen_1/ThinkPad_X13s_Gen_1_Spec.pdf). Plus based on the [manual](https://download.lenovo.com/pccbbs/pubs/tp_13s_gen1/ug/html_en/index.html) it looks like it is just a few screws to remove the bottom panel and the drive is held in with a single M.2 screw like normal M.2 drives! 

### GNOME Shell

The animations in GNOME Shell are really smooth and great with the touchpad!

### Screen

This is nice and large even on a 13.3" display thanks to the 16:10 resolution of 1920x1200 (instead of the average 16:9 1920x1080 that I'm used to). If you get the touch screen model like is included with this one it works as expected and I can move between workspaces, move windows and highlight text. I did not test onscreen keyboards but I suspect they will just fine, this system does not fold completely like some Chromebooks or partly like some Thinkpad Yoga models so you won't be able to use it like that.

### Wi-Fi and Bluetooth

I was able to connect to two different networks without issues. While Bluetooth was testing with my Pixel Buds-A I did notice some odd "audio glitching" but it would happen randomly and the audio would keep playing during these moments but would sometimes stop for a second or two then continue playing.

[![Bluetooth devices](/images/{{ page.url }}/Bluetooth-devices.png)](/images/{{ page.url }}/Bluetooth-devices.png)

[![Bluetooth sound](/images/{{ page.url }}/Bluetooth-sound.png)](/images/{{ page.url }}/Bluetooth-sound.png)

### USB-C ports

Getting used to only 2x USB-C ports is going to be interesting (I did give Apple a lot of shit when they did it) so I'll have an Anker adapter with an SD card (useful for Pi usage), HDMI and USB-A ports.

Both ports are 3.2 Gen 2 and support video out and power in though my testing, I did note that when you first connect a display GNOME Shell crashes and throws you to the login screen again. It doesn't seem to happen again until you reboot the system then connect a display again.

### Fingerprint Reader

To my surprise the fingerprint reader works well and I can enroll my fingers! It even unlocks the system the system at the login screen too!

### Button

I've never had a Thinkpad before but I've heard many friends praise the keyboard, the nib and the buttons like the ones above the touchpad. I'm happy to say that they were indeed correct and it is really nice to have physical buttons in addition to the buttons under the touchpad such as the middle mouse button.

### Touchpad

It is a joy to use though it would be nicer if it was a little larger though perhaps that'll happen if they make a 14" or larger model (this is 13.3"). It is certainly larger then my last laptop that I purchased and used for years (still do as a great backup machine). I'm able to use the gestures for GNOME (for moving workspaces and going to the application view) and Firefox (for going forward and back on web pages). 

### Cooling system

This is a fan-less system so how well the system can keep cool is a good question to ask, while building the [System76 Keyboard Configurator](https://github.com/pop-os/keyboard-configurator) the highest temperature that I saw was about 67C which I think is really good. The system's CPU is near the USB-C ports so the top left if you are looking at the screen and you can feel it getting a little warm there. 

[![Building Rust software](/images/{{ page.url}}/Cooling_compiling-rust-project.png)](/images/{{ page.url}}/Cooling_compiling-rust-project.png)

### Video decoding

YouTube works and here are some stats for the nerds:

[![Music Video at 1080@60](/images/{{ page.url}}/YouTube-Encoding-Nerd-Stats.png)](/images/{{ page.url}}/YouTube-Encoding-Nerd-Stats.png)

[![Test Video at 4K@60](/images/{{ page.url}}/YouTube-Encoding-Nerd-Stats-2.png)](/images/{{ page.url}}/YouTube-Encoding-Nerd-Stats-2.png)

As you can see it reports that videos are able to decode up to 4K@60 without issue, the videos are smooth and audio matches without issue.

## The Bad

These are the items that don't make or break the system for most folks but are important to note their status.

### Speakers

The speakers which are really low for some reason and do not get better even at the lightest volume for some reason, perhaps driver/PipeWire/Kernel updates will help in the future but I'm not sure.

**Ubuntu 24.10 note:** they do not work better with 6.11 in this release as they are still pretty low due to active speaker protection not being enabled.

### Headphone/Microphone port

The headphone port and even at the lower volume it has a lot of cracking in the output and it gets worse as you increase the volume. I tested two different headphones with the same result. Now using a USB headset (though the USB-C port) seems to work without issue so that is a workaround though you'll need to use an adapter to do this. I have not tested a headset with a microphone yet since I mainly use a USB-A headset so I don't use the port much.

### Widevine/DRM

Now streaming sites that use Widevine DRM like Max and Disney+ do not work at all when you try to load a video. I tested Firefox (snap default install) and Vivaldi (they have an ARM64 Debian release). Now I was able to get Max and Disney+ to work (but not Netflix currently) with Brave by using the [Widevine Installer](https://github.com/AsahiLinux/widevine-installer) from the Asahi project and these [steps](https://support.brave.com/hc/en-us/articles/23881756488717-How-do-I-enable-Widevine-DRM-on-Linux) from Brave. Now this can break at any time with how Widevine is but it does work currently at this time.

### Battery

Checking `upower -d` shows the battery should last 5.8 hours while Lenovo quotes 25-28 hours on Windows. I tested the system with no changes including TLP and with the 6.5 kernel from Ubuntu and I saw about that while doing the following things:

- Writing this review using helix, nano, Text Editor
- Researching how to fix the Widevine issue so basic web browsing including some YouTube here and there
- Downloading updates, installing new applications including snaps and Debian packages

Suspending does not seem to work correctly as the display is still on when the lid is closed but it does turn off if you use the menu to suspend. The battery does still seem to drain while suspended much higher then one would expect when in that state.
This system does work with S0ix and we can confirm with this output from this command:

```bash
aaronh@drack:~$ cat /sys/power/mem_sleep 
[s2idle]
```

Note that the `deep` option is not available on this system.

**Ubuntu 24.10 note:** this device does not enter the deepest low-power state during suspend yet.

## The Ugly

Here are the items that will most likely help you decide if this is a system for you.

### Webcam

For a really nice and portable system this would be an ideal candidate for remote working but since the camera does not work that might be the biggest deal breaker. I imagine support would be added in the future but it depends on how important it is to you.
This part is short as I'm not able to detect it with any software that I can find like camaeractrls, websites and such.

**Ubuntu 24.10 note:** this *can* work with some steps below:

The following packages and changes are needed for the webcam to work as of this update:

```bash
sudo usermod -aG video $USER
sudo apt install pipewire-libcamera libcamera-tools libcamera-ipa
```

Add this file: `/etc/udev/rules.d/95-libcamera-hack.rules` with this as the content:

```
ACTION=="add", SUBSYSTEM=="dma_heap", KERNEL=="linux,cma", GROUP="video", MODE="0660"
ACTION=="add", SUBSYSTEM=="dma_heap", KERNEL=="system", GROUP="video", MODE="0660"
```

Set this value in Firefox's about:config page:

```
media.webrtc.camera.allow-pipewire
```

Now restart the system and test:

```bash
sudo qcam
```

### Compiling

I did have it freeze on me when I was trying to build a rather large Rust project but limiting compiling options to lower the system load might help with that but I did not do that in my testing.

## Closing marks

Once Ubuntu 24.04 is released with the 6.8 kernel I believe things will get even better as it has a lot of changes, here is a small list of a few articles with information:

- [Phoronix - Linux-6.8-ARM-Changes](https://www.phoronix.com/news/Linux-6.8-ARM-Changes)
- [Phoronix - Qualcomm-Mainline-Linux-2024](https://www.phoronix.com/news/Qualcomm-Mainline-Linux-2024)

This system is a great little portable machine with an ARM64 CPU and works great on Ubuntu. If you are looking for a system that is fanless for working on documents, web browsing, watching some YouTube videos and a little development work this is a great option! With that said if you travel and use streaming services that might be a deal breaker for you but I hope that it improves in the near future. 

## Additional tracking

There are some more resources for updated information about Linux on this device:

- [steev's repo](https://github.com/steev/thinkpad-x13s)
- [jhovold's wiki](https://github.com/jhovold/linux/wiki/X13s)
