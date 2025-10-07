{ lib, pkgs, ... }:
{
  plugins = {
    lsp-lines.enable = true;
    lsp-format.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        lua_ls.enable = true;
        gopls.enable = true;
        pyright.enable = true;
        jdtls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        bashls.enable = true;
        yamlls.enable = true;
        ts_ls.enable = true;
        nixd = {
          enable = true;
          settings = {
            formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            nixpkgs.expr = "import <nixpkgs> {}";
          };
        };
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
      };
    };
  };
}
