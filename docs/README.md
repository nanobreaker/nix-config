# Preview

![preview_0](screenshot-0.png)
![preview_1](screenshot-1.png)

# Overview

This repo represents uniform structure that describes software/hardware
configuration files based on nix package manager, flakes and home-manager. It
unlocks ability to reproduce my personalized setup on new host without any time
consuming hassle.

## Motivation

Setting up your favorite environment on new machine is a time-consuming task,
furthermore if you want to keep them all in sync between machines then it's even
more time-consuming, eventually I got tired of configuring and installing
everything again until I found NixOS, and it's declarative ecosystem. It's a big
pleasure to be able to define the whole system configuration such as hardware
and software in just one repo.

## Hosts

Thanks to ![Asahi Linux](https://asahilinux.org) and
![nixos-apple-silicon](https://github.com/nix-community/nixos-apple-silicon)
nixos is possible on apple silicon.

  | name | host                                | description  |
  | ---- | ----------------------------------- | ------------ |
  | viva | Apple MacBook Pro (16-inch, M1 Max) | daily driver |
  | nano | Dell Precision 7540                 | home server  |

## Packages

List of software that I prefer in my daily life and work workflows, I prefer to
use software written in languages that understand, so I can explore those
solutions and contribute if needed. Also, I'm huge fan of rust written apps I
and believe there is no better alternative right now.

### TUI

  | name          | description                  | language |
  | ------------- | ---------------------------- | -------- |
  | tuigreet      | console greeter              | rust     |
  | ghostty       | terminal emulator            | zig      |
  | nushell       | shell                        | rust     |
  | starship      | cross-shell prompt           | rust     |
  | btop          | a monitor of resources       | c++      |
  | yazi          | terminal file manager        | rust     |
  | p7zip         | file archiver                | rust     |
  | ripgrep       | search tool                  | rust     |
  | scooter       | interactive find-and-replace | rust     |
  | dua-cli       | disk usage analyzer          | rust     |
  | systemctl-tui | systemd services             | rust     |
  | gitui         | git tui                      | rust     |
  | impala        | wifi tui                     | rust     |
  | imagemagick   | edit, convert bitmap images  | c        |

### GUI

  | name            | description                          | language |
  | --------------- | ------------------------------------ | -------- |
  | niri            | scrollable-tiling wayland compositor | rust     |
  | noctalia-shell  | shell environment                    | c++      |
  | nautilus        | file manager                         | c        |
  | awww            | wallpaper daemon                     | rust     |
  | slurp           | region selector for wayland          | c        |
  | wl-screenrec    | screen recording                     | rust     |
  | wl-clipboard-rs | clipboard                            | rust     |

### IDEs

  | name          | description                            | language |
  | ------------- | -------------------------------------- | -------- |
  | helix         | post-modern vim-like modal text editor | rust     |
  | intellij idea | java ide                               | java     |
  | zed           | rust ide                               | rust     |

### Other

  | name             | description        | language   |
  | ---------------- | ------------------ | ---------- |
  | stylix           | theming            | nix        |
  | telegram-desktop | messenger          | c++        |
  | discord          | messenger          | javascript |
  | spotify          | music player       | javascript |
  | google-chrome    | browser            | c/c++      |
  | gimp3            | image manipulation | c          |
  | obsidian         | note taking        | javascript |
  | berkeley-mono    | font               |            |
  | nerd-icons       | icons              |            |

# Getting Started

## Installation

```shell
git clone git@github.com:nanobreaker/nix-config.git ~/.config/nix-config
```

## Check

```shell
nix flake check
```

## Build

```shell
sudo nixos-rebuild switch --flake .#nixos
```

# Licensing

The code in this project is licensed under MIT license. Check
![LICENSE](LICENSE.md) for further details.
