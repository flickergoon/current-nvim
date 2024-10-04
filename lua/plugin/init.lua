return {
  {
    "NvChad/base46",
    lazy = true,
  },
  {
    "pita092/ui",
    config = function()
      require("nvchad")
    end,
  },
  {
    "NvChad/volt",
  },
  { "nvchad/menu", lazy = true },
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
    "yioneko/nvim-cmp",
    event = "InsertEnter",
    branch = "perf-up",
    dependencies = {
      "mtoohey31/cmp-fish",
      "amarakon/nvim-cmp-buffer-lines",
      "hrsh7th/cmp-nvim-lsp",
      "ray-x/cmp-treesitter",
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
      require('mini.extra').setup()
      require("mini.indentscope").setup()
      require("mini.notify").setup()
      require("mini.fuzzy").setup()
      require("mini.splitjoin").setup({ mappings = { toggle = "<leader>m" } })
      require("mini.pick").setup({
        mappings = {
          caret_left = "<Left>",
          caret_right = "<Right>",

          choose = "<CR>",
          choose_in_split = "<C-s>",
          choose_in_tabpage = "<C-t>",
          choose_in_vsplit = "<C-v>",
          choose_marked = "<M-CR>",

          delete_char = "<BS>",
          delete_char_right = "<Del>",
          delete_left = "<C-u>",
          delete_word = "<C-w>",

          mark = "<C-x>",
          mark_all = "<C-a>",

          move_down = "<C-j>",
          move_start = "<C-g>",
          move_up = "<C-k>",
          paste = "<C-r>",
          refine = "<C-Space>",
          refine_marked = "<M-Space>",

          scroll_down = "<C-f>",
          scroll_left = "<C-h>",
          scroll_right = "<C-l>",
          scroll_up = "<C-b>",

          stop = "<Esc>",

          toggle_info = "<S-Tab>",
          toggle_preview = "<Tab>",
        },

        -- General options
        options = {
          content_from_bottom = true,

          -- Whether to cache matches (more speed and memory on repeated prompts)
          use_cache = true,
        },

        source = {

          items = nil,
          name = nil,
          cwd = nil,

          match = nil,
          show = nil,
          preview = nil,

          choose = nil,
          choose_marked = nil,
        },
        window = {
          prompt_cursor = "|",
          prompt_prefix = "~ ",
        },
      })
    end,
  },
  {
    {
      "tpope/vim-fugitive",
      event = "VeryLazy",
    },
    {
      "lewis6991/gitsigns.nvim",
      event = "User FilePost"
    },
  }

