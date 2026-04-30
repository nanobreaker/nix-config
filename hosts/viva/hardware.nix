{
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.kernelModules = [ ];
  boot.initrd.availableKernelModules = [
    "usb_storage"
    "sdhci_pci"
  ];

  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  boot.kernel.sysctl."vm.mmap_rnd_bits" = 31;

  hardware.asahi.peripheralFirmwareDirectory = ./firmware;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/cee437a7-8a61-4c98-b3ba-be4e0a76734a";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C294-15F3";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
