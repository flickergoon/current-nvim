return {
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
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
  },
  {
    "ellisonleao/gruvbox.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("gruvbox").setup({})
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
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "nvim-lua/plenary.nvim",
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
    config = function ()
    return require("plugin.plugin_opts.mini")
    end
     },
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy",
    opts = {},
  }
}
