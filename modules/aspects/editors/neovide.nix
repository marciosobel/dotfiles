{den, ...}: {
  den.aspects.editors.neovide = {
    includes = with den.aspects; [editors.nvim];

    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.wl-clipboard];

      programs.neovide = {
        enable = true;
      };
    };
  };
}
