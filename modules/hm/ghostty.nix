{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      shell-integration-features = "no-cursor";
      command = "${pkgs.fish}/bin/fish";
      cursor-style = "block";
      link-previews = true;
    };
  };
}
