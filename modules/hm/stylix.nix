{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    enable = true;

    base16Scheme = getTheme "gruvbox-material-light-medium";
    polarity = "light";

    icons = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      dark = "Adwaita";
      light = "Adwaita";
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      sizes = {
        terminal = 14;
        popups = 12;
      };
      sansSerif = {
        package = pkgs.texlivePackages.nunito;
        name = "Nunito";
      };
      monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font";
      };
    };

    targets = {
      waybar = {
        font = "sansSerif";
        fonts.override.sansSerif.name = "${fonts.sansSerif.name}, ${fonts.monospace.name} Propo";
        addCss = false;
      };
      kitty.opacity.override.terminal = 0.95;
      ghostty.opacity.override.terminal = 0.95;
      wofi.fonts.override.monospace.name = fonts.sansSerif.name;
      obsidian.fonts.override.sizes.applications = 16;
      helix.opacity.override.terminal = 0;
    };
  };
}
