{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware.nix
    ../../modules/btop.nix
    ../../modules/docker.nix
    ../../modules/fonts.nix
    ../../modules/ghostty.nix
    ../../modules/git.nix
    ../../modules/helix.nix
    ../../modules/home-manager.nix
    ../../modules/ironbar.nix
    ../../modules/localisation.nix
    ../../modules/networking.nix
    ../../modules/nh.nix
    ../../modules/niri.nix
    ../../modules/nix.nix
    ../../modules/nixpkgs.nix
    ../../modules/noctalia.nix
    ../../modules/nushell.nix
    ../../modules/pipewire.nix
    ../../modules/probe-rs-tools.nix
    ../../modules/rust.nix
    ../../modules/security.nix
    ../../modules/starship.nix
    ../../modules/stylix.nix
    ../../modules/time.nix
    ../../modules/tuigreet.nix
    ../../modules/viva/packages.nix
    ../../modules/viva/asahi.nix
    ../../modules/vpn.nix
    ../../modules/xserver.nix
    ../../modules/yazi.nix
    ../../modules/zen.nix
    ../../modules/fastfetch.nix
  ];

  networking.hostName = "thatwhichisapple";

  users.users.thatwhichisapple = {
    isNormalUser = true;
    name = "thatwhichisapple";
    home = "/home/thatwhichisapple";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "input"
      "dialout"
      "tty"
      "render"
      "docker"
    ];
    shell = pkgs.nushell;
  };

  home-manager.users.thatwhichisapple = {
    home = {
      homeDirectory = "/home/thatwhichisapple";
      stateVersion = "26.05";
    };
  };

  system.stateVersion = "26.05";
}
