{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      nix-clean = "nix-collect-garbage -d --delete-old && sudo nix-collect-garbage -d --delete-old";
      l = "ls -l";
      ls = "ls -h --group-directories-first --color=auto";
      la = "ls -lAh --group-directories-first --color=auto";
    };

    historySize = 7000;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = true;
      format = ''
        $directory$git_branch$git_status$python
        $character
      '';
      directory = {
        format = "[$path]($style)";
        style = "bold";
        truncation_length = 3;
      };
      git_branch = {
        format = "[ |   ($branch)]($style)";
        style = "bold";
      };
      git_status = {
        format = "[$all_status$ahead_behind]($style)";
        style = "bold";
      };
    };
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.emacs.d/bin"
  ];
}
