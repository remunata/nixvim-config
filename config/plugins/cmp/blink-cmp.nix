{ pkgs, ... }:
{
  plugins.blink-cmp = {
    enable = true;

    settings = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = false;
          };
        };

        documentation = {
          auto_show = true;
          auto_show_delay_ms = 200;

          window = {
            border = "rounded";
          };
        };

        ghost_text = {
          enabled = true;
        };

        list = {
          selection = {
            auto_insert = true;
            preselect = true;
          };
        };

        trigger = {
          show_on_accept_on_trigger_character = true;
          show_on_keyword = true;
          show_on_trigger_character = true;
        };
      };

      fuzzy = {
        implementation = "rust";

        prebuilt_binaries = {
          download = false;
          force_version = "v${pkgs.vimPlugins.blink-cmp.version}";
        };
      };

      snippets = {
        preset = "luasnip";
      };

      signature = {
        enabled = true;

        window = {
          border = "rounded";
        };
      };

      sources = {
        default = [
          "buffer"
          "lsp"
          "path"
          "snippets"
        ];

        providers = {
          buffer = {
            name = "Buffer";
            module = "blink.cmp.sources.buffer";
            score_offset = 0;
          };

          lsp = {
            name = "LSP";
            module = "blink.cmp.sources.lsp";
            async = false;
            enabled = true;
            max_items = null;
            min_keyword_length = 0;
            override = null;
            score_offset = 4;
            should_show_items = true;
            timeout_ms = 2000;

            fallbacks = [
              "buffer"
            ];
          };

          path = {
            name = "Path";
            module = "blink.cmp.sources.path";
            score_offset = 0;

            fallbacks = [
              "buffer"
            ];

            opts = {
              label_trailing_slash = true;
              show_hidden_files_by_default = false;
              trailing_slash = false;
            };
          };
        };
      };
    };
  };
}
