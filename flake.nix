{
  description = "nanobreaker's personalized nixos configuration";

  nixConfig = {
    extra-substituters = [
      "https://nixos-apple-silicon.cachix.org"
      "https://cache.garnix.io/"
      "https://nix-community.cachix.org/"
      "https://noctalia.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
    experimental-features = [
      "flakes"
      "nix-command"
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix.url = "github:helix-editor/helix";

    ironbar = {
      url = "github:JakeStanger/ironbar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    awww.url = "git+https://codeberg.org/LGFae/awww";

    niri = {
      url = "github:sodiboo/niri-flake";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    globalprotect-openconnect.url = "github:yuezk/GlobalProtect-openconnect";
  };

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
            { nixpkgs.overlays = [ fenix.overlays.default ]; }
            ./hosts/x86_64-nixos/configuration.nix
          ];
        };
        viva = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            { nixpkgs.overlays = [ fenix.overlays.default ]; }
            ./hosts/aarch64-nixos/configuration.nix
          ];
        };
      };

    };
}
