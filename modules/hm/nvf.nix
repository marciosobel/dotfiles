{
  inputs,
  pkgs,
  lib,
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
          css.enable = true;
          html.enable = true;
          json.enable = true;
          rust.enable = true;
          go.enable = true;

          vue.enable = true;
          astro.enable = true;

          markdown = {
            enable = true;
            extensions.markview-nvim.enable = true;
          };
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
          winborder = "rounded";
        };

        tabline.nvimBufferline = {
          enable = true;
          setupOpts.options.numbers = "none";
          mappings = {
            closeCurrent = "<leader>x";
            cycleNext = "<Tab>";
            cyclePrevious = "<S-Tab>";
          };
        };

        statusline.lualine.enable = true;

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

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp = {
          enable = true;
          sources = {
            nvim_lsp = "[LSP]";
            luasnip = "[Snippet]";
            buffer = "[Buffer]";
            path = "[Path]";
            treesitter = null;
          };
          mappings = {
            next = "<C-n>";
            previous = "<C-p>";
            scrollDocsDown = "<C-d>";
            scrollDocsUp = "<C-u>";
          };
          format = lib.generators.mkLuaInline ''
            function(entry, vim_item)
              local kind_icons = {
              	Text = "",
              	VariableMember = "",
              	Method = "󰆧",
              	Function = "󰊕",
              	Constructor = "",
              	Field = "󰇽",
              	Variable = "󰀫",
              	Class = "󰠱",
              	Interface = "",
              	Module = "",
              	Property = "󰜢",
              	Unit = "",
              	Value = "󰎠",
              	Enum = "",
              	Keyword = "󰌋",
              	Snippet = "",
              	Color = "󰏘",
              	File = "󰈙",
              	Reference = "",
              	Folder = "󰉋",
              	EnumMember = "",
              	Constant = "󰏿",
              	Struct = "",
              	Event = "",
              	Operator = "󰆕",
              	TypeParameter = "󰅲",
              }

              vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", string.lower(vim_item.kind))
              vim_item.menu = ""
              return vim_item
            end
          '';
        };

        binds.whichKey.enable = true;

        formatter.conform-nvim.enable = true;

        mini = {
          surround.enable = true;
          animate.enable = false;
        };

        notify.nvim-notify = {
          enable = true;
          setupOpts = {
            position = "bottom_right";
            stages = "slide";
          };
        };

        debugger.nvim-dap.enable = true;

        treesitter = {
          autotagHtml = true;
          indent.enable = false;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        dashboard.alpha = {
          enable = true;
          theme = "theta";
        };

        navigation.harpoon.enable = true;

        diagnostics = {
          enable = true;
          config = {
            # virtual_lines = true;
            virtual_text = true;
          };
        };

        filetree.nvimTree = {
          enable = true;
          mappings.toggle = "<leader>e";
        };

        utility.preview.markdownPreview = {
          enable = true;
        };

        ui = {
          borders.enable = true;
          colorful-menu-nvim.enable = true;
          colorizer.enable = true;
        };

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
          setupOpts = {
            direction = "float";
            shell = "${pkgs.fish}/bin/fish";
          };
        };

        projects.project-nvim = {
          enable = true;
          setupOpts.manual_mode = false;
        };

        presence.neocord = {
          enable = true;
          setupOpts = {
            logo_tooltip = "i definitely know what im doing";
            logo = "https://i.pinimg.com/736x/d0/26/b4/d026b408fe43e9b009b28b18648268e6.jpg";
          };
        };

        assistant.copilot.enable = true;
      };
    };
  };
}
