## My neovim config

plugin list:

+ lspconfig

+ mini.nvim

+ nvchad(ui and base46)

+ clangd extensions

+ vim-tmux-navigator

+ nvim-treesitter(the plugin itself and textobject )

+ nvim-cmp (with some of the sources i like and lua-snip choice which is very nice)

+ harpoon2

+ vim fugitive







## lspconfig

lua_ls: with inlay hints
clangd: with no cutsom options of my own
gopls: no custom options

- lsp on attach mapppings

  leader is set to space

  gr: vim.lsp.buf.references

  gd: vim.lsp.buf.definition

  <leader>bg: vim.lsp.buf.format

  gi: vim.lsp.buf.implementation

  <leader>D: vim.lsp.buf.type_definition

  <leader>w: vim.lsp.buf.rename

  <leader>ca: vim.lsp.buf.code_action

  gD: vim.lsp.buf.declaration

  <leader>th: toggle inlay hints



## mini.nvim
 - mini.pick:
  the only change i made is that to go up and down the list you use C-j and C-k

 - mini.indentspoce
  defaults - mini.fuzzy defaults

 - mini.notify
  defaults

- mini.splitjoin
  the toggle mapping in <leader>m



## harppon
 - mapppings
  <leader>a: mark the file you are lsp on
  <leader>f: open the gui

  the rest is just defaults



## nvim-cmp
  - list of sources
  "amarakon/nvim-cmp-buffer-lines",
  "hrsh7th/cmp-nvim-lsp",
  "ray-x/cmp-treesitter",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "onsails/lspkind.nvim",
  "L3MON4D3/LuaSnip" (and luasnip choise which places you cursor in the "choice" location)



## vim-tmux-navigator
  just defaults



## clangd extensions
  i just enabled inlay hints

## vim-fugitive
  defaults



## nvim-treesitter
 - optsions
  indenting is enabled
  and highlight is enabled

  incremental selection mapping:

   init_selection = "<leader>is",

 - textobject

  mappings:

   ["af"] = "@function.outer"

   ["if"] = "@function.inner"

   ["ac"] = "@class.outer"

   ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" }

   ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" }

