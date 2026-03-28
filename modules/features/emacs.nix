{ inputs, self, ... }:
{
  flake.homeModules.emacs =
    { pkgs, config, ... }:
    {
      programs.emacs = {
        enable = true;
        package = pkgs.emacsGit;
      };

      home.file.".config/doom" = {
        source = self + /dotfiles/doom;
        recursive = true;
      };

      home.sessionPath = [
        "${config.home.homeDirectory}/.emacs.d/bin"
      ];
    };
}
