{
  den.aspects.nix = {
    nixos = {
      nix.settings.auto-optimise-store = true;
      nix.gc = {
        automatic = true;
        dates = "15d";
        options = "--delete-older-than 15d";
      };

      zramSwap.enable = true;
      services.earlyoom.enable = true;
    };
  };
}
