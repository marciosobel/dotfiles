{__findFile, ...}: {
  shards.apps.tidal = {
    includes = [(<den/unfree> ["castlabs-electron"])];
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.tidal-hifi];
    };
  };
}
