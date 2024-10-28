return {
  {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
    event = "VimEnter",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        overrides = {

          --custom stuff
          Accent = { bg = "NONE", fg = "#83a598" },
          --[[
          --┌────────────────────────────────────────────────────┐
          --│ some accent colors i like to use as my accent color│
          --│ right now its onlt used for the nvim cmp but i will│
          --│ implement it into other color groups               │
          --└────────────────────────────────────────────────────┘
          --
          --#fabd2f yellow
          --#b8bb26 green
          --#fb4934 red
          --#ebdbb2 white
          --#fe8019 orange
          --#b16286 pink
          --#8f3f71 purple
          --#689d6a aqua
          --#7c6f64 gray
          --]]
          --vim stuff
          ModeMsg                   = { fg = "#7c6f64" },
          NormalFloat               = { bg = "#1E2021" },

          --lsp
          DiagnosticSignHint        = { link = "DiagnosticHint" },
          DiagnosticSignWarn        = { link = "DiagnosticWarn" },
          DiagnosticSignInfo        = { link = "DiagnosticInfo" },
          DiagnosticSignError       = { link = "DiagnosticError" },

          --cursorline
          CursorLineNr              = { bg = "#1d2021", fg = "#bdae93" },
          CursorLine                = { bg = "#32302f" },
          SignColumn                = { bg = "bg" },

          --lazy
          LazyButton                = { bg = "#202020" },
          LazyNormal                = { bg = "#202020" },
          LazyH1                    = { bg = "#3c3836", fg = "#928374" },
          LazySpecial               = { link = "Accent" },
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
          CmpDocs                   = { bg = "bg" },
          CmpItemAbbr               = { fg = "#d5c4a1" },
          CmpItemAbbrMatch          = { link = "Accent" },
          CmpItemAbbrMatchFuzzy     = { fg = "#83a598", bg = "NONE" },
          CmpItemKindUnit           = { link = "Accent" },
          CmpItemKindProperty       = { link = "Accent" },
          CmpItemKindKeyword        = { link = "Accent" },
          CmpItemKindMethod         = { link = "Accent" },
          CmpItemKindFunction       = { link = "Accent" },
          CmpItemKindText           = { link = "Accent" },
          CmpItemKindInterface      = { link = "Accent" },
          CmpItemKindVariable       = { link = "Accent" },
          CmpItemKindField          = { link = "Accent" },
          CmpItemKindSnippet        = { link = "Accent" },
          CmpItemAbbrDeprecated     = { bg = "NONE", strikethrough = true, fg = "#3c3836" },
          cmpItemKIndEnum           = { link = "Accent" },
          cmpItemKIndStruct         = { link = "Accent" },
          cmpItemKIndClass          = { link = "Accent" },

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

          --telescope
          TelescopeNormal           = { bg = "#202020" },
          TelescopeBorder           = { fg = "#928374", bg = "NONE" },
          TelescopePromptNormal     = { bg = "#ffffff", fg = "#ffffff" },
          TelescopePromptPrefix     = { link = "Accent" },

          --minipick
          MiniPickBorder            = { fg = "#7c6f64", bg = "#202020" },
          MiniPickPrompt            = { fg = "#fbf1c7", bg = "#202020" },
          MiniPickNormal            = { bg = "#202020" },
          MiniPickBorderText        = { fg = "#7c6f64", bg = "#202020" },
          MiniPickMatchRanges       = { fg = "#ffffff" },
        },
      })
      vim.cmd([[colorscheme gruvbox]])
    end,
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
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "iguanacucumber/mag-nvim-lsp",       name = "cmp-nvim-lsp", opts = {} },
      { "iguanacucumber/mag-nvim-lua",       name = "cmp-nvim-lua" },
      { "iguanacucumber/mag-buffer",         name = "cmp-buffer" },
      { "lukas-reineke/cmp-under-comparator" },
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          return require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "doxnit/cmp-luasnip-choice",
        config = function()
          require("cmp_luasnip_choice").setup({
            auto_open = true,
          })
        end,
      },
    },
    config = function()
      return require("plugin.plugin_opts.cmp")
    end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    event = { "BufReadPost" },
    opts = {
    },
  },
}
