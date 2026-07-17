_: {
  nix.settings.warn-dirty = false;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [
    "thatwhichisapple"
    "root"
    "@build"
    "@wheel"
    "@admin"
  ];
}
