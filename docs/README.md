# Preview

![preview](preview.gif)

## Motivation

Configuration is part of everyday life as a software user. You either configure
your tools through graphical interfaces or through text-based files in different
formats.

After many years as a Linux user, I eventually got tired of endlessly
reconfiguring my software. This became especially painful when moving from one
machine to another, setting up a new laptop from work, or rebuilding my
environment after a fresh installation. I wanted a way to keep my configuration
portable and carry it over to another machine with less hassle as possible.

At first, I settled on a dotfiles repository. It worked well enough and was a
huge improvement over manual setup, but it was still limited. Dotfiles gave me
control over application configuration, but not over the actual packages,
services, system settings, and full operating-system environment.

Then I discovered NixOS and its ecosystem, and it completely changed how I think
about managing an operating system. For me, NixOS is currently one of the most
powerful and forward-looking ways to manage a reproducible environment. I doubt
I will switch away from it anytime soon.

# Overview

Repository to store and share my personalized nixos configuration. It unlocks
ability to reproduce my setup on new host in few commands assuming that it has
nixos already installed.

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
  | zed   | editor            |

### Other

  | name          | description |
  | ------------- | ----------- |
  | stylix        | theming     |
  | berkeley-mono | font        |
  | nerd-icons    | icons       |

# Getting Started

## Prerequisites

This configuration is intended for NixOS systems. Extensive documentation on how
to install NixOS is available online. If you want to run NixOS on Apple machine,
refer to
![nixos-apple-silicon](https://github.com/nix-community/nixos-apple-silicon).

You need the following experimental features to be enabled:

- flakes
- nix-command

## Installation

Clone the repository wherever you keep your configuration files. I usually keep
mine under `~/.config.`.

```shell
git clone https://github.com/thatwhichisdev/nix-config.git ~/.config/nix-config
```

My configuration contains a few private flakes such as `berkeley-mono` and
`nix-assets`. You will need to remove those inputs and their usages, since you
won't have access to them and build will fail. I use those private flakes to
keep licensed assets out of the public repository.

## Checking

Before building a system configuration, you can check the flake for evaluation
errors and other issues.

```shell
nix flake check
```

## Formatting

To format repository simply run

```shell
nix fmt
```

## Building

Build and switch to a host configuration with `nixos-rebuild`.

```shell
sudo nixos-rebuild switch --flake .#host
```

Or using nix helper, which wraps common nixos rebuild flows and asks for
elevated privileges when needed.

```shell
nh os switch -H host
```

Replace `host` with the host you want to build. In my case, this is either
`viva` either `nano`.

## Updating

Updating should be done with care, sometimes updates on unstable inputs may
introduce regressions.

```shell
nix flake update
```

To update a single input:

```shell
nix flake lock --update-input <input-name>
```

# Licensing

The code in this project is licensed under MIT license. Check
![LICENSE](LICENSE.md) for further details.
