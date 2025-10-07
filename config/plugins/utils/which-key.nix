{
  plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader>s";
          desc = "Telescope";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>g";
          desc = "Git";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>t";
          desc = "Terminal";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader><leader>";
          desc = "Buffer";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>c";
          desc = "Code";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>m";
          desc = "Markdown";
          mode = "n";
        }
      ];
    };
  };
}
