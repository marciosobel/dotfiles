{
  shards.shells.fish = {
    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        any-nix-shell # compatibility for `nix run` and `nix-shell`
        zoxide
      ];

      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
          direnv hook fish | source
          zoxide init --cmd cd fish | source
        '';

        plugins = [
          {
            name = "pure";
            src = pkgs.fishPlugins.pure.src;
          }
          {
            name = "done";
            src = pkgs.fishPlugins.done.src;
          }
          {
            name = "autopair";
            src = pkgs.fishPlugins.autopair.src;
          }
        ];
      };
    };
  };
}
