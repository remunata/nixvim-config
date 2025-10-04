{
  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>/";
      action.__raw = ''
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end
      '';
      options.desc = "Fuzzily search in current buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>sf";
      action = "<cmd>Telescope find_files<CR>";
      options.desc = "Find project files";
    }
    {
      mode = [ "n" ];
      key = "<leader>sF";
      action.__raw = ''
        function()
          return require('telescope.builtin').find_files {
            find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
          }
        end
      '';
      options.desc = "Search hidden files";
    }
    {
      mode = [ "n" ];
      key = "<leader>s/";
      action = "<cmd>Telescope live_grep<CR>";
      options.desc = "Live grep (root dir)";
    }
    {
      mode = [ "n" ];
      key = "<leader>ss";
      action.__raw = ''
        function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          }
        end
      '';
      options.desc = "Live grep (open files)";
    }
    {
      mode = [ "n" ];
      key = "<leader>sb";
      action = "<cmd>Telescope buffers<CR>";
      options.desc = "Find active buffers";
    }
    {
      mode = [ "n" ];
      key = "<leader>se";
      action = "<cmd>Telescope file_browser<CR>";
      options.desc = "Telescope file browser";
    }
    {
      mode = [ "n" ];
      key = "<leader>sc";
      action = "<cmd>Telescope command_history<CR>";
      options.desc = "Find command history";
    }
    {
      mode = [ "n" ];
      key = "<leader>sr";
      action = "<cmd>Telescope resume<CR>";
      options.desc = "Resume search";
    }
    {
      mode = [ "n" ];
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics<CR>";
      options.desc = "Search diagnostics";
    }
    {
      mode = [ "n" ];
      key = "<leader>sh";
      action = "<cmd>Telescope help_tags<CR>";
      options.desc = "Search help";
    }
    {
      mode = [ "n" ];
      key = "<leader>gs";
      action = "<cmd>Telescope git_status<CR>";
      options.desc = "Find git status";
    }
    {
      mode = [ "n" ];
      key = "<leader>gc";
      action = "<cmd>Telescope git_commits<CR>";
      options.desc = "Find git commits";
    }
  ];
}
