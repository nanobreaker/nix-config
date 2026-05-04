{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.udisks
    pkgs.quickshell
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  services.tuned.enable = true;

  home-manager.sharedModules = [
    {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia-shell = {
        enable = true;

        plugins = {
          sources = [
            {
              enabled = true;
              name = "Official Noctalia Plugins";
              url = "https://github.com/noctalia-dev/noctalia-plugins";
            }
          ];
          states = {
            clipper = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            usb-drive-manager = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
            color-scheme-creator = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
          };
          version = 2;
        };

        pluginSettings = {
          usb-drive-manager = {
            file-browser = "nautilus";
            hide-when-empty = "true";
          };
        };

        settings = {
          general = {
            avatarImage = inputs.nix-assets.assets.avatars.main;
            dimmerOpacity = 0.0;
            compactLockScreen = true;
            showSessionButtonsOnLockScreen = false;
            enableLockScreenCountdown = false;
            enableLockScreenMediaControls = true;
            lockScreenBlur = 0;
          };

          ui = {
            fontDefault = "Berkeley Mono SemiBold";
            fontFixed = "Berkeley Mono SemiBold";
            fontDefaultScale = 1;
            fontFixedScale = 1;
          };

          wallpaper = {
            enabled = false;
          };

          dock = {
            enabled = false;
          };

          desktopWidgets = {
            enabled = false;
          };

          plugins = {
            autoUpdate = false;
            notifyUpdates = true;
          };

          idle = {
            enabled = true;
            lockTimeout = 3600;
            screenOffTimeout = 0;
            suspendTimeout = 0;
            fadeDuration = 1;
            screenOffCommand = "";
            lockCommand = "";
            suspendCommand = "";
            resumeScreenOffCommand = "";
            resumeLockCommand = "";
            resumeSuspendCommand = "";
            customCommands = "[]";
          };

          noctaliaPerformance = {
            disableWallpaper = true;
            disableDesktopWidgets = true;
          };

          colorSchemes = {
            darkMode = true;
            useWallpaperColors = false;
            syncGsettings = false;
          };

          bar = {
            position = "top";
            barType = "floating";
            density = "compact";

            displayMode = "always_visible";

            useSeparateOpacity = true;
            backgroundOpacity = lib.mkForce 0.00;

            showOutline = false;
            showCapsule = false;

            fontScale = 1.1;
            enableExclusionZoneInset = true;

            marginVertical = 4;
            marginHorizontal = 9;

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
                  maxWidth = 700.0;
                }
              ];
              right = [
                { id = "Tray"; }
                { id = "plugin:usb-drive-manager"; }
                { id = "plugin:color-scheme-creator"; }
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

  specialisation.light.configuration = {
    home-manager.sharedModules = [
      {
        programs.noctalia-shell = {
          settings = {
            colorSchemes = {
              darkMode = lib.mkForce false;
            };
          };
        };
      }
    ];
  };
}
