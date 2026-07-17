{ inputs, pkgs, ... }:

let
  awww = inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww;
in
{
  home-manager.sharedModules = [
    {
      services.kanshi = {
        enable = true;
        package = pkgs.kanshi;
        systemdTarget = "graphical-session.target";

        settings = [
          {
            profile = {
              name = "laptop";

              outputs = [
                {
                  criteria = "eDP-1";
                  status = "enable";
                  mode = "3456x2160@120.000";
                  position = "2560,0";
                  scale = 2.0;
                }
              ];
            };
          }

          {
            profile = {
              name = "docked";

              outputs = [
                {
                  criteria = "DP-1";
                  status = "enable";
                  mode = "2560x1440@239.958";
                  position = "0,0";
                  scale = 1.0;
                }
                {
                  criteria = "eDP-1";
                  status = "enable";
                  mode = "3456x2160@120.000";
                  position = "2560,0";
                  scale = 2.0;
                }
              ];

              exec = [
                "${awww}/bin/awww img ${inputs.nix-assets.assets.wallpapers.motion.waneella-clouds}"
              ];
            };
          }
        ];
      };
    }
  ];
}
