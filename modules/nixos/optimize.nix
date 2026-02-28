{
  nix.gc = {
    automatic = true;
    dates = "15d";
    options = "--delete-older-than 15d";
  };
  nix.settings.auto-optimize-store = true;

  zramSwap.enable = true;
  services.earlyoom.enable = true;
}
