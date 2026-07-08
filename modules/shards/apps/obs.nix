{
  shards.apps.obs = {
    nixos = {
      programs.obs-studio = {
        enable = true;
        enableVirtualCamera = true;
      };
    };
  };
}
