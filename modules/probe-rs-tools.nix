{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    probe-rs-tools
  ];

  users.groups.plugdev = {
    members = [ "thatwhichisapple" ];
  };

  services.udev.enable = true;
  services.udev.packages = [ pkgs.probe-rs-tools ];
}
