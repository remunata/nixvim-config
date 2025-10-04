let
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
          table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
in
{
  plugins.cmp-emoji.enable = true;
  plugins.cmp-nvim-lsp.enable = true;
  plugins.cmp-buffer.enable = true;
  plugins.cmp-path.enable = true;
  plugins.cmp_luasnip.enable = true;
  plugins.cmp-cmdline.enable = true;

  plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings = {
      snippet = {
        expand = "luasnip";
      };

      formatting = {
        fields = [
          "kind"
          "abbr"
          "menu"
        ];
      };

      sources = [
        {
          name = "nvim_lsp";
          priority = 1000;
          option = {
            inherit get_bufnrs;
          };
        }
        {
          name = "nvim_lsp_signature_help";
          priority = 1000;
          option = {
            inherit get_bufnrs;
          };
        }
        {
          name = "nvim_lsp_document_symbol";
          priority = 1000;
          option = {
            inherit get_bufnrs;
          };
        }
        {
          name = "luasnip";
          priority = 750;
        }
        {
          name = "buffer";
          priority = 500;
          option = {
            inherit get_bufnrs;
          };
        }
        {
          name = "path";
          priority = 300;
        }
        {
          name = "cmdline";
          priority = 300;
        }
        {
          name = "git";
          priority = 250;
        }
        {
          name = "emoji";
          priority = 100;
        }
      ];

      mapping = {
        "<C-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-k>" = "cmp.mapping.select_prev_item()";
        "<C-e>" = "cmp.mapping.abort()";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
      };
    };
  };

  extraConfigLua = ''
    luasnip = require("luasnip")
    kind_icons = {
      Text = "󰊄",
      Method = " ",
      Function = "󰡱 ",
      Constructor = " ",
      Field = " ",
      Variable = "󱀍 ",
      Class = " ",
      Interface = " ",
      Module = "󰕳 ",
      Property = " ",
      Unit = " ",
      Value = " ",
      Enum = " ",
      Keyword = " ",
      Snippet = " ",
      Color = " ",
      File = "",
      Reference = " ",
      Folder = " ",
      EnumMember = " ",
      Constant = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",
    } 

    local cmp = require'cmp'

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({'/', "?" }, {
      sources = {
        { name = 'buffer' }
      }
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
    })
  '';
}
