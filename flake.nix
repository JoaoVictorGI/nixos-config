{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix";

    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs:
    let
      tree = inputs.import-tree ./modules;
      baseModule = {
        systems = [ "x86_64-linux" ];
        imports = [
          inputs.flake-parts.flakeModules.modules
          inputs.home-manager.flakeModules.home-manager
        ];
      };
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      baseModule
      // tree
      // {
        perSystem =
          { config, pkgs, ... }:
          {
            formatter = (inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix).config.build.wrapper;
          };
      }
    );
}
