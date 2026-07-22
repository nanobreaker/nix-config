{
  lib,
  inputs,
  pkgs,
  ...
}:
let
  jdk = pkgs.jdk25;
  inherit (pkgs) nodejs;
  jdtls = pkgs.jdt-language-server;
  vscodels = pkgs.vscode-langservers-extracted;
  inherit (pkgs) vtsls;
  packageVersionServer = pkgs.package-version-server;
in
{
  home-manager.sharedModules = [
    {
      programs.zed-editor = {
        enable = true;
        package = inputs.zed.packages.${pkgs.stdenv.hostPlatform.system}.default;

        mutableUserSettings = true;

        extraPackages = [
          jdk
          pkgs.maven
          nodejs
          jdtls
          vscodels
          vtsls
          packageVersionServer
        ];

        extensions = [
          "github-theme"
        ];

        userSettings = {
          theme = lib.mkForce {
            mode = "system";
            light = "GitHub Light High Contrast";
            dark = "GitHub Dark High Contrast";
          };

          agent_servers = {
            "codex-acp" = {
              type = "registry";
            };
          };

          cli_default_open_behavior = "existing_window";

          helix_mode = true;

          which_key = {
            enabled = true;
          };

          minimap = {
            show = "never";
          };

          tab_bar = {
            show = false;
            show_nav_history_buttons = false;
            show_tab_bar_buttons = false;
          };

          toolbar = {
            breadcrumbs = false;
            quick_actions = false;
            selections_menu = false;
            agent_review = false;
            code_actions = false;
          };

          title_bar = {
            show_branch_status_icon = false;
            show_branch_name = false;
            show_project_items = false;
            show_onboarding_banner = false;
            show_user_picture = true;
            show_user_menu = false;
            show_sign_in = true;
            show_menus = false;
          };

          status_bar = {
            active_language_button = false;
            cursor_position_button = true;
            line_endings_button = false;
          };

          gutter = {
            line_numbers = true;
            runnables = false;
            breakpoints = false;
            folds = false;
            min_line_number_digits = 2;
          };

          relative_line_numbers = "enabled";
          current_line_highlight = "gutter";
          cursor_blink = false;
          rounded_selection = false;
          hide_mouse = "on_typing_and_action";
          window_decorations = "server";
          format_on_save = "off";

          ui_font_weight = 500.0;

          buffer_line_height = "standard";
          buffer_font_weight = 450.0;

          terminal = {
            font_family = "Berkeley Mono";
            font_features = {
              calt = true;
            };
          };

          project_panel = {
            dock = "right";
          };

          outline_panel = {
            dock = "left";
          };

          collaboration_panel = {
            dock = "left";
          };

          agent = {
            dock = "right";
            favorite_models = [ ];
            model_parameters = [ ];
          };

          git_panel = {
            dock = "right";
          };

          node = {
            path = "${nodejs}/bin/node";
            npm_path = "${nodejs}/bin/npm";
            ignore_system_version = false;
          };

          lsp = {
            "package-version-server" = {
              binary = {
                path = "${packageVersionServer}/bin/package-version-server";
                ignore_system_version = false;
              };
            };

            "json-language-server" = {
              binary = {
                path = "${vscodels}/bin/vscode-json-language-server";
                arguments = [ "--stdio" ];
                ignore_system_version = false;
              };

              settings = {
                json = {
                  format = {
                    enable = true;
                  };

                  validate = {
                    enable = true;
                  };
                };
              };
            };

            jdtls = {
              initialization_options = {
                bundles = [ ];

                settings = {
                  java = {
                    home = "${jdk}/lib/openjdk";

                    errors = {
                      incompleteClasspath = {
                        severity = "warning";
                      };
                    };

                    configuration = {
                      updateBuildConfiguration = "interactive";

                      maven = {
                        userSettings = null;
                      };

                      runtimes = [
                        {
                          name = "JavaSE-25";
                          path = "${jdk}/lib/openjdk";
                          default = true;
                        }
                      ];
                    };

                    import = {
                      gradle = {
                        enabled = true;
                      };

                      maven = {
                        enabled = true;
                      };

                      exclusions = [
                        "**/node_modules/**"
                        "**/.metadata/**"
                        "**/archetype-resources/**"
                        "**/META-INF/maven/**"
                        "/**/test/**"
                      ];
                    };

                    maven = {
                      downloadSources = true;
                    };

                    eclipse = {
                      downloadSources = true;
                    };

                    references = {
                      includeDecompiledSources = true;
                    };

                    referencesCodeLens = {
                      enabled = true;
                    };

                    signatureHelp = {
                      enabled = true;
                    };

                    implementationCodeLens = "all";

                    format = {
                      enabled = true;
                    };

                    saveActions = {
                      organizeImports = true;
                    };

                    contentProvider = {
                      preferred = null;
                    };

                    autobuild = {
                      enabled = false;
                    };

                    completion = {
                      favoriteStaticMembers = [
                        "org.junit.Assert.*"
                        "org.junit.Assume.*"
                        "org.junit.jupiter.api.Assertions.*"
                        "org.junit.jupiter.api.Assumptions.*"
                        "org.junit.jupiter.api.DynamicContainer.*"
                        "org.junit.jupiter.api.DynamicTest.*"
                      ];

                      importOrder = [
                        "java"
                        "javax"
                        "com"
                        "org"
                      ];
                    };
                  };
                };
              };

              settings = {
                java_home = "${jdk}/lib/openjdk";
              };

              binary = {
                path = "${jdtls}/bin/jdtls";
              };
            };

            vtsls = {
              binary = {
                path = "${vtsls}/bin/vtsls";
                arguments = [ "--stdio" ];
              };

              settings = {
                vtsls = {
                  autoUseWorkspaceTsdk = true;
                };

                typescript = {
                  inlayHints = {
                    parameterNames = {
                      enabled = "literals";
                      suppressWhenArgumentMatchesName = true;
                    };

                    parameterTypes = {
                      enabled = true;
                    };

                    variableTypes = {
                      enabled = true;
                      suppressWhenTypeMatchesName = true;
                    };

                    propertyDeclarationTypes = {
                      enabled = true;
                    };

                    functionLikeReturnTypes = {
                      enabled = true;
                    };

                    enumMemberValues = {
                      enabled = true;
                    };
                  };
                };

                javascript = {
                  inlayHints = {
                    parameterNames = {
                      enabled = "literals";
                      suppressWhenArgumentMatchesName = true;
                    };

                    parameterTypes = {
                      enabled = true;
                    };

                    variableTypes = {
                      enabled = true;
                      suppressWhenTypeMatchesName = true;
                    };

                    propertyDeclarationTypes = {
                      enabled = true;
                    };

                    functionLikeReturnTypes = {
                      enabled = true;
                    };

                    enumMemberValues = {
                      enabled = true;
                    };
                  };
                };
              };
            };

            eslint = {
              binary = {
                path = "${vscodels}/bin/vscode-eslint-language-server";
                arguments = [ "--stdio" ];
              };

              settings = {
                workingDirectory = {
                  mode = "auto";
                };

                problems = {
                  shortenToSingleLine = true;
                };
              };
            };
          };

          languages = {
            JSON = {
              language_servers = [
                "json-language-server"
              ];

              formatter = "language_server";
              format_on_save = "on";
            };

            JSONC = {
              language_servers = [
                "json-language-server"
              ];

              formatter = "language_server";
              format_on_save = "on";
            };

            JavaScript = {
              language_servers = [
                "vtsls"
                "eslint"
              ];

              format_on_save = "off";

              code_actions_on_format = {
                "source.fixAll.eslint" = true;
              };
            };

            TypeScript = {
              language_servers = [
                "vtsls"
                "eslint"
              ];

              format_on_save = "off";

              code_actions_on_format = {
                "source.fixAll.eslint" = true;
              };
            };

            TSX = {
              language_servers = [
                "vtsls"
                "eslint"
              ];

              format_on_save = "off";

              code_actions_on_format = {
                "source.fixAll.eslint" = true;
              };
            };
          };
        };
      };
    }
  ];
}
