{
  pkgs,
  inputs,
  ...
}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  imports = [inputs.stylix.homeModules.stylix];

  gtk.gtk4.theme = null;

  stylix = rec {
    enable = true;

    polarity = "dark";
    base16Scheme = getTheme "rose-pine";

    icons = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      dark = "Adwaita";
      light = "Adwaita";
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    fonts = {
      sizes.popups = 12;
      sansSerif = {
        package = pkgs.texlivePackages.nunito;
        name = "Nunito";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
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
      obsidian.fonts.override.sizes.applications = 14;
      helix.opacity.override.terminal = 0;
    };
  };
}
