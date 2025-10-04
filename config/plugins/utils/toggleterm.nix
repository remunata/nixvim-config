{
  plugins.toggleterm = {
    enable = true;
    settings = {
      size.__raw = ''
        function(term)
          if term.direction == "horizontal" then
            return 25
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.45
          end
        end
      '';
      open_mapping = "[[<C-\\>]]";
    };
  };
}
