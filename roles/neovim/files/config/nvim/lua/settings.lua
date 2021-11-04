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

-- Colorscheme
opt.termguicolors = true
cmd [[colorscheme PaperColor]]
