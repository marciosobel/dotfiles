{pkgs, ...}: {
  home.packages = [pkgs.git-credential-manager];

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
        grapthColors = "blue,yellow,cyan,magenta,green,red";
      };

      pager = {
        branch = false;
        tag = false;
      };

      url."https://github.com/marciosobel/".insteadOf = "me:";
      url."https://github.com/".insteadOf = "gh:";

      interactive.singlekey = true;
      push.autoSetupRemote = true;
      branch.sort = "-commiterdate";
      tag.sort = "-taggerdate";
      init.defaultBranch = "dev";
      credential.helper = "manager";
      credential.credentialStore = "secretservice";

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
