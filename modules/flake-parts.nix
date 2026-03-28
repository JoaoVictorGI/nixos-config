{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.modules ];
  systems = [ "x86_64-linux" ];

  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [ pkgs.nixfmt-tree ];
      };
    };
}
