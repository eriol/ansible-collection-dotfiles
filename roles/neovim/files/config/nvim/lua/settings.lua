local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = [[,]]
g.maplocalleader = [[,]]

opt.mouse = 'a'

--------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------

opt.colorcolumn = '80'
opt.list = true
opt.listchars = { eol = '¬', nbsp='␣', tab = '▸ ', trail = '·' }
opt.showbreak = '↪'
opt.signcolumn = 'yes'

-- Resize splits on windows size changes
cmd [[
augroup ResizeSplits
    autocmd!
    autocmd VimResized * exe "normal! \<c-w>="
augroup END
]]

--------------------------------------------------------------------------------
-- Tabs
--------------------------------------------------------------------------------

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4

--------------------------------------------------------------------------------
-- Performance
--------------------------------------------------------------------------------

opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 250

--------------------------------------------------------------------------------
-- Colorscheme
--------------------------------------------------------------------------------

opt.termguicolors = true
cmd [[colorscheme PaperColor]]
