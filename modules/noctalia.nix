{
  inputs,
  pkgs,
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
            high_contrast = true;
            ui_scale = 1.0;
          };

          shell = {
            font_family = "BerkeleyMono Nerd Font Mono";
            time_format = "{:%H:%M}";

            date_format = "%m/%d/%Y";

            avatar_path = builtins.toString inputs.nix-assets.assets.avatars.main;

            setup_wizard_enabled = false;

            launch_apps_as_systemd_services = true;

            clipboard_enabled = true;

            panel = {
              transparency_mode = "solid";
              borders = false;
              shadow = false;
            };

            shared_gl_context = true;
            disable_mipmaps = false;
          };

          lockscreen = {
            enabled = true;
            blurred_desktop = true;
            blur_intensity = 0.1;
            tint_intensity = 0.0;
          };

          lockscreen_widgets = {
            enabled = true;

            widget = {
              "lockscreen-login-box@DP-1" = {
                enabled = true;
                type = "login_box";
                output = "DP-1";

                settings = {
                  background_opacity = 0.0;
                  show_login_button = false;
                  center_password_text = true;
                };
              };
              "lockscreen-login-box@eDP-1" = {
                enabled = true;
                type = "login_box";
                output = "eDP-1";

                settings = {
                  background_opacity = 0.0;
                  show_login_button = false;
                  center_password_text = true;
                };
              };
            };
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

              auto_hide = false;

              reserve_space = true;
              layer = "top";

              thickness = 30;
              padding = 4;
              widget_spacing = 7;

              background_opacity = 0.0;
              border_width = 0.0;
              shadow = false;
              capsule = false;

              radius = 12;

              margin_ends = 9;
              margin_edge = 4;

              scale = 1.0;
              font_family = "BerkeleyMono Nerd Font Mono";
              font_weight = "semibold";

              start = [
                "control-center"
                "theme_mode"
                "workspaces"
              ];

              center = [
                "active_window"
              ];

              end = [
                "tray"
                "notifications"
                "volume"
                "bluetooth"
                "network"
                "battery"
                "clock"
              ];
            };
          };

          widget = {
            control-center = {
              glyph = "apple";
            };

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

            volume = {
              show_label = false;
            };

            battery = {
              display_mode = "graphic";
              show_label = false;
              warning_threshold = 20;
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
