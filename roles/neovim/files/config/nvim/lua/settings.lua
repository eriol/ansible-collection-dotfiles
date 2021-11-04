local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = [[,]]
g.maplocalleader = [[,]]

opt.mouse = 'a'

-- UI

opt.colorcolumn = '80'
opt.list = true
opt.listchars = { eol = '¬', nbsp='␣', tab = '▸ ', trail = '·' }
opt.showbreak = '↪'
opt.signcolumn = 'yes'

-- Tabs

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4

-- Colorscheme

opt.termguicolors = true
cmd [[colorscheme PaperColor]]
