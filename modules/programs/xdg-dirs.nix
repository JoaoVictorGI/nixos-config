{
  flake.nixosModules.xdg-dirs = {
    home-manager.users.joao.imports = [
      {
        xdg.userDirs = {
          createDirectories = true;
          documents = "$HOME/Documents";
          download = "$HOME/Downloads";
          music = "$HOME/Music";
          pictures = "$HOME/Pictures";
          publicshare = "$HOME/Public";
          templates = "$HOME/Templates";
          videos = "$HOME/Videos";
        };
      }
    ];
  };
}
