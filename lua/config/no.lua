return {
  defaults = { lazy = true },

  ui = {
    icons = {
      ft = "ft | ",
      lazy = "Lazy | ",
      loaded = "loaded | ",
      not_loaded = "Not loaded | ",
        },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        { "netrw", "netrwPlugin", "netrwSettings", cmd = "Ex" },
        "logipat",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
