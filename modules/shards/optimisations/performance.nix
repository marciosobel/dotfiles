{
  shards.optimisations.performance = {
    nixos = {
      zramSwap.enable = true;
      services.earlyoom.enable = true;
    };
  };
}
