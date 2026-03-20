{ ... }:

{
  home.stateVersion = "25.11";

  imports = [
    ./bash.nix
    ./programming.nix
    ./security.nix
    ./xdg.nix
    ./commons.nix
  ];
}
