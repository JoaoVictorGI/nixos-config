{ self, inputs, ... }:

{
  flake.nixosModules.wslConfiguration = { pkgs, lib, ... }: {
    # import modules from here
    imports = [
      self.nixosModules.joao
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
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
      pinentry-gtk2
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

    environment.variables = {
      EDITOR = "doom emacs";
      SUDO_EDITOR = "emacs";
    };

    virtualisation.containers.enable = true;


    virtualisation.containers.policy = {
      default = [
        {
          type = "insecureAcceptAnything";
        }
      ];
    };

    wsl = {
      enable = true;
      defaultUser = "joao";
      startMenuLaunchers = true;
      usbip.enable = true;
      useWindowsDriver = true;
    };

    system.stateVersion = "25.11";
  };
}
