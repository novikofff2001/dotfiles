-- change leader on ' '
vim.g.mapleader = " "

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('v', '<leader>cf', ":'<,'>!clang-format --style=file:" .. vim.fn.getcwd() .. "/.clang-format<CR>", { noremap = true })
