{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    enable = true;

    polarity = "dark";

    # Kanagawa colorscheme. Slightly altered in the red (base08) because
    # the red from the base16schemes is too dark.
    base16Scheme = {
      variant = "dark";
      base00 = "#1f1f28";
      base01 = "#16161d";
      base02 = "#223249";
      base03 = "#54546d";
      base04 = "#727169";
      base05 = "#dcd7ba";
      base06 = "#c8c093";
      base07 = "#717c7c";
      base08 = "#e46876";
      base09 = "#ffa066";
      base0A = "#c0a36e";
      base0B = "#76946a";
      base0C = "#6a9589";
      base0D = "#7e9cd8";
      base0E = "#957fb8";
      base0F = "#d27e99";
    };

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
      obsidian.fonts.override.sizes.applications = 16;
      helix.opacity.override.terminal = 0;
      gtk.extraCss = ''
        * { border-radius: 0px; }
      '';
    };
  };
}
