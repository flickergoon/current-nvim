return {
  {
    "nvim-lua/plenary.nvim",
  },
  -- {
  --   "NvChad/base46",
  --   lazy = true,
  -- },
  -- {
  --   "pita092/ui",
  --   config = function()
  --     require("nvchad")
  --   end,
  -- },
  -- {
  --   "NvChad/volt",
  -- },
  -- { "nvchad/menu", lazy = true },
  {
    "ellisonleao/gruvbox.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        overrides = {
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

          --netrw
          netrwClassify             = { fg = "#7c6f64" },
          netrwDir                  = { fg = "#928374", gui = bold },
          netrwPlain                = { fg = "#d5c4a1" },

          --cmp
          CmpNormal                 = { bg = "#202020" },
          CmpItemAbbr               = { fg = "#d5c4a1" },
          CmpItemAbbrMatch          = { fg = "#7c6f64" },
          CmpItemAbbrMatchFuzzy     = { fg = "#7c6f64" },
          CmpItemKindUnit           = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindProperty       = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindKeyword        = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindMethod         = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindFunction       = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindText           = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindInterface      = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindVariable       = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindField          = { bg = 'NONE', fg = '#3c3836' },
          CmpItemKindSnippet        = { bg = 'NONE', fg = '#3c3836' },
          CmpItemAbbrDeprecated     = { bg = 'NONE', strikethrough = true, fg = '#3c3836' },

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
      "onsails/lspkind.nvim",
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
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local toggle_opts = {
        ui_width_ratio = 0.35,
        border = "single",
        title_pos = "center",
      }
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<leader>f", function()
        harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
      end)

      vim.keymap.set("n", "<C-1>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-2>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-3>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<C-4>", function()
        harpoon:list():select(4)
      end)
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
