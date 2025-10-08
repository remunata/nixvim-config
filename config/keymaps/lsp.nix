{
  keymaps = [
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      options.desc = "Code actions";
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
    }
    {
      mode = "n";
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      options.desc = "Goto definition";
    }
  ];
}
