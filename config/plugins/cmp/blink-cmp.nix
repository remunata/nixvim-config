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
    };

    signature = {
      enabled = true;

      window = {
        border = "rounded";
      };
    };
  };
}
