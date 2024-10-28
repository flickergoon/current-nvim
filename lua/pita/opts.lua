local opt = vim.opt
local o = vim.o
local g = vim.g
local s = vim.schedule

-- s(function()
--   opt.clipboard = "unnamedplus"
-- end)


--Opts
opt.breakindent = true
opt.smartindent = true
opt.autoindent = true
opt.indentexpr = "nvim_treesitter#indent()"
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 50
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 10
opt.inccommand = "split"
opt.whichwrap:append("<>[]hl")
opt.hlsearch = false
opt.incsearch = true
opt.relativenumber = true
opt.number = true
opt.mouse = "a"
opt.showmode = true
opt.ls=0
opt.fillchars = { eob = " " }



--Os
o.showtabline = 0
o.expandtab = true
o.termguicolors = true
o.pumblend  = 0
o.pumheight = 30
o.winblend  = 0





--Ss


--Gs
g.have_nerd_font = false
g.codeium_manual = true
g.codeium_no_map_tab = true
g.codeium_enabled = true
g.have_nerd_font = false
g.cursorword_enabled = false
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25




--too lazy to switch from vim.cmd
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--neovide

if g.neovide then
  g.neovide_padding_top = 0
  g.neovide_padding_bottom = 0
  g.neovide_padding_right = 0
  g.neovide_padding_left = 0
  g.neovide_confirm_quit = true
end


--idont remember what this dose
--i remember
--if i am in windows it sets mason to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
