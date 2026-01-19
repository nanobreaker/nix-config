{ pkgs, ... }:
let
  jdk = pkgs.jdk25;
  maven = pkgs.maven.override { jdk_headless = jdk; };
in {
  environment.systemPackages = [
    jdk
    maven
    pkgs.jdk21
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.jdk
    pkgs.graalvmPackages.graalvm-ce
  ];

  environment.variables = { JAVA_HOME = "${jdk}"; };
}
