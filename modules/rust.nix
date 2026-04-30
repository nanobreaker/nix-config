{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.fenix.overlays.default ];

  environment.systemPackages = [
    pkgs.cargo-generate
    pkgs.cargo-watch
    inputs.fenix.packages.${pkgs.stdenv.hostPlatform.system}.complete.toolchain
  ];
}
