{
  config,
  lib,
  pkgs,
  ...
}:

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
    pinentry-gtk2
    # For lspci, ...
    pciutils
    # For pkill, killall, ...
    psmisc
    ripgrep
    sshfs
    tree
    tree-sitter
    unar
    unzip
    # For lsusb, etc
    usbutils
    wget
    zip
  ];

  home.file = {
    ".config/doom" = {
      source = ../dotfiles/doom;
      recursive = true;
    };
  };
}
