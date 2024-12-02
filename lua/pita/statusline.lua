-- First, define your scrollbar_indicator function
function _G.scrollbar_indicator()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  local chars = { '▇▇', '▇▇', '▆▆', '▅▅', '▄▄', '▃▃', '▂▂', '▁▁' } -- '██',
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

function _G.word_count()
  local wc = vim.fn.wordcount()
  return string.format("%d words, %d chars", wc.words, wc.chars)
end

vim.o.statusline = table.concat({
  '%c  ',                           -- Line, column, and percentage
  '%<',                             -- Truncation point
  '[%f]',                             -- File name
  '%h%m%r%=',                       -- File status flags and align right
  '%#ScrollBar#',                   -- Start ScrollBar highlight
  '%{v:lua.scrollbar_indicator()}', -- Scrollbar indicator
  '%*',                             -- End ScrollBar highlight
  '  %{v:lua.word_count()}',        -- Word and character count
}, '')
