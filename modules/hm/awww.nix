{pkgs, ...}: {
  services.awww.enable = true;
  home.packages = [pkgs.waypaper];
}
