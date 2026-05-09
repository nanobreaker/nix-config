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
  ];

  environment.variables = {
    JAVA_HOME = "${jdk}";
  };
}
