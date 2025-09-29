-- ~/.config/nvim/lua/plugins/git.lua
return {
  -- Core Git
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gstatus", "Gdiffsplit", "Gblame" },
  },

  -- Signs, hunks, blame
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "契" },
        topdelete    = { text = "契" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },
      current_line_blame = true,
      current_line_blame_opts = { delay = 300 },
    },
    keys = {
      { "]h", function() require("gitsigns").next_hunk() end, desc = "Next hunk" },
      { "[h", function() require("gitsigns").prev_hunk() end, desc = "Prev hunk" },
      { "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
      { "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
      { "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
      { "<leader>hb", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle blame" },
    },
  },

  -- Diff views
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    config = function()
      require("diffview").setup({})
    end,
    keys = {
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
    },
  },

  -- Lazygit (requires lazygit installed)
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Telescope Git pickers (optional)
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    keys = {
      { "<leader>gc", function() require("telescope.builtin").git_commits() end, desc = "Git commits" },
      { "<leader>gb", function() require("telescope.builtin").git_branches() end, desc = "Git branches" },
      { "<leader>gs", function() require("telescope.builtin").git_status() end, desc = "Git status" },
      { "<leader>gS", function() require("telescope.builtin").git_stash() end, desc = "Git stash" },
    },
  },
}
