# Preview

![preview_0](screenshot-0.png)
![preview_1](screenshot-1.png)

# Overview

Repository to store and share my personalized nixos configuration. It unlocks
ability to reproduce my setup on new host in few commands assuming that it has
nixos already installed.

## Motivation

Over years I simply got tired of configuring, reconfiguring, deconfiguring many
systems. I had dotfiles repo, but is just was not enough, I still wanted to have
a way to reproduce my whole system including packages, hardware configs and etc.
One day I discovered NixOS and it's ecosystem and never looked back. For me this
is most bleeding edge solution for managing your environment with very cool
features, for instance generations, in case if you broke something you can
always boot into the previous version of your config, this was never real on any
other system. So here we are in my single repo that describes configurations for
the hosts machines that I posses.

## Hosts

  | name | host                     |
  | ---- | ------------------------ |
  | viva | Apple MacBook Pro M1 Max |
  | nano | Dell Precision 7540      |

Thanks to ![asahi linux](https://asahilinux.org) and
![nixos-apple-silicon](https://github.com/nix-community/nixos-apple-silicon) it
is possible to install nixos on apple silicon.

## Packages

Below lists of essential packages that give my system needed vibe.

### Graphics

  | name           | description        |
  | -------------- | ------------------ |
  | niri           | wayland compositor |
  | noctalia-shell | desktop shell      |
  | awww           | wallpaper daemon   |
  | nautilus       | file browser       |
  | zen            | internet browser   |

### Terminal

  | name     | description           |
  | -------- | --------------------- |
  | tuigreet | boot greeter          |
  | ghostty  | terminal emulator     |
  | nushell  | terminal shell        |
  | starship | terminal shell prompt |

### IDEs

  | name  | description       |
  | ----- | ----------------- |
  | helix | modal text editor |

### Other

  | name          | description |
  | ------------- | ----------- |
  | stylix        | theming     |
  | berkeley-mono | font        |
  | nerd-icons    | icons       |

# Getting Started

## Installing

Simply clone the repository in the folder where you want to store it, I keep all
the configs under .config directory.

```shell
git clone git@github.com:nanobreaker/nix-config.git ~/.config/nix-config
```

## Testing

Before building you can always check if configuration contains any issues.

```shell
nix flake check
```

## Building

There are two ways of applying changes to the system, using standart
`nixos-rebuild` or enhanced `nh`.

```shell
sudo nixos-rebuild switch --flake .#viva
```

```shell
nh os switch -H viva
```

# Licensing

The code in this project is licensed under MIT license. Check
![LICENSE](LICENSE.md) for further details.
