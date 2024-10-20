local M = {}

M.base46 = {
  theme = "gruvbox",
  hl_override = {
    CmpItemAbbrDeprecated = {
      bg = 'NONE',
      strikethrough = true,
      fg = '#928374'
    },
    CmpItemAbbrMatch = {
      bg = 'NONE',
      fg = '#458588'
    },
    CmpItemAbbrMatchFuzzy = {
      link = 'CmpIntemAbbrMatch'
    },
    CmpItemKindVariable = {
      bg = 'NONE', fg = '#83a598'
    },
    CmpItemKindInterface = {
      link = 'CmpItemKindVariable'
    },
    CmpItemKindText = {
      link = 'CmpItemKindVariable'
    },
    CmpItemKindFunction = {
      bg = 'NONE', fg = '#d3869b'
    },
    CmpItemKindMethod = {
      link = 'CmpItemKindFunction'
    },
    CmpItemKindKeyword = {
      bg = 'NONE', fg = '#fbf1c7'
    },
    CmpItemKindProperty = {
      link = 'CmpItemKindKeyword'
    },
    CmpItemKindUnit = {
      link = 'CmpItemKindKeyword'
    },
    FloatBorder = {
      bg = "#282828",
    },
    Normal = {
      bg = "#282828"
    },
    DiagnosticUnnecessary = {
      fg = "#ffffff"
    },
    LspInlayHint = {
      fg = "#ffffff",
    },
    CmpGhostText = {
      fg = "#ffffff",
    },
    TelescopeNormal = {
      bg = "#292929",
      fg = "white",
    },
    TelescopeBorder = {
      fg = "white",
      bg = "white",
    },
    TelescopePromptBorder = {
      fg = "#292929",
      bg = "white",
    },
    TelescopePromptNormal = {
      fg = "#292929",
      bold = true,
      bg = "white",
    },
    TelescopePromptTitle = {
      fg = "white",
      bg = "#292929",
    },
    TelescopePreviewTitle = {
      fg = "white",
      bg = "#292929",
    },
    TelescopeResultsTitle = {
      fg = "white",
      bg = "#292929",
    },
    TelescopePromptPrefix = {
      bg = "white",
    },
    TelescopePreviewBorder = {
      fg = "#ffffff",
    },
    ["@comment"] = { fg = "white", bold = true },
    Comment = { fg = "white", bold = true },

    LineNr = { fg = "white" },

    LspReferenceWrite = {
      bg = "#282828",
      fg = "#fabd3b",
      underline = true,
    },
    LspReferenceText = {
      bg = "#282828",
      fg = "#fabd3b",
      underline = true,
    },
    LspReferenceRead = {
      bg = "#282828",
      fg = "#fabd3b",
      underline = true,
    },
    IlluminatedWordText = {
      bg = "#282828",
      fg = "#fabd3b",
      underline = true,
    },
    IlluminatedWordRead = {
      bg = "#282828",
      fg = "#fabd3b",
      underline = true,
    },
    IlluminatedWordWrite = {
      bg = "#282828",
      fg = "#fabd3b",
      underline = true,
    },
  },

  integrations = {
    "blankline",
    "cmp",
    "git",
    -- more
  },
}
M.ui = {
  lsp = { signature = true },
  cmp = {
    icons_left = false,  -- only for non-atom styles!
    lspkind_text = true,
    style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false,  -- will work for css lsp too
      icon = "󱓻",
    },
  },


  statusline = {
    theme = "vscode",
    separator_style = "default",
    order = nil,
    modules = nil,
  },
  telescope = {
    enabled = true,
    style = "borderless",
  }, -- borderless / bordered
  mason = { cmd = false, pkgs = {} },
  tabufline = {
    enabled = false,
  },
}

return M



--harpoon


  -- {
  --   "ThePrimeagen/harpoon",
  --   event = "VeryLazy",
  --   branch = "harpoon2",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     local toggle_opts = {
  --       ui_width_ratio = 0.35,
  --       border = "single",
  --       title_pos = "center",
  --     }
  --     local harpoon = require("harpoon")
  --
  --     -- REQUIRED
  --     harpoon:setup()
  --     -- REQUIRED
  --
  --     vim.keymap.set("n", "<leader>a", function()
  --       harpoon:list():add()
  --     end)
  --     vim.keymap.set("n", "<leader>f", function()
  --       harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
  --     end)
  --
  --     vim.keymap.set("n", "<C-1>", function()
  --       harpoon:list():select(1)
  --     end)
  --     vim.keymap.set("n", "<C-2>", function()
  --       harpoon:list():select(2)
  --     end)
  --     vim.keymap.set("n", "<C-3>", function()
  --       harpoon:list():select(3)
  --     end)
  --     vim.keymap.set("n", "<C-4>", function()
  --       harpoon:list():select(4)
  --     end)
  --   end,
  -- }


--lsp kind for nvim-cmp


-- local kind_icons = {
--   Nil = "",
--   Text = "",
--   Method = "",
--   Function = "",
--   Constructor = "",
--   Field = "",
--   Variable = "",
--   Class = "",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = "",
-- }
