{ inputs, ... }:
{
  flake.nixosModules.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
      backupCommand = "rm";

      users.joao = {
        home.stateVersion = "25.11";
        programs.home-manager.enable = true;
        home.sessionPath = [ "$HOME/.emacs.d/bin" ];
      };
    };
  };
}
