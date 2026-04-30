{
  description = "thatwhichisnot's personalized nixos configuration";

  nixConfig.extra-substituters = [
    "https://nixos-apple-silicon.cachix.org"
    "https://nix-community.cachix.org/"
    "https://noctalia.cachix.org"
  ];

  nixConfig.extra-trusted-public-keys = [
    "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
  ];

  nixConfig.experimental-features = [
    "flakes"
    "nix-command"
  ];

  nixConfig.trusted-users = [
    "root"
    "@build"
    "@wheel"
    "@admin"
  ];

  nixConfig.warn-dirty = false;
  nixConfig.show-trace = true;

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  inputs.apple-silicon.url = "github:nix-community/nixos-apple-silicon";

  inputs.awww.url = "git+https://codeberg.org/LGFae/awww";

  inputs.fenix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.fenix.url = "github:nix-community/fenix";

  inputs.globalprotect-openconnect.url = "github:yuezk/GlobalProtect-openconnect";

  inputs.helix.url = "github:helix-editor/helix";

  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  inputs.home-manager.url = "github:nix-community/home-manager";

  inputs.ironbar.inputs.nixpkgs.follows = "nixpkgs";
  inputs.ironbar.url = "github:JakeStanger/ironbar";

  inputs.niri.url = "github:sodiboo/niri-flake";
  inputs.noctalia.inputs.nixpkgs.follows = "nixpkgs";
  inputs.noctalia.url = "github:noctalia-dev/noctalia-shell";

  inputs.stylix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.stylix.url = "github:nix-community/stylix";

  inputs.zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  inputs.zen-browser.url = "github:youwen5/zen-browser-flake";

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      fenix,
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
