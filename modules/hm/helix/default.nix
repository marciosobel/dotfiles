{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = import ./settings.nix;
    languages = import ./languages.nix;
  };

  home.packages = with pkgs; [
    nil
    alejandra
  ];
}
