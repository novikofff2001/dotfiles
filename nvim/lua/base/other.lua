-- Vertical splits appear on the right
vim.opt.splitright = true

-- Horizontal splits appear below
vim.opt.splitbelow = true

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Disable adding newline at end of file
vim.opt.fixeol = false

-- Autocompletion settings
vim.opt.completeopt = 'menuone,noselect'

-- Do not auto-comment new lines
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Show line numbers
vim.opt.number = true

-- Highlight current line
vim.opt.cursorline = true

-- Enable true colors
vim.opt.termguicolors = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- UTF-8 encoding
vim.opt.encoding = 'utf-8'

-- Disable swap files
vim.opt.swapfile = false

-- Highlight column at 80 chars
vim.opt.colorcolumn = "80"
