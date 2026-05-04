{
  pkgs,
  inputs,
  lib,
  ...
}:
let
  darkScheme = {
    base00 = "#0a0c10"; # mOnPrimary, mOnSecondary, mOnError, mSurface, mOnHover, mOnTeratiry
    base01 = "#23252a"; # mSurfaceVariant
    base02 = "#2672f3"; # not used
    base03 = "#5c6166"; # mOutline
    base04 = "#f0f6fc"; # mOnSurfaceVariant
    base05 = "#f0f6fc"; # mOnSurface
    base06 = "#f0f6fc"; # not used
    base07 = "#f0f6fc"; # not used
    base08 = "#ff9492"; # mError
    base09 = "#ffb757"; # not used
    base0A = "#ffb757"; # not used
    base0B = "#addcff"; # not used
    base0C = "#ffb757"; # mTertiary, mHover
    base0D = "#f0f6fc"; # mPrimary
    base0E = "#ffb757"; # mSecondary
    base0F = "#3D2F00"; # not used
  };

  lightScheme = {
    base00 = "#f8f9fa";
    base01 = "#e4e6e9";
    base02 = "#dce0e5";
    base03 = "#8a9199";
    base04 = "#5c6166";
    base05 = "#42474c";
    base06 = "#2f3337";
    base07 = "#1f2328";
    base08 = "#f07171";
    base09 = "#ff8f40";
    base0A = "#e6b450";
    base0B = "#86b300";
    base0C = "#4cbf99";
    base0D = "#399ee6";
    base0E = "#ddb7ff";
    base0F = "#d95757";
  };
in
{
  programs.dconf.enable = true;

  home-manager.sharedModules = [
    {
      imports = [ inputs.stylix.homeModules.stylix ];

      stylix = {
        enable = true;
        autoEnable = true;

        polarity = "dark";
        base16Scheme = darkScheme;

        cursor = {
          name = "apple-cursor";
          package = pkgs.apple-cursor;
          size = 7;
        };

        fonts = {
          serif.name = "Berkeley Mono SemiBold";
          sansSerif.name = "Berkeley Mono SemiBold";
          monospace.name = "Berkeley Mono SemiBold";
          emoji = {
            name = "Symbols Nerd Font";
            package = pkgs.nerd-fonts.symbols-only;
          };
        };
      };
    }
  ];

  specialisation.light.configuration = {
    home-manager.sharedModules = [
      {
        stylix = {
          polarity = lib.mkForce "light";
          base16Scheme = lib.mkForce lightScheme;
        };
      }
    ];
  };
}
