{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  environment = {
    shellAliases.x = "hx";
  };

  environment.systemPackages = [
    pkgs.vscode-langservers-extracted
    pkgs.typescript-language-server
    pkgs.markdown-oxide
    pkgs.nixfmt
    pkgs.nil
    pkgs.rust-analyzer-nightly
    pkgs.lldb
    pkgs.yaml-language-server
    pkgs.zls
    pkgs.taplo
    pkgs.clang
    pkgs.clang-tools
  ];

  home-manager.sharedModules = [
    {
      programs.helix = {
        enable = true;
        defaultEditor = true;
        package = inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default;

        settings = {
          theme = lib.mkForce "stylix-custom";
          editor = {
            auto-format = true;
            auto-completion = true;
            bufferline = "never";
            color-modes = false;
            cursorline = true;
            file-picker.hidden = false;
            idle-timeout = 0;
            line-number = "relative";
            text-width = 140;

            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };

            statusline.mode = {
              insert = "INSERT";
              normal = "NORMAL";
              select = "SELECT";
            };

            indent-guides = {
              character = "▏";
              render = false;
            };

            whitespace.render = {
              tab = "all";
              space = "all";
            };

            whitespace.characters = {
              tab = "·";
              space = "·";
            };
          };

          keys.normal = {
            C-c = ":clipboard-yank";
            C-v = ":clipboard-paste-after";
            "C-/" = "toggle_comments";
          };
        };

        languages = {
          language-server = {
            uwu-ls = {
              command = "uwu_colors";
            };
            eslint-ls = {
              command = "vscode-eslint-language-server";
              args = [ "--stdio" ];
              config = {
                validate = "on";
                run = "onType";
                experimental = {
                  useFlatConfig = false;
                };
                rulesCustomizations = [ ];
                nodePath = "";
                problems = {
                  shortenToSingleLine = false;
                };
                codeAction = {
                  disableRuleComment = {
                    enable = true;
                    location = "separateLine";
                  };
                  showDocumentation = {
                    enable = true;
                  };
                };
                workingDirectory = {
                  mode = "location";
                };
              };
            };
          };

          language = [
            {
              name = "rust";
              auto-format = true;
            }
            {
              name = "java";
              auto-format = true;
            }
            {
              name = "html";
              auto-format = true;
            }
            {
              name = "css";
              auto-format = true;
            }
            {
              name = "scss";
              auto-format = true;
            }
            {
              name = "javascript";
              language-id = "javascript";
              auto-format = true;
              file-types = [
                "js"
                "jsx"
                "mjs"
              ];
              roots = [
                "package.json"
                ".eslintrc.js"
              ];
              language-servers = [
                "eslint-ls"
                "typescript-language-server"
              ];
            }
            {
              name = "typescript";
              language-id = "typescript";
              auto-format = true;
              file-types = [
                "ts"
                "tsx"
                "mts"
              ];
              roots = [
                "package.json"
              ];
              language-servers = [
                "eslint-ls"
                "typescript-language-server"
              ];
            }
            {
              name = "markdown";
              auto-format = true;
            }
            {
              name = "yaml";
              auto-format = true;
            }
            {
              name = "json";
              auto-format = true;
            }
            {
              name = "jsonc";
              auto-format = true;
            }
            {
              name = "toml";
              auto-format = true;
            }
            {
              name = "nix";
              auto-format = true;
              formatter.command = "nixfmt";
              language-servers = [
                "nil"
                "uwu-ls"
              ];
            }
          ];
        };

        themes = {
          stylix-custom = {
            inherits = "stylix";

            "ui.linenr" = "#ffb757";
            "ui.bufferline.background" = "#0a0c10";
            "ui.gutter.selected" = "#0a0c10";
            "ui.virtual.whitespace" = "#231f20";
            "ui.window" = "#231f20";
          };
        };
      };
    }
  ];
}
