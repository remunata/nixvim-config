{
  plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
    nixvimInjections = true;
  };

  plugins.treesitter-textobjects.enable = true;
  plugins.treesitter-context.enable = true;
}
