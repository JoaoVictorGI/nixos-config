{
  inputs,
  self,
  ...
}:
{
  flake.nixosModules.wsl =
    { pkgs, lib, ... }:
    {
      imports = [
        inputs.nixos-wsl.nixosModules.default
        inputs.agenix.nixosModules.default

        {
          fonts.packages = with pkgs; [
            font-awesome_5
            iosevka
            nerd-fonts.iosevka
            powerline-fonts
          ];
        }
      ];

      age.identityPaths = [
        (self + /secrets/ssh-key.pub)
      ];

      age.secrets.gpg = {
        file = self + /secrets/gpg.age;
        path = "/home/joao/.gnupg";
      };

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      wsl = {
        enable = true;
        defaultUser = "joao";
      };

      system.stateVersion = "25.11";
    };
}
