{ pkgs, ... }: {
  services.swww.enable = true;
  home.packages = [ pkgs.waypaper ];
}
