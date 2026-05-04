{ inputs, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    inputs.berkeley-mono.packages.${pkgs.stdenv.hostPlatform.system}.default
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
