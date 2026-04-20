{pkgs, ...}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop.override {rocmSupport = true;};
    settings = {
      vim_keys = true;
      rounded_corners = false;
      proc_left = true;
    };
  };
}
