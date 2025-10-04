{ lib, pkgs, ... }:
{
  plugins = {
    lsp-lines.enable = true;
    lsp-format.enable = true;
    helm.enable = true;

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
        helm_ls = {
          enable = true;
          extraOptions = {
            settings = {
              "helm_ls" = {
                yamlls = {
                  path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
                };
              };
            };
          };
        };
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                    "*docker-compose*.{yml,yaml}";
                  "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" =
                    "*flow*.{yml,yaml}";
                };
              };
            };
          };
        };
      };
    };
  };
}
