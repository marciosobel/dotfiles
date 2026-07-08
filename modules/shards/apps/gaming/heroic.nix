{
  shards.apps.gaming.heroic = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.heroic];
    };
  };
}
