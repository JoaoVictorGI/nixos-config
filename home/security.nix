{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 34560000;
    defaultCacheTtlSsh = 34560000;
    maxCacheTtl = 34560000;
    maxCacheTtlSsh = 34560000;
    pinentry = {
      package = pkgs.pinentry-gtk2;
    };
    sshKeys = [ "C7E24DA262329549A1EBC7CC59B18690BE37E1CB" ];
  };
}
