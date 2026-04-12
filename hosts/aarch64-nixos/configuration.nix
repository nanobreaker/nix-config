{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
    ../../modules/btop.nix
    ../../modules/fonts.nix
    ../../modules/fuzzel.nix
    ../../modules/ghostty.nix
    ../../modules/git.nix
    ../../modules/helix.nix
    ../../modules/home-manager.nix
    ../../modules/ironbar.nix
    ../../modules/localisation.nix
    ../../modules/nh.nix
    ../../modules/niri.nix
    ../../modules/nix.nix
    ../../modules/nushell.nix
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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  hardware.asahi.peripheralFirmwareDirectory = ./firmware;

  security.polkit.enable = true;

  networking.hostName = "thatwhichisapple";
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    fastfetch
    ffmpeg
    gimp3
    imagemagick
    impala
    mpv
    nixd
    p7zip
    pavucontrol
    pciutils
    pcmanfm
    ripgrep
    scooter
    systemctl-tui
    systemfd
    telegram-desktop
    usbutils
    uutils-coreutils-noprefix
    wl-color-picker
    wpaperd
    zed-editor
  ];

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

  home-manager.users.thatwhichisapple.home = {
    homeDirectory = "/home/thatwhichisapple";
    stateVersion = "26.05";
  };

  system.stateVersion = "26.05";
}
