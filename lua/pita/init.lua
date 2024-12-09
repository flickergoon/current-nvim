require("pita.opts")
require("pita.auto_cmd")
require("pita.local_maps")
require("pita.lsp")
require("pita.start_msg")
require('pita.statusline').setup({
  padding = 32,
  separator = {
    enabled = false,
    separator = "|",
  },
  git = {
    enabled = true,
    icon = "|\\",
  },
  scroll = {
    enabled = true,
  },
  words = {
    enabled = true,
  },
  mode = {
    enabled = true,
  },
  filename = {
    enabled = true,
    path_type = "tail",
  },
})


require("pita.cmdline")
