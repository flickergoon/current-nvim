return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        overrides = {
          --lsp
          DiagnosticSignHint        = { link = "DiagnosticHint" },
          DiagnosticSignWarn        = { link = "DiagnosticWarn" },
          DiagnosticSignInfo        = { link = "DiagnosticInfo" },
          DiagnosticSignError       = { link = "DiagnosticError" },

          --cursorline
          CursorLineNr              = { bg = "#282828", fg = "#bdae93" },
          CursorLine                = { bg = "#32302f" },

          --lazy
          LazyButton                = { bg = "#202020" },
          LazyNormal                = { bg = "#202020" },
          LazyH1                    = { bg = "#3c3836", fg = "#928374" },
          LazySpecial               = { fg = "#7c6f64" },
          LazyReasonEvent           = { fg = "#3c3836" },
          LazyReasonSource          = { fg = "#3c3836" },
          LazyReasonRequire         = { fg = "#3c3836" },
          LazyReasonPlugin          = { fg = "#3c3836" },
          LazyReasonCmd             = { fg = "#fbf1c7" },
          LazyReasonRuntime         = { fg = "#3c3836" },
          LazyReasonStart           = { fg = "#3c3836" },
          LazyReasonImport          = { fg = "#3c3836" },
          LazyProp                  = { fg = "#fbf1c7" },
          LazyCommit                = { fg = "#d5c4a1" },
          LazyCommitType            = { fg = "#32302f" },
          LazyDimmed                = { fg = "#32302f" },

          --netrw
          netrwClassify             = { fg = "#7c6f64" },
          netrwDir                  = { fg = "#928374", gui = bold },
          netrwPlain                = { fg = "#d5c4a1" },

          --cmp
          CmpNormal                 = { bg = "#202020" },
          CmpItemAbbr               = { fg = "#d5c4a1" },
          CmpItemAbbrMatch          = { fg = "#7c6f64" },
          CmpItemAbbrMatchFuzzy     = { fg = "#7c6f64" },
          CmpItemKindUnit           = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindProperty       = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindKeyword        = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindMethod         = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindFunction       = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindText           = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindInterface      = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindVariable       = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindField          = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemKindSnippet        = { bg = 'NONE', fg = '#f2e5bc' },
          CmpItemAbbrDeprecated     = { bg = 'NONE', strikethrough = true, fg = '#3c3836' },
          cmpItemKIndEnum           = { bg = 'NONE', fg = '#f2e5bc' },
          cmpItemKIndStruct         = { bg = 'NONE', fg = '#f2e5bc' },
          cmpItemKIndClass          = { bg = 'NONE', fg = '#f2e5bc' },

          --ministatusline
          MiniStatuslineModeVisual  = { bg = "#3c3836", fg = "#928374" },
          MiniStatuslineModeReplace = { bg = "#3c3836", fg = "#928374" },
          MiniStatuslineModeInsert  = { bg = "#3c3836", fg = "#928374" },
          MiniStatuslineModeCommand = { bg = "#3c3836", fg = "#928374" },
          MiniStatuslineModeNormal  = { bg = "#3c3836", fg = "#928374" },
          MiniStatuslineModeOther   = { bg = "#202020", fg = "#928374" },
          MiniStatuslineDevinfo     = { bg = "#202020", fg = "#928374" },
          MiniStatuslineFileinfo    = { bg = "#202020", fg = "#928374" },
          MiniStatuslineFilename    = { bg = "#202020", fg = "#928374" },
        },
      })
      vim.cmd([[colorscheme gruvbox]])
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
  },
  {
    "p00f/clangd_extensions.nvim",
    event = "BufReadPost",
    opts = {
      inlay_hints = {
        highlight = "@comment",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      return require("plugin.plugin_opts.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "mtoohey31/cmp-fish",
      "amarakon/nvim-cmp-buffer-lines",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        'doxnit/cmp-luasnip-choice',
        config = function()
          require('cmp_luasnip_choice').setup({
            auto_open = true,
          });
        end,
      },
    },
    config = function()
      return require("plugin.plugin_opts.cmp")
    end,
  },
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      return require("plugin.plugin_opts.mini")
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require 'colorizer'.setup()
    end
  },
}
