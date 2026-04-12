{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/btop.nix
    ../../modules/docker.nix
    ../../modules/fonts.nix
    ../../modules/fuzzel.nix
    ../../modules/ghostty.nix
    ../../modules/git.nix
    ../../modules/helix.nix
    ../../modules/home-manager.nix
    ../../modules/ironbar.nix
    ../../modules/java.nix
    ../../modules/localisation.nix
    ../../modules/networking.nix
    ../../modules/nh.nix
    ../../modules/niri.nix
    ../../modules/nix.nix
    ../../modules/nixpkgs.nix
    ../../modules/nushell.nix
    ../../modules/packages.nix
    ../../modules/pipewire.nix
    ../../modules/rust.nix
    ../../modules/security.nix
    ../../modules/starship.nix
    ../../modules/stylix.nix
    ../../modules/time.nix
    ../../modules/tuigreet.nix
    ../../modules/udev.nix
    ../../modules/wifi.nix
    ../../modules/xserver.nix
    ../../modules/yazi.nix
    ../../modules/zen.nix
  ];

  environment.systemPackages = with pkgs; [
    _1password-gui
    discord
    dua
    element-desktop
    fastfetch
    ffmpeg
    gdlauncher-carbon
    gimp3
    google-chrome
    imagemagick
    impala
    kicad
    mpv
    nixd
    nodejs
    p7zip
    pavucontrol
    pciutils
    pcmanfm
    pstree
    qFlipper
    ripgrep
    scooter
    spotify
    systemctl-tui
    systemfd
    telegram-desktop
    termscp
    usbutils
    uutils-coreutils-noprefix
    wl-color-picker
    wpaperd
    zed-editor
  ];

  users.users.nanobreaker = {
    isNormalUser = true;
    name = "nanobreaker";
    home = "/home/nanobreaker";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "input"
      "dialout"
      "docker"
      "tty"
      "plugdev"
      "render"
    ];
    shell = pkgs.nushell;
  };

  home-manager.users.nanobreaker.home = {
    homeDirectory = "/home/nanobreaker";
    stateVersion = "26.05";
  };

  system.stateVersion = "26.05";
}
