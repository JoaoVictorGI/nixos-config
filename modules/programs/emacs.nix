{
  flake.nixosModules.emacs =
    { pkgs, config, lib, ... }:
    {
      home-manager.users.joao.imports = [
        {
          programs.emacs = {
            enable = true;
            package = pkgs.emacsGit;
          };

          home.file.".config/doom" = {
            source = ./../../dotfiles/doom;
            recursive = true;
          };

          home.sessionPath = [
            "${config.home.homeDirectory}/.emacs.d/bin"
          ];
        }
      ];
    };
}
