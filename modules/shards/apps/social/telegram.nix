{
  shards.apps.social.telegram = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.telegram-desktop];
    };
  };
}
