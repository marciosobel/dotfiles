{
  shards.optimisations.store = let
    nix = {
      settings.auto-optimise-store = true;
    };
  in {
    nixos = {inherit nix;};
    homeManager = {inherit nix;};
  };
}
