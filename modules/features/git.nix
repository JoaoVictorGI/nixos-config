{ inputs, ... }:
{
  flake.homeModules.git =
    { ... }:
    {
      programs.git = {
        enable = true;
        signing.signByDefault = true;

        ignores = [
          "result"
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
    };
}
