{pkgs, ...}: let
  getTheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
in {
  stylix = rec {
    enable = true;
    base16Scheme = getTheme "gruvbox-material-dark-medium";
    polarity = "dark";
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
      sizes.desktop = 12;

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
        font = "sansSerif";
        fonts.override.sansSerif.name = "${fonts.sansSerif.name}, ${fonts.monospace.name}";
        addCss = false;
      };
      kitty = {
        opacity.override.terminal = 0.95;
        fonts.override.monospace.name = "JetBrainsMono Nerd Font";
      };
      ghostty = {
        opacity.override.terminal = 0.9;
        fonts.override.monospace.name = "JetBrainsMono Nerd Font";
      };
      wofi.fonts.override.monospace.name = "Nunito";
      cava.rainbow.enable = true;
      obsidian.fonts.override.sizes.applications = 16;
      helix.opacity.override.terminal = 0;
    };
  };
}
