{ self, config, lib, pkgs, ... }: {

  environment.systemPackages = [ pkgs.gitui ];

  home-manager.sharedModules = [{
    programs.git = {
      enable = true;
      settings = {
        user.name = "nanobreaker";
        user.email = "nan0br3aker@gmail.com";
        core.editor = "hx";
      };
    };
  }];
}
