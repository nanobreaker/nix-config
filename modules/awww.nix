{ inputs, pkgs, ... }:
let
  awww = inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww;
in
{
  environment.systemPackages = [
    awww
  ];

  systemd.user.services.awww-daemon = {
    description = "An Answer to your Wayland Wallpaper Woes";
    documentation = [ "man:awww-daemon(1)" ];

    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${awww}/bin/awww-daemon";
      Restart = "on-failure";
    };
  };

  systemd.user.services.awww = {
    description = "Set wallpaper with awww";

    wants = [ "awww-daemon.service" ];
    after = [ "awww-daemon.service" ];
    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${awww}/bin/awww img ${inputs.nix-assets.assets.wallpapers.motion.waneella-clouds}";
    };
  };

}
