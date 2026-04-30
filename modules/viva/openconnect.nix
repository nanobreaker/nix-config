{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.globalprotect-openconnect.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
