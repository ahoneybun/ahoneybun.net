+++
title = "Hosting on NixOS"
date = 2023-06-06
draft = false

[taxonomies]
categories = [ "nixos" ]
tags = [ "nixos", "nixos-22.11", "nixos-server" ]
+++

description: Running NixOS on Linode VPS for services like Jekyll, Mastodon and Nextcloud.

## Installing on Linode

I've been using Linode for a while and I used this [article](https://www.linode.com/docs/guides/install-nixos-on-linode/) to install NixOS on a Linode. Now I was using one large server (2GB plan) to host everything but I thought that splitting them up would be better so I just cloned my server onto another Linode using their great webUI! 

## Two is better than one

Now that I have two servers I needed names for them, I've never been good with hostnames but I'm not using Mass Effect (Andromeda) characters for my systems. Mass Effect characters are for x86_64 systems and Andromeda characters for ARM64 devices. The two servers themselves are names after Reapers so sovereign and harbinger!

### Hydra 

The hardest part of starting for me was understanding DNS and HTTPS setup, this included using Nginx to reverse proxy a locally running service like [Hydra](https://github.com/NixOS/hydra). I was able to get this working with this [configuration](https://gitlab.com/ahoneybun/nix-configs/-/blob/main/dev/hydra-ahoneybun-net.nix) this allows it to be viewed from https://hydra.ahoneybun.net (it is currently off as I was just testing). 

When I first tried setting Hydra up I was using the default settings for using a Nginx reverse proxy but it was not loading CSS and JavaScript, after hours of going though GitHub and Reddit I found this option which was the key:

```nix
recommendedProxySettings = true;
```

Once that was added and I rebuilt `nixos-rebuild` everything worked as it should have!

### Jekyll

For a long time this site has been on GitHub pages but I wanted to change that (partly as I was having issues with how GitHub handles DNS) and this is the first blog post since that happened and now you're on a site hosted on NixOS! Getting Jekyll to build with my [site](https://github.com/ahoneybun/ahoneybun.net) took a while but these commands was able to build with my plugins:

```bash
cd ahoneybun.net
nix-shell -p jekyll rubyPackages.webrick rubyPackages.jekyll-feed rubyPackages.jekyll-redirect-from
jekyll build
```

I created a nix-shell file (in the repository) so that I can run these commands (from the root directory) to update the site once I make a change on GitHub:

```bash
git pull
nix-shell
jekyll build
```

### Mastodon

Setting up Mastodon on NixOS was just using this [wiki](https://nixos.wiki/wiki/Mastodon) page and then rebuild. One issue with my configuration is that I don't have SMTP working so confirmation emails are not sent out. To workaround this I can confirm the account using `tootctl` on the server itself like this:

```bash
# Switch to root
sudo su

# Switch to mastodon account
su - mastodon -s $(which bash)

## Approve accounts though tootctl
mastodon-env tootctl accounts approve PUT-YOUR-USERNAME-HERE

## Accept email address though tootctl 
mastodon-env tootctl accounts modify PUT-YOUR-USERNAME-HERE --confirm
```

[Source](https://page.romeov.me/posts/setting-up-mastodon-with-nixos/#adding-your-user)

### Nextcloud

I'm still working on getting this to not use SQLite which is the default and have better security plus other fixes but it is working [here](https://cloud.ahoneybun.net) and here is the [nix file](https://gitlab.com/ahoneybun/nix-configs/-/blob/main/web/cloud-ahoneybun-net.nix).

## Nix Files

You can find all of my nix files [here](https://gitlab.com/ahoneybun/nix-configs).
