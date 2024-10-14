require('mini.extra').setup()
require('mini.statusline').setup({
  content = {
    active = nil,
    inactive = nil,
  },
  use_icons = false,
  set_vim_settings = true,
})
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
