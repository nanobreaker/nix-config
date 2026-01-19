{ config, inputs, pkgs, lib, ... }: {

  services.upower = {
    enable = true;
    package = pkgs.upower;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    package = pkgs.bluez;
  };

  home-manager.sharedModules = [
    inputs.ironbar.homeManagerModules.default
    {
      programs.ironbar = {
        enable = true;
        systemd = true;
        config = {
          package = inputs.ironbar;
          icon_theme = pkgs.nerd-fonts.symbols-only;
          monitors = {
            eDP-1 = {
              anchor_to_edges = true;
              position = "top";
              height = 13;
              margin.top = 9;
              margin.bottom = 0;
              margin.left = 9;
              margin.right = 9;
              autohide = null;
              start_hidden = false;
              start = [
                { type = "workspaces"; }
                {
                  type = "focused";
                  show_icon = false;
                  show_title = true;
                  truncate = {
                    mode = "end";
                    max_length = 40;
                  };
                }
              ];

              center = [ ];
              end = [{
                type = "clock";
                format = "%d/%m/%Y %H:%M";
                justify = "center";
              }];
            };
            DP-2 = {
              anchor_to_edges = true;
              position = "top";
              height = 13;
              margin.top = 9;
              margin.bottom = 0;
              margin.left = 9;
              margin.right = 9;
              autohide = null;
              start_hidden = false;

              start = [
                { type = "workspaces"; }
                {
                  type = "focused";
                  show_icon = false;
                  show_title = true;
                  truncate = {
                    mode = "end";
                    max_length = 40;
                  };
                }
              ];

              center = [ ];

              end = [
                {
                  type = "music";
                  icon_size = 14;
                  justify = "center";
                  truncate = {
                    mode = "end";
                    max_length = 40;
                  };
                }
                {
                  type = "tray";
                  icon_size = 14;
                  justify = "center";
                }
                {
                  type = "volume";
                  format = "{icon} {percentage}%";
                  icon_size = 14;
                  justify = "center";
                }
                {
                  type = "clock";
                  format = "%d/%m/%Y %H:%M";
                  justify = "center";
                }
              ];
            };
          };

        };

        style = ''
          @define-color foreground #ffffff;
          @define-color background #0a0c0f;

          * {
            font-family: Berkeley Mono ExtraBold, Symbols Nerd Font Mono;
            font-size: 14px;

            padding: 0px;
            margin: 0px;

            border: 0px;
            border-radius: 4px;
          }

          .background {
            background-color: transparent;
          }

          .workspaces {
            color: @foreground;
            background-color: @background;
          }

          .workspaces .item {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px;
          }

          .workspaces .item.focused {
            color: @background;
            background-color: @foreground;
            padding: 0px 4px;
            margin: 0px;
          }

          .focused {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .music {
            color: @foreground;
            background-color: @background;
            padding-right: 8px;
            margin: 0px 4px;
          }

          .music .contents {
            color: @foreground;
            background-color: @background;
          }

          .popup-music {
            color: @foreground;
            background-color: @background;
          }

          .tray {
            color: @foreground;
            background-color: transparent;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .tray .item {
            background-color: transparent;
          }

          .volume {
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .upower {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .upower .icon {
            color: @foreground;
          }

          .upower .label {
            color: @foreground;
          }

          .network_manager {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .network_manager .icon {
            color: @foreground;
          }

          .network_manager .label {
            color: @foreground;
          }

          .clock {
            padding: 0px 4px;
            margin-left: 4px;
            background-color: @background;
          }
        '';
      };
    }
  ];

}
