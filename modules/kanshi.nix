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

        profiles = {
          laptop = {
            name = "laptop";

            outputs = [
              {
                criteria = "eDP-1";
                status = "enable";
              }
            ];
          };

          docked = {
            name = "docked";

            outputs = [
              {
                criteria = "DP-1";
                status = "enable";
              }
              {
                criteria = "eDP-1";
                status = "enable";
              }
            ];

            exec = [
              "${awww}/bin/awww img ${inputs.nix-assets.assets.wallpapers.motion.waneella-clouds}"
            ];
          };
        };
      };
    }
  ];
}
