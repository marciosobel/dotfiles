{
  programs.zellij = {
    enable = true;
    # enableFishIntegration = true;
    settings = {
      pane_frames = false;
      show_startup_tips = false;
      simplified_ui = true;
      default_shell = "fish";
    };
  };
}
