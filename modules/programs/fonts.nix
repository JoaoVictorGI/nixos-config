{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        font-awesome_5
        iosevka
        nerd-fonts.iosevka
        powerline-fonts
      ];
    };
}
