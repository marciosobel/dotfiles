{shards, ...}: {
  shards.editors.neovide = {
    includes = [shards.editors.nvim.with-plugins];

    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wl-clipboard];

      programs.neovide = {
        enable = true;
      };
    };
  };
}
