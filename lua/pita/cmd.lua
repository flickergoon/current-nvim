local autocmd = vim.api.nvim_create_autocmd

autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("FilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name("FilePost")

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.opt_local.fillchars:append({ eob = " " })
  end,
})

vim.defer_fn(function()
  vim.cmd([[
    highlight SignColumn guibg=NONE ctermbg=NONE
    ]])
end, 100)
---custom commands

vim.api.nvim_create_user_command("Sync", "Lazy sync", {
  desc = "Lazy [S]ync",
})
vim.api.nvim_create_user_command("Themes", "lua require('nvchad.themes').open()", {
  desc = "Lazy [S]ync",
})


vim.api.nvim_create_user_command("LintInfo", function()
  local lint = require("lint")
  local filetype = vim.bo.filetype
  local linters = lint.linters_by_ft[filetype] or {}

  local info = "Linters for " .. filetype .. ":\n"
  if #linters > 0 then
    for _, linter in ipairs(linters) do
      info = info .. "- " .. linter .. "\n"
    end
  else
    info = info .. "No linters configured."
  end

  vim.api.nvim_echo({ { info, "Normal" } }, false, {})
end, {})

--just stright up stole this from kickstart.nvim
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   desc = "Highlight when yanking (copying) text",
--   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "Accent",  -- Replace with your desired highlight group
      timeout = 200
    })
  end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '<buffer>',
      callback = function()
        local curpos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, curpos)
      end,
    })
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '<buffer>',
      callback = function()
        local curpos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, curpos)
      end,
    })
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.o.cursorline = true
    vim.o.cursorlineopt = "both"
  end
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPre', 'FileReadPre', 'StdinReadPre',
  'VimResized', 'TermOpen', 'CursorMoved', 'InsertEnter' }, {
  callback = function()
    vim.cmd("set colorcolumn=80")
  end
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zig",
  callback = function()
    print("Zig file detected")
    -- You can add more debug information here
  end
})

