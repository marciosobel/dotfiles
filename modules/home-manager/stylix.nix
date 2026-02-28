{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";
    cursor = {
      package = pkgs.google-cursor;
      name = "GoogleDot-Black";
      size = 16;
    };
    fonts = {
      sansSerif = {
        package = pkgs.texlivePackages.nunito;
        name = "Nunito";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Propo";
      };
    };
    targets = {
      waybar = {
        fonts.enable = false;
        addCss = false;
      };
      kitty = {
        opacity.enable = false;
        fonts.enable = false;
      };
    };
  };
}
