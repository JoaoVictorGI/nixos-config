{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      home-manager.users.joao.imports = [
        {
          fonts = {
            fontConfig = {
              allowBitmaps = true;
              antialias = true;
              autohint = true;
              hintstyle = "hintfull";
              rgba = "rgb";
            };

            packages = with pkgs; [
              font-awesome_5
              iosevka
              nerd-fonts.iosevka
              powerline-fonts
            ];
          };
        }
      ];
    };
}
