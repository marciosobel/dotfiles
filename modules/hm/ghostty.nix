{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      command = "${pkgs.fish}/bin/fish";
    };
  };
}
