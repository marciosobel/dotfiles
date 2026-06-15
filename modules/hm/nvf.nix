{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./neovide.nix
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        keymaps = [];
        maps = {
          normal = {
            "<leader>fd" = {
              action = ''
                function()
                  vim.diagnostic.open_float({ border = "rounded" })
                end
              '';
              lua = true;
              desc = "Show diagnostics";
            };
            "<C-d>".action = "<C-d>zz";
            "<C-u>".action = "<C-u>zz";
            "n".action = "nzzzv";
            "N".action = "Nzzzv";
            "<leader>y" = {
              action = ''"+y'';
              desc = "Copy to system clipboard";
            };
          };
          visual = {
            "<leader>y" = {
              action = ''"+y'';
              desc = "Copy to system clipboard";
            };
          };
          select = {
            "<leader>p" = {
              action = ''"_dP'';
              desc = "Paste without overwritting current buffer";
            };
          };
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;

          nix.enable = true;
          typescript.enable = true;
          rust.enable = true;
          go.enable = true;
          vue.enable = true;
        };

        options = {
          fillchars = {eob = " ";};
          hlsearch = false;
          incsearch = true;
          scrolloff = 8;
          updatetime = 50;
          colorcolumn = ["120"];
          wrap = false;
          termguicolors = true;
          tabstop = 4;
          shiftwidth = 4;
        };

        tabline = {
          nvimBufferline = {
            enable = true;
            mappings = {
              closeCurrent = "<leader>x";
              cycleNext = "<Tab>";
              cyclePrevious = "<S-Tab>";
            };
          };
        };

        statusline = {
          lualine.enable = true;
        };

        telescope = {
          enable = true;
          setupOpts = {
            defaults = {
              color_devicons = true;
              border = true;
              layout_config = {
                horizontal.prompt_position = "bottom";
              };
            };
          };
        };

        autocomplete = {
          nvim-cmp.enable = true;
        };

        binds = {
          whichKey.enable = true;
        };

        formatter = {
          conform-nvim.enable = true;
        };

        mini = {
          surround.enable = true;
          animate.enable = false;
        };

        notify = {
          nvim-notify = {
            enable = true;
            setupOpts = {
              position = "bottom_right";
              stages = "slide";
            };
          };
        };

        debugger = {
          nvim-dap.enable = true;
        };

        treesitter = {
          autotagHtml = true;
          indent.enable = false;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        dashboard = {
          alpha = {
            enable = true;
            theme = "theta";
          };
        };

        navigation = {
          harpoon.enable = true;
        };

        diagnostics = {
          enable = true;
          config = {
            # virtual_lines = true;
            virtual_text = true;
          };
        };

        filetree = {
          nvimTree = {
            enable = true;
            mappings.toggle = "<leader>e";
          };
        };

        ui = {
          borders = {
            enable = true;
          };
          colorful-menu-nvim.enable = true;
          colorizer.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
            setupOpts = {
              direction = "float";
              shell = "${pkgs.fish}/bin/fish";
            };
          };
        };

        projects = {
          project-nvim = {
            enable = true;
            setupOpts.manual_mode = false;
          };
        };
      };
    };
  };
}
