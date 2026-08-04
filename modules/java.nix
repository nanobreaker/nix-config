{ pkgs, ... }:
let
  jdk = pkgs.jdk25;
  maven = pkgs.maven.override { jdk_headless = jdk; };
in
{
  environment.systemPackages = [
    jdk
    maven
    pkgs.jdt-language-server
    pkgs.quarkus
    pkgs.jetbrains.idea
    pkgs.jetbrains.jdk
    pkgs.jetbrains.datagrip
  ];

  environment.variables = {
    JAVA_HOME = "${jdk}";
  };
}
