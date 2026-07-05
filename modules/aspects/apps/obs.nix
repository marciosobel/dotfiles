{
  den.aspects.apps.obs = {
    nixos = {
      programs.obs-studio = {
        enable = true;
        enableVirtualCamera = true;
      };
    };
  };
}
