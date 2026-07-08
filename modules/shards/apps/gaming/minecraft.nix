{
  shards.apps.gaming.minecraft = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.prismlauncher];
    };
  };
}
