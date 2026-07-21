{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;

  globalprotect-openconnect =
    inputs.globalprotect-openconnect.packages.${system}.fromSource.overrideAttrs
      (old: {
        postInstall = (old.postInstall or "") + ''
          substituteInPlace "$out/libexec/gpclient/vpnc-script" \
            --replace-fail "/usr/bin/resolvectl" "${pkgs.systemd}/bin/resolvectl" \
            --replace-fail "/usr/bin/busctl" "${pkgs.systemd}/bin/busctl"
        '';
      });
in
{
  environment.systemPackages = [
    globalprotect-openconnect
  ];
}
