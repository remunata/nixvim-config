{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };

      notify_on_error = true;

      formatters_by_ft = {
        "_" = [ "trim-whitespace" ];
        lua = [ "stylua" ];
        go = [ "gofumpt" ];
        rust = [ "rustfmt" ];
        java = [ "google-java-format" ];
        bash = [ "shfmt" ];
        php = [ "php-cs-fixer" ];
        python = [
          "isort"
          "black"
        ];
        javascript = [ "prettierd" ];
        typescript = [ "prettierd" ];
        html = [ "prettierd" ];
        css = [ "prettierd" ];
      };
    };
  };
}
