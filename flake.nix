{
  description = "thatwhichisdev's personalized NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://nixos-apple-silicon.cachix.org"
      "https://nix-community.cachix.org/"
      "https://noctalia.cachix.org"
      "https://nixos-raspberrypi.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];

    experimental-features = [
      "flakes"
      "nix-command"
    ];

    trusted-users = [
      "root"
      "@build"
      "@wheel"
      "@admin"
    ];

    show-trace = true;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    apple-silicon.url = "github:nix-community/nixos-apple-silicon";

    awww.url = "git+https://codeberg.org/LGFae/awww";

    fenix.inputs.nixpkgs.follows = "nixpkgs";
    fenix.url = "github:nix-community/fenix";

    globalprotect-openconnect.url = "github:yuezk/GlobalProtect-openconnect";

    helix.url = "github:helix-editor/helix";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";

    niri.url = "github:sodiboo/niri-flake";

    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.url = "github:noctalia-dev/noctalia-shell";

    stylix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:nix-community/stylix";

    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:youwen5/zen-browser-flake";

    tuigreet.inputs.nixpkgs.follows = "nixpkgs";
    tuigreet.url = "github:NotAShelf/tuigreet";

    berkeley-mono.url = "git+ssh://git@github.com/nanobreaker/berkeley-mono.git";

    nix-assets.url = "git+ssh://git@github.com/nanobreaker/nix-assets.git";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        nano = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nano/configuration.nix
          ];
        };
        viva = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/viva/configuration.nix
          ];
        };
      };

    };
}
