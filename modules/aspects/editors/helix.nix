{
  den.aspects.editors.helix = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        helix
        nil
        alejandra
      ];
    };

    homeManager = {pkgs, ...}: {
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
          };

          keys = {
            normal = {
              x = "select_line_below";
              X = "select_line_above";
              space.x = ":bc";
              space.X = ":bc!";
              space.e = let
                unique-file = "/tmp/unique-file";
              in [
                ":sh rm -f ${unique-file}"
                ":insert-output yazi \"%{buffer_name}\" --chooser-file=${unique-file}"
                ":sh printf \"\\x1b[?1049h\\x1b[?2004h\" > /dev/tty"
                ":open %sh{cat ${unique-file}}"
                ":redraw"
                ":set-option mouse false"
                ":set-option mouse true"
              ];
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

        languages = {
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
              name = "go";
              auto-format = true;
              formatter.command = "goimports";
            }
            {
              name = "rust";
              auto-format = true;
              formatter.command = "rustfmt";
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
        };
      };
    };
  };
}
