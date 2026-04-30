{ pkgs, ... }:
{
  # networking.extraHosts = ''
  #   127.0.0.1 artifactory.amz.mtmemgmt.com
  # '';

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.plugins = [
    pkgs.networkmanager-openconnect
  ];

  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
}
