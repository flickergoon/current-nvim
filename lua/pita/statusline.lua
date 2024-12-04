
local M = {}

function M.mode_indicator()
    local mode_map = {
        n = { 'NORMAL', 'ModeNormal' },
        i = { 'INSERT', 'ModeInsert' },
        v = { 'VISUAL', 'ModeVisual' },
        [''] = { 'V-BLOCK', 'ModeVisual' },
        V = { 'V-LINE', 'ModeVisual' },
        c = { 'COMMAND', 'ModeCommand' },
        R = { 'REPLACE', 'ModeReplace' },
        ['r'] = { 'REPLACE', 'ModeReplace' },
        ['r?'] = { 'REPLACE', 'ModeReplace' },
        ['!'] = { 'SHELL', 'ModeNormal' },
        ['no'] = { 'PENDING', 'ModeReplace' }, -- Operator-pending mode
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
        mode_info[2], -- Use the mode's highlight group for everything
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

local git_branch_cache = ""
local last_git_check = 0

function M.get_git_branch()
    local current_time = vim.fn.reltimefloat(vim.fn.reltime())
    if current_time - last_git_check > 5 then -- Check every 5 seconds
        local branch = vim.fn.system("git branch 2>/dev/null | sed -n '/\\* /s///p'")
        branch = branch:gsub("\n", "") -- Remove newline
        git_branch_cache = branch ~= "" and branch .. " " or ""
        last_git_check = current_time
    end
    return git_branch_cache
end

function M.set_statusline()
    return table.concat({
    '%#GruvboxBg0#',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    '%{%v:lua.require("pita.statusline").mode_indicator()%}', -- Mode indicator with color
    '%#StatusLine#',
    -- '%#StatusLine_Column#',
    '  %c', -- Line, column, and percentage
    -- '%*',
    -- '%<',     -- Truncation point
    -- '%#StatusLine_FileName#',
    -- '',
    ' ',
    ' %f', -- File name
    -- '',
    ' ',
    -- '%*',
    '%h%m%r%=', -- File status flags and align right
    -- '%#StatusLine_WordChars#',
    '%#StatusLine#',
    -- ' ',
    -- ' ',
    '%#ScrollBar#',                     -- Start ScrollBar highlight
    '%{%v:lua.require("pita.statusline").scrollbar_indicator()%}', -- Scrollbar indicator
    '%#StatusLine#',
    -- '%#statusLine#',                    -- End ScrollBar highlight
    -- '%#StatusLine_WordChars#',
    '  %{%v:lua.require("pita.statusline").word_count()%}',        -- Word and character count
    -- '',
    ' ',
    '%#GruvboxBg0#',
    ' ',
    ' ',
    '%#StatusLine_GitStatus#',
    -- ' ',
    -- '  ',
    '  %{%v:lua.require("pita.statusline").get_git_branch()%} ', -- Git branch
    -- '',
    '%#GruvboxBg0#',
    ' ',
    ' ',
    ' ',
    ' ',
    }, '')
end

return M
