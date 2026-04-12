{ pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.fenix.overlays.default ];

  environment.systemPackages = [
    pkgs.ninja
    pkgs.laze
    pkgs.cargo-generate
    pkgs.cargo-watch
    pkgs.probe-rs-tools
    pkgs.espup
    (pkgs.fenix.fromToolchainFile {
      file = ./rust-toolchain-nightly.toml;
      # sha256 = "sha256-SJwZ8g0zF2WrKDVmHrVG3pD2RGoQeo24MEXnNx5FyuI=";
      sha256 = "sha256-O0LDBSOe/ggTpAS4AyjoRcR/83UOLOzDrzF+D9A8fRo=";
    })
  ];
}
