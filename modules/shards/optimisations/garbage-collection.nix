{
  shards.optimisations.garbage-collection = let
    nix = {
      gc = {
        automatic = true;
        dates = "15d";
        options = "--delete-older-than 15d";
      };
    };
  in {
    nixos = {inherit nix;};
    homeManager = {inherit nix;};
  };
}
