{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];

  systemd.user.services.awww-daemon = {
    description = "An Answer to your Wayland Wallpaper Woes";
    documentation = [ "man:awww-daemon(1)" ];

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    requisite = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart = "on-failure";
    };
  };

  # systemd.user.services.awww = {
  #   description = "Set wallpaper with awww";

  #   wants = [ "awww.service" ];
  #   after = [ "awww.service" ];
  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];

  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.awww}/bin/awww img ${../assets/wallpaper_1.gif}";
  #   };
  # };

}
