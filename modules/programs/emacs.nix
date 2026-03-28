{
  flake.nixosModules.emacs =
    { pkgs, ... }:
    {
      home-manager.users.joao.imports = [
        {
          programs.emacs = {
            enable = true;
            package = pkgs.emacs-git;
          };

          home.file.".config/doom" = {
            source = ./../../dotfiles/doom;
            recursive = true;
          };
        }
      ];
    };
}
