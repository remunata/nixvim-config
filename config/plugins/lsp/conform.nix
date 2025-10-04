{ lib, pkgs, ... }:
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
        sh = [ "shfmt" ];
        python = [
          "black"
          "isort"
        ];
        yaml = [
          "yamllint"
          "yamlfmt"
        ];
        html = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        css = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        javascript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        javascriptreact = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescriptreact = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        markdown = [
          [
            "prettierd"
            "prettier"
          ]
        ];
      };

      formatters = {
        stylua = {
          command = "${lib.getExe pkgs.stylua}";
        };
        gofumpt = {
          command = "${lib.getExe pkgs.gofumpt}";
        };
        rustfmt = {
          command = "${lib.getExe pkgs.rustfmt}";
        };
        google-java-format = {
          command = "${lib.getExe pkgs.google-java-format}";
        };
        shfmt = {
          command = "${lib.getExe pkgs.shfmt}";
        };
        black = {
          command = "${lib.getExe pkgs.black}";
        };
        isort = {
          command = "${lib.getExe pkgs.isort}";
        };
        yamllint = {
          command = "${lib.getExe pkgs.yamllint}";
        };
        yamlfmt = {
          command = "${lib.getExe pkgs.yamlfmt}";
        };
        prettierd = {
          command = "${lib.getExe pkgs.prettierd}";
        };
        prettier = {
          command = "${lib.getExe pkgs.prettier}";
        };
      };
    };
  };
}
