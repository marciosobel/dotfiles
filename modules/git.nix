{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Márcio Sobel";
        email = "marciosobel@proton.me";
      };
      commit.gpgSign = true;
    };
  };
}
