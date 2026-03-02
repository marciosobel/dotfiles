{
  nix.settings.auto-optimize-store = true;
  nix.gc = {
    automatic = true;
    dates = "15d";
    options = "--delete-older-than 15d";
  };

  zramSwap.enable = true;
  services.earlyoom.enable = true;
  programs.direnv.enable = true;
}
