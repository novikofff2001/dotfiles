-- ~/.config/nvim/lua/plugins/git-conflict.lua
return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = function()
    require("git-conflict").setup()
  end,
}
