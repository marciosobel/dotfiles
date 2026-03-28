{pkgs, ...}: {
  programs.fish.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      cursor_shape = "block";
      cursor_shape_unfocused = "hollow";
      cursor_beam_thickness = 2;
      cursor_trail = 0;
      cursor_trail_decay = "0.05 0.4";
      cursor_trail_start_threshold = 0;
      shell_integration = "no-cursor";

      remember_window_size = true;
      resize_in_steps = true;

      shell = "${pkgs.fish}/bin/fish";
    };
  };
}
