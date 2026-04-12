{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.fenix.overlays.default ];

  environment.systemPackages = [
    pkgs.ninja
    pkgs.laze
    pkgs.cargo-generate
    pkgs.cargo-watch
    pkgs.probe-rs-tools
    pkgs.espup
    inputs.fenix.packages.${pkgs.system}.complete.toolchain
  ];
}
