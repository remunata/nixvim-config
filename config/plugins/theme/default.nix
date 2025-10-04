let
  colors = import ./colors/radium.nix;
in
{
  colorschemes.base16 = {
    enable = true;
    setUpBar = false;
    colorscheme = colors;
    settings = {
      cmp = true;
      indentblankline = true;
      lsp_semantic = true;
      mini_completion = true;
      telescope = true;
      telescope_borders = false;
      notify = true;
      bufferline = true;
    };
  };
}
