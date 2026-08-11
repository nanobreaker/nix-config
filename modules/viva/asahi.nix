{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  linux-asahi-fairydust-pkg =
    {
      stdenv,
      lib,
      fetchFromGitHub,
      buildLinux,
      ...
    }:
    buildLinux rec {
      inherit stdenv lib;

      pname = "linux-asahi-fairydust";
      version = "7.1.6";
      extraMeta.branch = "7.1";

      src = fetchFromGitHub {
        owner = "AsahiLinux";
        repo = "linux";
        rev = "eb8089bbc11872c50fcf5138ff069d51b4ae996f";
        hash = "sha256-WywkNZXonLcyO0xAMlW7/k3uE9Embz3qedwyB5VOxQs=";
      };

      kernelPatches = [
        {
          name = "Asahi config";
          patch = null;
          structuredExtraConfig = with lib.kernel; {
            ARM64_16K_PAGES = yes;
            ARM64_MEMORY_MODEL_CONTROL = yes;
            ARM64_ACTLR_STATE = yes;

            APPLE_WATCHDOG = yes;
            APPLE_M1_CPU_PMU = yes;
            APPLE_MAILBOX = yes;
            APPLE_RTKIT = yes;
            APPLE_RTKIT_HELPER = yes;
            APPLE_PMGR_MISC = yes;
            APPLE_PMGR_PWRSTATE = yes;

            RUST_APPLE_RTKIT = yes;
            RUST_FW_LOADER_ABSTRACTIONS = yes;

            HID_APPLE = module;
          };
          features.rust = true;
        }
      ]
      ++ config.boot.kernelPatches;
    };

  fairydustKernel = pkgs.callPackage linux-asahi-fairydust-pkg { };
in
{
  imports = [
    inputs.apple-silicon.nixosModules.apple-silicon-support
  ];

  boot.kernelPackages = lib.mkForce (pkgs.linuxPackagesFor fairydustKernel);
}
