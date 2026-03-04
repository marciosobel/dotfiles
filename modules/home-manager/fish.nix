{pkgs, ...}: {
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

    shellAliases = {
      neofetch = "fastfetch";
      vim = "nvim";

      l = "lsd -1A --group-directories-first --color=always";
      ls = "lsd";
      la = "lsd -l --permission=octal";
      tree = "lsd --tree";

      gs = "git status --short";
      gc = "git commit";
      gl = "git log --graph --all --pretty=format:\"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n\"";
      "gc!" = "git commit --amend";
      "gc!!" = "git commit --amend --no-edit";
      gp = "git push";
      "gp!" = "git push --force";

      z = "zellij";
      za = "zellij attach";
    };
  };
}
