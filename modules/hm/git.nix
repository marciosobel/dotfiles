{pkgs, ...}: {
  home.packages = [
    pkgs.git-credential-manager
    pkgs.delta
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Márcio Sobel";
        email = "marciosobel@proton.me";
      };

      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
        pager = "delta";
      };

      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      commit = {
        gpgSign = true;
        verbose = true;
      };

      log = {
        abbrevCommit = true;
        graphColors = "blue,yellow,cyan,magenta,green,red";
      };

      pager = {
        branch = false;
        tag = false;
        blame = "delta";
      };

      interactive = {
        singlekey = true;
        diffFilter = "delta --color-only";
      };

      delta = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
        hyperlinks = true;
      };

      merge = {
        conflictStyle = "zdiff3";
      };

      credential = {
        helper = "manager";
        credentialStore = "gpg";
      };

      url."https://github.com/marciosobel/".insteadOf = "me:";
      url."https://github.com/".insteadOf = "gh:";

      push.autoSetupRemote = true;
      branch.sort = "-committerdate";
      tag.sort = "-taggerdate";
      init.defaultBranch = "dev";

      color = {
        branch = {
          current = "magenta";
          local = "default";
          remote = "yellow";
          upstream = "green";
          plain = "blue";
        };
        decorate = {
          HEAD = "red";
          branch = "blue";
          tag = "yellow";
          remoteBranch = "magenta";
        };
      };
    };
  };
}
