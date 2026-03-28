{ inputs, self, ... }:
{
  flake.nixosModules.wsl =
    { pkgs, lib, ... }:
    {
      imports = [
        inputs.nixos-wsl.nixosModules.default

        self.nixosModules.home-manager
        self.nixosModules.bash
        self.nixosModules.git
        self.nixosModules.cli-tools
        self.nixosModules.emacs
        self.nixosModules.fonts
        self.nixosModules.xdg-dirs
        self.nixosModules.gpg
      ];

      nixpkgs.overlays = [ inputs.emacs.overlay ];

      fonts.packages = with pkgs; [
        font-awesome_5
        iosevka
        nerd-fonts.iosevka
        powerline-fonts
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      wsl = {
        enable = true;
        defaultUser = "joao";
      };

      users.users.joao = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };

      system.stateVersion = "25.11";
    };
}
