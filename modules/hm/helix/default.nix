{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = import ./settings.nix;
    languages = import ./languages.nix;
  };

  home.packages = with pkgs; [
    nil
    alejandra
  ];
}
