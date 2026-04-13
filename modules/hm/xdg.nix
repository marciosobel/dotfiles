{config, ...}: {
  xdg.userDirs = let
    home = relative-path: "${config.home.homeDirectory}/${relative-path}";
  in {
    enable = true;

    download = home "downloads";
    documents = home "documents";
    pictures = home "pictures";
    videos = home "videos";
    music = home "music";

    desktop = home "desktop";
    templates = home "templates";
    publicShare = home "public";
  };
}
