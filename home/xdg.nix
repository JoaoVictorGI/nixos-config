{
  config,
  lib,
  pkgs,
  ...
}:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "${config.home.homeDirectory}/desk";
    download = "${config.home.homeDirectory}/dl";
    templates = "${config.home.homeDirectory}/misc";
    publicShare = "${config.home.homeDirectory}/misc";
    documents = "${config.home.homeDirectory}/dox";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pix";
    videos = "${config.home.homeDirectory}/vids";
  };
}
