{__findFile, ...}: let
  user = "marci";
  cfg = {
    classes = ["homeManager"];
    nixos = {
      users.users.${user} = {
        isNormalUser = true;
        description = user;
        extraGroups = ["wheel" "networkmanager"];
      };
    };
  };
in {
  den.aspects.${user} = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <shards/apps/browsers/zen-browser>
      <shards/apps/fastfetch>
      <shards/apps/cava>
      <shards/apps/btop>
      <shards/apps/yazi>
      <shards/apps/vial>
      <shards/apps/tidal>
      <shards/apps/obsidian>
      <shards/apps/social/discord>
      <shards/apps/social/telegram>
    ];

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        ente-auth
        proton-pass
      ];

      home.shellAliases = {
        neofetch = "fastfetch"; # yes, im that kinda person
        zed = "zeditor";

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
  };

  den.hosts.x86_64-linux.laptop.users.${user} = cfg;
  den.hosts.x86_64-linux.desktop.users.${user} = cfg;
}
