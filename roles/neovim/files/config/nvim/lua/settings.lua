local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = ","
g.maplocalleader = ","

opt.mouse = "a"
opt.clipboard = "unnamedplus"

--------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------

opt.colorcolumn = "80"
opt.list = true
opt.listchars = { eol = "¬", nbsp = "␣", tab = "▸ ", trail = "·" }
opt.showbreak = "↳"
opt.signcolumn = "yes"

-- Resize splits on windows size changes.
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

--------------------------------------------------------------------------------
-- Misc
--------------------------------------------------------------------------------

-- Enable undo persistence.
opt.undofile = true
-- Enable modeline, since it uses an allowlist approach since neovim >= 0.5:
-- https://github.com/neovim/neovim/issues/2865
opt.modeline = true

-- Use italic for comments.
cmd [[ autocmd Colorscheme * highlight Comment cterm=italic term=italic gui=italic ]]
-- Use red background for extra trailing whitespaces.
cmd [[ highlight ExtraTrailingWhitespace ctermbg=red guibg=red ]]
-- This autocmd is needed to not make a colorscheme to clear my custom highlight group.
cmd [[ autocmd ColorScheme * highlight ExtraTrailingWhitespace ctermbg=red guibg=red ]]
-- Match trailing whitespace except when typing at the end of a line.
cmd [[ autocmd InsertEnter * match ExtraTrailingWhitespace /\s\+\%#\@<!$/ ]]
cmd [[ autocmd InsertLeave * match ExtraTrailingWhitespace /\s\+$/ ]]

-- No swap, backup and undo using gopass.
cmd [[ autocmd BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile ]]
-- Set filetype ruby for Vagranfile.
cmd [[ autocmd BufNewFile,BufRead [vV]agrantfile set filetype=ruby ]]
-- Set filetype scss for sass files: at least it's not all the same color.
cmd [[ autocmd BufNewFile,BufRead {*.sass} set filetype=scss ]]
-- Set filetype yaml for .yamllint.
cmd [[ autocmd BufNewFile,BufRead \.yamllint set filetype=yaml ]]
