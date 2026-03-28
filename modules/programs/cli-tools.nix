{
  flake.nixosModules.cli-tools =
    { pkgs, ... }:
    {
      home-manager.users.joao.imports = [
        {
          home.packages = with pkgs; [
            aspell
            curl
            croc
            devenv
            dig
            exiftool
            fastfetch
            fd
            file
            ffmpeg
            graphviz
            htop
            jq
            lsof
            pciutils
            psmisc
            ripgrep
            sshfs
            tree
            tree-sitter
            unar
            unzip
            usbutils
            wget
            zip
          ];
        }
      ];
    };
}
