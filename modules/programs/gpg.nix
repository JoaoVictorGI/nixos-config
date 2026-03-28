{
  flake.nixosModules.gpg =
    { pkgs, ... }:
    {
      home-manager.users.joao.imports = [
        {
          programs.gpg.enable = true;

          services.gpg-agent = {
            enable = true;
            enableSshSupport = true;
            defaultCacheTtl = 34560000;
            defaultCacheTtlSsh = 34560000;
            maxCacheTtl = 34560000;
            maxCacheTtlSsh = 34560000;
            pinentry.package = pkgs.pinentry-gtk2;
          };
        }
      ];
    };
}
