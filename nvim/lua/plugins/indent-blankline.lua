return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function(_, opts)
      require("ibl").setup(opts)
      vim.opt.colorcolumn = "80,90"
    end,
  },
}
