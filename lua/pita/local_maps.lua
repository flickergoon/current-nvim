local map = vim.keymap.set

--mini stuff
map("n", "<leader>o", "<cmd>Pick grep_live<CR>", { silent = true, desc = "Grep Live" })
map("n", "<leader>bb", "<cmd>Pick buffers<CR>", { silent = true, desc = "Buffer Buffers" })
map("n", "<leader>ff", "<cmd>Pick files<CR>", { silent = true, desc = "Find Files" })
map("n", "<leader>cd", "<cmd>Pick files<CR>", { silent = true, desc = "Find Files" })
map("n", "<leader>ht", "<cmd>Pick help<CR>", { silent = true, desc = "Help Tags" })
map("n", "<leader>gb", "<cmd>Pick git_branches <CR>", { silent = true, desc = "Help Tags" })
map("n", "<leader>gc", "<cmd>Pick git_commits<CR>", { silent = true, desc = "Git Commits" })
map("n", "<leader>gf", "<cmd>Pick git_files<CR>", { silent = true, desc = "Git Files" })
map("n","<leader>xx", "<cmd>Pick diagnostic<CR>", { silent = true, desc = "LSP Diagnostic" })


map("v", "J", ":m '>+1<CR>gv=gv") --normal vim stuff
map("v", "K", ":m '>-2<CR>gv=gv", { silent = true })
map("n", "<C-d>", "zz")
map("n", "<C-f>", ":<C-f>")
map("n", "<C-c>", ":cclose<CR>")
vim.keymap.set('i', '<C-j>', '<C-n>')
vim.keymap.set('i', '<C-k>', '<C-p>')
-- Copy to system clipboard
vim.keymap.set('v', 'gy', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', 'gy', '"+yy', { noremap = true, silent = true })



map("n", "<leader>ex", "<cmd>Ex<CR>", { silent = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })

--menu
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
