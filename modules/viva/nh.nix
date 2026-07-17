_: {
  programs.nh = {
    enable = true;
    clean.enable = false;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/thatwhichisapple/.config/nix-config";
  };
}
