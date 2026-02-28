{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        end-of-line-diagnostics = "hint";
        bufferline = "multiple";
        cursorline = false;
        popup-border = "all";
        scrolloff = 8;
        file-picker.hidden = false;
        inline-diagnostics.cursor-line = "warning";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };

      keys = {
        normal = {
          x = "select_line_below";
          X = "select_line_above";
          space.x = ":bc";
          space.X = ":bc!";
        };
        select = {
          x = "select_line_below";
          X = "select_line_above";
        };
        insert = {
          C-space = "completion";
        };
      };
    };

    languages.language-server = {
      eslint = {
        command = "eslint-lsp";
        args = ["--stdio"];
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "alejandra";
      }
    ];
  };

  home.packages = with pkgs; [
    nil
    alejandra
  ];
}
