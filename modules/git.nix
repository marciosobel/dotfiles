{ pkgs, ... }: {
  home.packages = [ pkgs.git-credential-manager ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Márcio Sobel";
        email = "marciosobel@proton.me";
      };
      commit.gpgSign = true;
      credential.helper = "manager";
      credential.credentialStore = "secretservice";
    };
  };
}
