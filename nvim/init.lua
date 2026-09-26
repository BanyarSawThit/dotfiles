require("config.lazy")
vim.g.user42 = 'bsaw'
vim.g.mail42 = 'marvin@42.fr'

local opt   = vim.opt
local hl    = vim.api.nvim_set_hl
local set   = vim.keymap.set

-- Editor perferences
opt.termguicolors   = true
opt.number          = true
opt.relativenumber  = true
opt.wildmenu        = true
opt.splitbelow      = true
opt.splitright      = true

-- Indentation
opt.autoindent      = true
opt.smartindent     = true
opt.tabstop         = 4
opt.shiftwidth      = 4
opt.expandtab       = false

opt.swapfile        = false

-- Folding (required by nvim-ufo)
opt.foldcolumn      = '1'
opt.foldlevel       = 99
opt.foldlevelstart  = 99
opt.foldenable      = true

-- Theme
vim.cmd('syntax on')
vim.cmd('colorscheme vim')

-- Highlight settings
hl(0, "Pmenu",          { bg = "#2d3139", fg = "#ffffff" })
hl(0, "PmenuSel",       { bg = "#4f5b66", fg = "#ffffff", bold = true })
hl(0, "SpecialChar",    { fg = "#00E5FF", bold = true })
hl(0, "Function",       { fg = "#c8a5e7", bold = true })

--- Fold highlights
hl(0, "Folded",         { bg = "#2d3139", fg = "#c0c0c0", bold = true })
hl(0, "FoldColumn",     { bg = "NONE",    fg = "#6A9CF8" })

vim.g.mapleader = ' '

set('i', '{<CR>', '{<CR>}<Esc>O')
set('i', '<C-j>', '<Esc>:w<CR>')
set('n', '<C-j>', ':w<CR>')
set('n', '<C-q>', ':q<CR>')

set('i', '<C-h>', '<BS>')
set('i', '<C-f>', '<Right>')
set('i', '<C-b>', '<Left>')

set('n', '<F5>', ':w<CR>:!norminette ft_*.c *.h<CR>')
set('n', '<F6>', ':!cc -Wall -Wextra -Werror -I libft main.c libftprintf.a && ./a.out && rm a.out<CR>')

set('n', '<leader>s', ':w<CR>')
set('n', '<leader>q', ':q<CR>')

set('n', '<leader>t', ':term<CR>')
set('n', '<leader>v', ':vsplit<CR>')
set('n', '<leader>h', ':split<CR>')

set('n', '<C-h>', '<C-w>h')
set('n', '<C-l>', '<C-w>l')
set('n', '<C-i>', '<C-w>k')
set('n', '<C-k>', '<C-w>j')
