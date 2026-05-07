{
  ...
}:
{
  environment.variables = {
    TERMINAL = "ghostty";
  };

  home-manager.sharedModules = [
    {
      programs.ghostty = {
        enable = true;
        settings = {
          font-size = 18;
          font-family = "Berkeley Mono";

          cursor-style = "block";
          cursor-style-blink = false;

          mouse-hide-while-typing = true;

          gtk-titlebar = false;
        };
      };
    }
  ];
}
