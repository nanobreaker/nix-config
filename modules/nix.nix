_: {
  nix.settings = {
    warn-dirty = false;

    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = [
      "thatwhichisapple"
      "root"
      "@build"
      "@wheel"
      "@admin"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
