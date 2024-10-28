local map = vim.keymap.set

--stuff
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('t', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('t', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('t', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('t', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('t', '<Esc>', [[<C-\><C-n>]])

--mini stuff
-- map("n", "<leader>o", "<cmd>Pick grep_live<CR>", { silent = true, desc = "Grep Live" })
-- map("n", "<leader>bb", "<cmd>Pick buffers<CR>", { silent = true, desc = "Buffer Buffers" })
-- map("n", "<leader>ff", "<cmd>Pick files<CR>", { silent = true, desc = "Find Files" })
-- map("n", "<leader>cd", "<cmd>Pick files<CR>", { silent = true, desc = "Find Files" })
-- map("n", "<leader>ht", "<cmd>Pick help<CR>", { silent = true, desc = "Help Tags" })
-- map("n", "<leader>gb", "<cmd>Pick git_branches <CR>", { silent = true, desc = "Help Tags" })
-- map("n", "<leader>gc", "<cmd>Pick git_commits<CR>", { silent = true, desc = "Git Commits" })
-- map("n", "<leader>gf", "<cmd>Pick git_files<CR>", { silent = true, desc = "Git Files" })
-- map("n","<leader>xx", "<cmd>Pick diagnostic<CR>", { silent = true, desc = "LSP Diagnostic" })

--normal vim stuff
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv", { silent = true })
map("n", "<C-d>", "zz")
map("n", "<C-c>", ":cclose<CR>")
-- Copy to system clipboard
vim.keymap.set('v', 'gy', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', 'gy', '"+yy', { noremap = true, silent = true })



map("n", "<leader>ex", "<cmd>Ex<CR>", { silent = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })

local function lsp_rename()
  local curr_name = vim.fn.expand("<cword>")
  local bufnr = vim.api.nvim_get_current_buf()

  require('fzf-lua').fzf_exec({ curr_name }, {
    prompt = "New name > ",
    actions = {
      ['default'] = function(selected)
        local new_name = selected[1]
        vim.lsp.buf.rename(new_name)
      end
    }
  })
end
