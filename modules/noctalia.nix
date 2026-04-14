{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.quickshell
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  services.tuned.enable = true;

  home-manager.sharedModules = [
    {
      imports = [ inputs.noctalia.homeModules.default ];
      programs.noctalia-shell = {
        enable = true;
        settings = {
          general = { };

          wallpaper = {
            enabled = false;
          };

          dock = {
            enabled = false;
          };

          desktopWidgets = {
            enabled = false;
          };

          idle = {
            enabled = true;
            lockTimeout = 660;
            screenOffTimeout = 0;
            suspendTimeout = 0;
            fadeDuration = 1;
          };

          bar = {
            barType = "floating";
            density = "compact";
            position = "top";
            displayMode = "always_visible";

            backgroundOpacity = lib.mkForce 0.00;
            useSeparateOpacity = true;

            showOutline = false;
            showCapsule = false;

            fontScale = 1;
            enableExclusionZoneInset = true;

            marginVertical = 4;
            marginHorizontal = 4;

            widgets = {
              left = [
                {
                  id = "ControlCenter";
                  useDistroLogo = true;
                }
                {
                  hideUnoccupied = false;
                  id = "Workspace";
                  labelMode = "none";
                }
              ];
              center = [
                {
                  id = "ActiveWindow";
                  maxWidth = 400.0;
                }
              ];
              right = [
                { id = "Tray"; }
                { id = "NotificationHistory"; }
                { id = "Volume"; }
                { id = "Network"; }
                { id = "Bluetooth"; }
                {
                  id = "Battery";
                  warningThreshold = 30;
                  alwaysShowPercentage = true;
                }
                {
                  id = "Clock";
                  formatHorizontal = "HH:mm";
                  useMonospacedFont = true;
                  usePrimaryColor = true;
                }
              ];
            };
          };
          location = {
            monthBeforeDay = true;
            name = "Chisinau";
          };
        };
      };
    }
  ];
}
