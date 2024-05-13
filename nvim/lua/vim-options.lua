vim.g.mapleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")

vim.cmd("set scrolloff=5")

-- Turn of sounds
vim.cmd("set noeb")
vim.cmd("set novb")
vim.cmd("set belloff=all")

-- Navigations
vim.keymap.set('n', '<TAB>', 'gt')
vim.keymap.set('n', '<S-TAB>', 'gT')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

