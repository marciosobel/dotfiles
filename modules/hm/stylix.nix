{pkgs, ...}: {
  stylix = rec {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.google-cursor;
      name = "GoogleDot-Black";
      size = 16;
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
      wofi.fonts.override.monospace.name = "Nunito";
      cava.rainbow.enable = true;
      obsidian.fonts.override.sizes.applications = 16;
    };
  };
}
