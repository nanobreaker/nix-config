{
  pkgs,
  ...
}:
{
  imports = [
    ./apple-silicon-support
    ./hardware.nix
    ../../modules/btop.nix
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
    ../../modules/rust.nix
    ../../modules/security.nix
    ../../modules/starship.nix
    ../../modules/stylix.nix
    ../../modules/stylix.nix
    ../../modules/time.nix
    ../../modules/tuigreet.nix
    ../../modules/udev.nix
    ../../modules/viva/packages.nix
    ../../modules/xserver.nix
    ../../modules/yazi.nix
    ../../modules/zen.nix
    ../../modules/docker.nix
    ../../modules/vpn.nix
  ];

  networking.hostName = "thatwhichisapple";
  networking.extraHosts = ''
    127.0.0.1 artifactory.amz.mtmemgmt.com
  '';

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
      "plugdev"
      "render"
    ];
    shell = pkgs.nushell;
  };

  home-manager.users.thatwhichisapple = {
    home = {
      homeDirectory = "/home/thatwhichisapple";
      stateVersion = "26.05";
    };
  };

  environment.shells = [
    pkgs.nushell
  ];

  system.stateVersion = "26.05";
}
