{ pkgs, inputs, ... }:
{
  environment.variables = {
    BROWSER = "zen";
  };

  environment.systemPackages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
