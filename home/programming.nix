{
  config,
  lib,
  pkgs,
  ...
}:

{
  manual.manpages.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;

    signing = {
      key = "625D7A7196C45650";
      signByDefault = true;
    };

    ignores = [
      # nix
      "result"

      # direnv/devenv
      ".devenv"
      ".direnv"
      ".pre-commit-config.yaml"
    ];

    settings = {
      user = {
        name = "João Victor";
        email = "joaovictor.gizidoro@gmail.com";
      };

      alias = {
        st = "status -s";
        sta = "status";
        a = "add";
        c = "clone";
        ca = "commit --amend";
        can = "commit --amend --no-edit";
        cam = "commit --amend -m";
        cm = "commit -m";
        fo = "fetch origin";
        po = "push origin";
        pro = "pull --rebase origin";
        br = "branch";
        branches = "branch --sort=-committerdate --format='%(HEAD)%(color:yellow) %(refname:short) | %(color:bold red)%(committername) | %(color:bold green)%(committerdate:relative) | %(color:blue)%(subject)%(color:reset)' --color=always";
      };

      core = {
        editor = "doom emacs";
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        autoSetupRemote = true;
      };

      commit.gpgSign = true;
    };
  };
}
