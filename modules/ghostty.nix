_: {
  environment.variables = {
    TERMINAL = "ghostty";
  };

  home-manager.sharedModules = [
    {
      programs.ghostty = {
        enable = true;
        settings = {
          font-size = 18;
          font-family = "BerkeleyMono Nerd Font Mono";

          cursor-style = "block";
          cursor-style-blink = false;

          mouse-hide-while-typing = true;

          gtk-titlebar = false;

          background-opacity = 0.70;
        };
      };
    }
  ];
}
