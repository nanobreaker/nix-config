{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  schemeName = "TrueColors";
  schemeJson = builtins.toJSON {
    dark = {
      mPrimary = "#f0f6fc";
      mOnPrimary = "#0a0c10";
      mSecondary = "#ffb757";
      mOnSecondary = "#0a0c10";
      mTertiary = "#0a0c10";
      mOnTertiary = "#ffb757";
      mError = "#0a0c10";
      mOnError = "#ff9492";

      mSurface = "#0a0c10";
      mOnSurface = "#f0f6fc";
      mHover = "#ffb757";
      mOnHover = "#0a0c10";
      mSurfaceVariant = "#23252a";
      mOnSurfaceVariant = "#f0f6fc";
      mOutline = "#f0f6fc";
      mShadow = "#000000";

      terminal = {
        background = "#0a0c10";
        foreground = "#f0f6fc";
        cursor = "#f0f6fc";
        cursorText = "#0a0c10";
        selectionBackground = "#2672f3";
        selectionForeground = "#f0f6fc";

        normal = {
          black = "#0a0c10";
          red = "#ff9492";
          green = "#addcff";
          yellow = "#ffb757";
          blue = "#2672f3";
          magenta = "#ddb7ff";
          cyan = "#addcff";
          white = "#f0f6fc";
        };

        bright = {
          black = "#6e7681";
          red = "#ff9492";
          green = "#addcff";
          yellow = "#ffb757";
          blue = "#2672f3";
          magenta = "#ddb7ff";
          cyan = "#addcff";
          white = "#eeeeee";
        };
      };
    };

    light = {
      mPrimary = "#7a45b6";
      mOnPrimary = "#ffffff";
      mSecondary = "#005e8a";
      mOnSecondary = "#ffffff";
      mTertiary = "#9a5d00";
      mOnTertiary = "#ffffff";
      mError = "#b3261e";
      mOnError = "#ffffff";

      mSurface = "#f0f6fc";
      mOnSurface = "#0a0c10";
      mHover = "#dce6f2";
      mOnHover = "#0a0c10";
      mSurfaceVariant = "#e3ebf5";
      mOnSurfaceVariant = "#23252a";
      mOutline = "#6e7681";
      mShadow = "#c9d3df";

      terminal = {
        background = "#f0f6fc";
        foreground = "#0a0c10";
        cursor = "#0a0c10";
        cursorText = "#f0f6fc";
        selectionBackground = "#2672f3";
        selectionForeground = "#f0f6fc";

        normal = {
          black = "#f0f6fc";
          red = "#b3261e";
          green = "#005e8a";
          yellow = "#9a5d00";
          blue = "#2672f3";
          magenta = "#7a45b6";
          cyan = "#00838f";
          white = "#23252a";
        };

        bright = {
          black = "#6e7681";
          red = "#b3261e";
          green = "#005e8a";
          yellow = "#9a5d00";
          blue = "#2672f3";
          magenta = "#7a45b6";
          cyan = "#00838f";
          white = "#0a0c10";
        };
      };
    };
  };
in
{
  environment.systemPackages = [
    pkgs.quickshell
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  services.tuned.enable = true;

  home-manager.sharedModules = [
    {
      imports = [ inputs.noctalia.homeModules.default ];

      xdg.configFile."noctalia/colorschemes/${schemeName}/${schemeName}.json".text = schemeJson;

      programs.noctalia-shell = {
        enable = true;
        settings = {
          general = {
            avatarImage = "${../assets/avatar.jpg}";
            dimmerOpacity = 0.0;
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
            lockTimeout = 660;
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
            predefinedScheme = schemeName;
            useWallpaperColors = false;
            darkMode = true;
            syncGsettings = true;
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
