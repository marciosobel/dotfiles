{
  shards.optimisations.performance = {
    nixos = {
      zramSwap.enable = true;
      services.earlyoom.enable = true;
      fileSystems."/".options = ["noatime"]; # Stop writting the access time of files to extend disk health
    };
  };
}
