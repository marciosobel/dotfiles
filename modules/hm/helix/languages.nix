{
  language-server = {
    eslint = {
      command = "eslint-lsp";
      args = ["--stdio"];
    };
    vuels = {
      command = "pnpm";
      args = ["@vue/language-server" "--stdio"];
    };
    typescript-language-server.config.plugins = [
      {
        name = "@vue/typescript-plugin";
        location = "@vue/language-server";
        languages = ["vue"];
      }
    ];
  };

  language = [
    {
      name = "nix";
      auto-format = true;
      formatter.command = "alejandra";
    }
    {
      name = "typescript";
      auto-format = true;
      language-servers = ["typescript-language-server" "eslint"];
      formatter = {
        command = "prettierd";
        args = ["--stdin-filepath" "%{buffer_name}"];
      };
    }
    {
      name = "vue";
      scope = "source.vue";
      injection-regex = "vue";
      file-types = ["vue"];
      auto-format = true;
      formatter = {
        command = "prettierd";
        args = ["--stdin-filepath" "%{buffer_name}"];
      };
      language-servers = [
        "vuels"
        "eslint"
        "typescript-language-server"
        # "vscode-html-language-server"
        # "vscode-css-language-server"
      ];
      indent = {
        tab-width = 4;
        unit = "    ";
      };
    }
  ];
}
