local api = vim.api
local buf, win


function create_float()
  buf = api.nvim_create_buf(false, true)
  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")

  local win_height = 1
  local win_width = width - 4
  local row = 34
  local col = 1000

  local opts = {
    style = "minimal",
    relative = "editor",
    width = 60,
    height = 1,
    row = row,
    col = col,
    border = "single",
  }

  win = api.nvim_open_win(buf, true, opts)
  api.nvim_win_set_option(win, 'winhighlight', 'NormalFloat:CmdLineNormal,FloatBorder:Accent')
  api.nvim_buf_set_name(buf, "UniqueFloatingCmdLineName")
  api.nvim_win_set_option(win, 'winblend', 0)

  api.nvim_buf_set_option(buf, 'buftype', 'prompt')
  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  vim.fn.prompt_setprompt(buf, ':')

  api.nvim_set_option('winhighlight', 'Normal:FloatCmdline')
  vim.fn.prompt_setcallback(buf, execute_command)

  -- Set up tab completion
  api.nvim_buf_set_keymap(buf, 'i', '<Tab>', '<C-x><C-v>', { noremap = true, silent = true })
  api.nvim_buf_set_keymap(buf, 'i', '<S-Tab>', '<C-p>', { noremap = true, silent = true })

  -- Set <C-c> to close the floating command line
end

function execute_command(text)
  close_floating_cmdline()
  vim.schedule(function()
    pcall(vim.cmd, text)
  end)
end

function close_floating_cmdline()
  if win and api.nvim_win_is_valid(win) then
    api.nvim_win_close(win, true)
  end
  win = nil
  buf = nil
end

function show_floating_cmdline()
  if win and api.nvim_win_is_valid(win) then
    close_floating_cmdline()
  end
  create_float()
  vim.cmd('startinsert!')
end

vim.api.nvim_set_keymap('n', ':', '<cmd>lua show_floating_cmdline()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Esc>', '<cmd>lua close_floating_cmdline()<CR>', { noremap = true, silent = true })
