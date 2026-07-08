{
  shards.optimisations.garbage-collection = {
    nix.gc = {
      automatic = true;
      dates = "15d";
      options = "--delete-older-than 15d";
    };
  };
}
