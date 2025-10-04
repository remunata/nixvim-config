{
  autoGroups = {
    highlight_yank = { };
  };

  autoCmd = [
    # Set terminal padding color when enter noevim
    {
      event = [
        "UIEnter"
        "ColorScheme"
      ];
      callback.__raw = ''
        function()
          local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
          if not normal.bg then return end
          io.write(string.format("\027]11;#%06x\027\\", normal.bg))
        end
      '';
    }
    # Set terminal padding color when exiting neovim
    {
      event = [ "UILeave" ];
      callback.__raw = ''
        function()
          io.write("\027]111\027\\")
        end
      '';

    }
    {
      group = "highlight_yank";
      event = [ "TextYankPost" ];
      pattern = "*";
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];
}
