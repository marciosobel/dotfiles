{pkgs, ...}: let
  shaders = pkgs.fetchFromGitHub {
    owner = "KroneCorylus";
    repo = "ghostty-shader-playground";
    rev = "main";
    sha256 = "sha256-Z3jF76MnyEGQuzfeZNTyOhpGAiGfhm6rnkdeBIpsJck=";
  };
  shader = name: "${shaders}/public/shaders/${name}.glsl";
in {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      shell-integration-features = "no-cursor";
      command = "${pkgs.fish}/bin/fish";
      cursor-style = "block";
      link-previews = true;
      window-inherit-working-directory = false;

      custom-shader = shader "cursor_smear";
      custom-shader-animation = true;
    };
  };
}
