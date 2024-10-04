local M = {}

M.base46 = {
  theme = "gruvbox",
  hl_override = {
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
  mason = { cmd = true, pkgs = {} },
  tabufline = {
    enabled = false,
  },
}

return M

