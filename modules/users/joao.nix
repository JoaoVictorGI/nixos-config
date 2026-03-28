{
  inputs,
  self,
  config,
  ...
}:
{
  flake.nixosModules.joao =
    { pkgs, ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
        config.flake.homeModules.cli-tools
        config.flake.homeModules.git
        config.flake.homeModules.shell
        config.flake.homeModules.emacs
        config.flake.homeModules.xdg-dirs
      ];

      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "bkp";
      };

      home = {
        username = "joao";
        homeDirectory = "/home/joao";
        stateVersion = "25.11";
      };

      programs.gpg.enable = true;

      services.gpg-agent = {
        enable = true;
        enableSshSupport = true;
        defaultCacheTtl = 34560000;
        defaultCacheTtlSsh = 34560000;
        maxCacheTtl = 34560000;
        maxCacheTtlSsh = 34560000;
        pinentry.package = pkgs.pinentry-gtk2;
        sshKeys = [ "C7E24DA262329549A1EBC7CC59B18690BE37E1CB" ];
      };

      manual.manpages.enable = true;
    };
}
