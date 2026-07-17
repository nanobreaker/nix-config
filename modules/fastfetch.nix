_: {
  home-manager.sharedModules = [
    {
      programs.fastfetch = {
        enable = true;
        settings = {
          logo = {
            source = "asahi";
          };
          modules = [
            "host"
            "os"
            "kernel"
            "cpu"
            "gpu"
            "memory"
            "disk"
            "lm"
            "wm"
            "termimal"
            "shell"
            "localip"
            "uptime"
          ];
        };
      };
    }
  ];
}
