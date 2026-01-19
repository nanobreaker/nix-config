{ pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.fenix.overlays.default ];

  environment.systemPackages = [
    pkgs.ninja
    pkgs.laze
    pkgs.cargo-generate
    pkgs.probe-rs-tools
    pkgs.espup
    (pkgs.fenix.fromToolchainFile {
      file = ./rust-toolchain.toml;
      sha256 = "sha256-SJwZ8g0zF2WrKDVmHrVG3pD2RGoQeo24MEXnNx5FyuI=";
    })
  ];
}
