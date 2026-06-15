{pkgs, ...}: {
  home.packages = [pkgs.wl-clipboard];

  programs.neovide = {
    enable = true;
  };
}
