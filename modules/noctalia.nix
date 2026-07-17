{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.udisks
  ];

  services.udisks2.enable = true;
  services.tuned.enable = true;

  home-manager.sharedModules = [
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        validateConfig = true;

        settings = {
          accessibility = {
            ui_scale = 1.0;
          };

          shell = {
            font_family = "Berkeley Mono SemiBold";
            time_format = "{:%H:%M}";

            # Replacement for monthBeforeDay = true.
            date_format = "%m/%d/%Y";

            avatar_path = builtins.toString inputs.nix-assets.assets.avatars.main;

            # Avoid the first-run wizard for a declarative installation.
            setup_wizard_enabled = false;

            # Recommended when running Noctalia as a systemd user service.
            launch_apps_as_systemd_services = true;

            # Replaces the old clipper plugin.
            clipboard_enabled = true;

            panel = {
              transparency_mode = "solid";
              borders = false;
              shadow = false;
            };

            # These are startup-only graphics settings.
            shared_gl_context = true;
            disable_mipmaps = false;
          };

          lockscreen = {
            enabled = true;
            blurred_desktop = false;
            blur_intensity = 0.0;
            tint_intensity = 0.0;
          };

          wallpaper = {
            enabled = false;
          };

          backdrop = {
            enabled = false;
          };

          dock = {
            enabled = false;
          };

          desktop_widgets = {
            enabled = false;
          };

          idle = {
            pre_action_fade_seconds = 1.0;

            behavior = {
              lock = {
                timeout = 3600;
                action = "lock";
                enabled = true;
              };

              "screen-off" = {
                timeout = 0;
                action = "screen_off";
                enabled = false;
              };

              suspend = {
                timeout = 0;
                action = "lock_and_suspend";
                enabled = false;
              };
            };
          };

          theme = {
            mode = "dark";

            templates = {
              enable_builtin_templates = false;
              enable_community_templates = false;
            };
          };

          location = {
            auto_locate = false;
            address = "Chisinau, Moldova";
          };

          bar = {
            order = [ "main" ];

            main = {
              enabled = true;
              position = "top";

              # Replacement for displayMode = "always_visible".
              auto_hide = false;

              reserve_space = true;
              layer = "top";

              # Closest v5 equivalent to compact density.
              thickness = 30;
              padding = 4;
              widget_spacing = 4;

              # Transparent floating bar.
              background_opacity = 0.0;
              border_width = 0.0;
              shadow = false;
              capsule = false;

              radius = 12;

              # Old marginHorizontal.
              margin_ends = 9;

              # Old marginVertical for a top bar.
              margin_edge = 4;

              scale = 1.1;
              font_family = "Berkeley Mono SemiBold";
              font_weight = "bold";

              start = [
                "control-center"
                "workspaces"
              ];

              center = [
                "active_window"
              ];

              end = [
                "tray"
                "clipboard"
                "notifications"
                "volume"
                "network"
                "bluetooth"
                "battery"
                "theme_mode"
                "clock"
              ];
            };
          };

          widget = {
            workspaces = {
              style = "regular";
              display = "none";
              hide_when_empty = false;
            };

            active_window = {
              min_length = 80;
              max_length = 700;
              icon_size = 14;
              title_scroll = "on_hover";
              display = "icon_and_text";
              show_empty_label = false;
            };

            network = {
              show_label = false;
            };

            bluetooth = {
              show_label = false;
            };

            battery = {
              display_mode = "icon";
              show_label = true;
              warning_threshold = 30;
              device = "auto";
            };

            clock = {
              format = "{:%H:%M}";
              timezone = "Europe/Chisinau";
            };
          };
        };
      };
    }
  ];
}
