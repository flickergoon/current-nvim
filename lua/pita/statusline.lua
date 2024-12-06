-- local M = {}
--
-- function M.mode_indicator()
--     local mode_map = {
--         n = { 'NORMAL', 'ModeNormal' },
--         i = { 'INSERT', 'ModeInsert' },
--         v = { 'VISUAL', 'ModeVisual' },
--         [''] = { 'V-BLOCK', 'ModeVisual' },
--         V = { 'V-LINE', 'ModeVisual' },
--         c = { 'COMMAND', 'ModeCommand' },
--         R = { 'REPLACE', 'ModeReplace' },
--         ['r'] = { 'REPLACE', 'ModeReplace' },
--         ['r?'] = { 'REPLACE', 'ModeReplace' },
--         ['!'] = { 'SHELL', 'ModeNormal' },
--         ['no'] = { 'PENDING', 'ModeReplace' }, -- Operator-pending mode
--         t = { 'TERMINAL', 'ModeTerminal' },
--     }
--     local api_mode = vim.api.nvim_get_mode()
--     local mode = api_mode.mode
--     local mode_info = mode_map[mode] or { 'UNKNOWN', 'NormalMode' }
--     if api_mode.blocking then
--         mode_info = { 'O-PENDING', 'ModeNormal' }
--     end
--     return string.format(
--         '%%#%s#%s %s %s%%#Normal#',
--         mode_info[2], -- Use the mode's highlight group for everything
--         ' ',
--         mode_info[1],
--         ' '
--     )
-- end
--
-- function M.scrollbar_indicator()
--     local current_line = vim.fn.line('.')
--     local total_lines = vim.fn.line('$')
--     if current_line == total_lines then
--         return '  '
--     else
--         local chars = { '▇▇', '▇▇', '▆▆', '▅▅', '▄▄', '▃▃', '▂▂', '▁▁' }
--         local line_ratio = current_line / total_lines
--         local index = math.ceil(line_ratio * #chars)
--         return chars[index]
--     end
-- end
--
-- function M.word_count()
--     local wc = vim.fn.wordcount()
--     return string.format("%d words, %d chars", wc.words, wc.chars)
-- end
--
-- local git_branch_cache = ""
-- local last_git_check = 0
--
-- function M.get_git_branch()
--     local current_time = vim.fn.reltimefloat(vim.fn.reltime())
--     if current_time - last_git_check > 10 then -- Check every 5 seconds
--         local branch = vim.fn.system("git branch 2>/dev/null | sed -n '/\\* /s///p'")
--         branch = branch:gsub("\n", "") -- Remove newline
--         git_branch_cache = branch ~= "" and branch .. " " or ""
--         last_git_check = current_time
--     end
--     return git_branch_cache
-- end
--
-- function M.set_statusline()
--     return table.concat({
--     '%#GruvboxBg0#',
--     ' ',
--     ' ',
--     ' ',
--     ' ',
--     ' ',
--     ' ',
--     '%{%v:lua.require("pita.statusline").mode_indicator()%}', -- Mode indicator with color
--     '%#StatusLine#',
--     -- '%#StatusLine_Column#',
--     '  %c', -- Line, column, and percentage
--     -- '%*',
--     -- '%<',     -- Truncation point
--     -- '%#StatusLine_FileName#',
--     -- '',
--     ' ',
--     ' %f', -- File name
--     -- '',
--     ' ',
--     -- '%*',
--     '%=', -- File status flags and align right
--     -- '%#StatusLine_WordChars#',
--     '%#StatusLine#',
--     -- ' ',
--     -- ' ',
--     '%#ScrollBar#',                     -- Start ScrollBar highlight
--     '%{%v:lua.require("pita.statusline").scrollbar_indicator()%}', -- Scrollbar indicator
--     '%#StatusLine#',
--     -- '%#statusLine#',                    -- End ScrollBar highlight
--     -- '%#StatusLine_WordChars#',
--     '  %{%v:lua.require("pita.statusline").word_count()%}',        -- Word and character count
--     -- '',
--     ' ',
--     '%#GruvboxBg0#',
--     ' ',
--     ' ',
--     '%#StatusLine_GitStatus#',
--     -- ' ',
--     -- '  ',
--     '  %{%v:lua.require("pita.statusline").get_git_branch()%} ', -- Git branch
--     -- '',
--     '%#GruvboxBg0#',
--     ' ',
--     ' ',
--     ' ',
--     ' ',
--     ' ',
--     }, '')
-- end
--
-- return M

local M = {}

-- Git branch tracking variables
local current_git_branch = ''
local current_git_dir = ''
local branch_cache = {}
local active_bufnr = '0'
local sep = package.config:sub(1, 1)
local file_changed = vim.loop.new_fs_event()
local git_dir_cache = {}

function M.mode_indicator()
  local mode_map = {
    n = { 'NORMAL', 'ModeNormal' },
    i = { 'INSERT', 'ModeInsert' },
    v = { 'VISUAL', 'ModeVisual' },
    [''] = { 'V-BLOCK', 'ModeVisual' },
    V = { 'V-LINE', 'ModeVisual' },
    c = { 'COMMAND', 'ModeCommand' },
    R = { 'REPLACE', 'ModeReplace' },
    ['r'] = { 'REPLACE', 'ModeReplace' },
    ['r?'] = { 'REPLACE', 'ModeReplace' },
    ['!'] = { 'SHELL', 'ModeNormal' },
    ['no'] = { 'PENDING', 'ModeReplace' },
    t = { 'TERMINAL', 'ModeTerminal' },
  }
  local api_mode = vim.api.nvim_get_mode()
  local mode = api_mode.mode
  local mode_info = mode_map[mode] or { 'UNKNOWN', 'NormalMode' }
  if api_mode.blocking then
    mode_info = { 'O-PENDING', 'ModeNormal' }
  end
  return string.format(
    '%%#%s#%s %s %s%%#Normal#',
    mode_info[2],
    ' ',
    mode_info[1],
    ' '
  )
end

function M.scrollbar_indicator()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  if current_line == total_lines then
    return '  '
  else
    local chars = { '▇▇', '▇▇', '▆▆', '▅▅', '▄▄', '▃▃', '▂▂', '▁▁' }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end
end

function M.word_count()
  local wc = vim.fn.wordcount()
  return string.format("%d words, %d chars", wc.words, wc.chars)
end

local function get_git_head(head_file)
  local f_head = io.open(head_file)
  if f_head then
    local HEAD = f_head:read()
    f_head:close()
    local branch = HEAD:match('ref: refs/heads/(.+)$')
    if branch then
      current_git_branch = branch
    else
      current_git_branch = HEAD:sub(1, 6)
    end
  end
end

local function update_branch()
  active_bufnr = tostring(vim.api.nvim_get_current_buf())
  file_changed:stop()
  local git_dir = current_git_dir
  if git_dir and #git_dir > 0 then
    local head_file = git_dir .. sep .. 'HEAD'
    get_git_head(head_file)
    file_changed:start(
      head_file,
      {},
      vim.schedule_wrap(function()
        update_branch()
      end)
    )
  else
    current_git_branch = ''
  end
  branch_cache[vim.api.nvim_get_current_buf()] = current_git_branch
end

local function update_current_git_dir(git_dir)
  if current_git_dir ~= git_dir then
    current_git_dir = git_dir
    update_branch()
  end
end

function M.find_git_dir(dir_path)
  local git_dir = vim.env.GIT_DIR
  if git_dir then
    update_current_git_dir(git_dir)
    return git_dir
  end

  local file_dir = dir_path or vim.fn.expand('%:p:h')
  local root_dir = file_dir

  while root_dir do
    if git_dir_cache[root_dir] then
      git_dir = git_dir_cache[root_dir]
      break
    end
    local git_path = root_dir .. sep .. '.git'
    local git_file_stat = vim.loop.fs_stat(git_path)
    if git_file_stat then
      if git_file_stat.type == 'directory' then
        git_dir = git_path
      elseif git_file_stat.type == 'file' then
        local file = io.open(git_path)
        if file then
          git_dir = file:read()
          git_dir = git_dir and git_dir:match('gitdir: (.+)$')
          file:close()
        end
        if git_dir and git_dir:sub(1, 1) ~= sep and not git_dir:match('^%a:.*$') then
          git_dir = git_path:match('(.*).git') .. git_dir
        end
      end
      if git_dir then
        local head_file_stat = vim.loop.fs_stat(git_dir .. sep .. 'HEAD')
        if head_file_stat and head_file_stat.type == 'file' then
          break
        else
          git_dir = nil
        end
      end
    end
    root_dir = root_dir:match('(.*)' .. sep .. '.-')
  end

  git_dir_cache[file_dir] = git_dir
  if dir_path == nil then
    update_current_git_dir(git_dir)
  end
  return git_dir
end

function M.get_branch(bufnr)
  if vim.g.actual_curbuf ~= nil and active_bufnr ~= vim.g.actual_curbuf then
    M.find_git_dir()
  end
  if bufnr then
    return branch_cache[bufnr] or ''
  end
  return current_git_branch
end

function M.init_git_branch()
  M.find_git_dir()
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      M.find_git_dir()
    end,
  })
end

function M.set_statusline()
  return table.concat({
    '%#GruvboxBg0#',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    '%{%v:lua.require("pita.statusline").mode_indicator()%}',
    '%#StatusLine#',
    '  %c',
    ' ',
    ' %f',
    ' ',
    '%=',
    '%#StatusLine#',
    '%#ScrollBar#',
    '%{%v:lua.require("pita.statusline").scrollbar_indicator()%}',
    '%#StatusLine#',
    '  %{%v:lua.require("pita.statusline").word_count()%}',
    ' ',
    '%#GruvboxBg0#',
    ' ',
    ' ',
    '%#StatusLine_GitStatus#',
    '  ',
    M.get_branch(), -- Use the new get_branch function
    ' ',
    '%#GruvboxBg0#',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
  }, '')
end

M.init_git_branch()



return M
