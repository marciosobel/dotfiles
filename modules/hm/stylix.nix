{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    enable = true;

    # while https://github.com/tinted-theming/schemes/pull/98 doesn't get merged in nixpkgs
    base16Scheme = {
      name = "Everforest Light (Medium)";
      variant = "light";
      base00 = "#fdf6e3";
      base01 = "#f4f0d9";
      base02 = "#e6e2cc";
      base03 = "#939f91";
      base04 = "#829181";
      base05 = "#5c6a72";
      base06 = "#475258";
      base07 = "#2d353b";
      base08 = "#f85552";
      base09 = "#f57d26";
      base0A = "#dfa000";
      base0B = "#8da101";
      base0C = "#35a77c";
      base0D = "#3a94c5";
      base0E = "#df69ba";
      base0F = "#829181";
    };

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
      sizes.popups = 12;
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
      gtk.extraCss = ''
        * { border-radius: 0px; }
      '';
    };
  };
}
