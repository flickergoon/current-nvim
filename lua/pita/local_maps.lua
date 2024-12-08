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
map('n', '<leader>nt', '<CMD>new<CR><CMD>terminal<CR><CMD>resize 12<CR>')

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
-- Copy to system clipboard
map('v', 'gy', '"+y', { noremap = true, silent = true })
map('n', 'gy', '"+yy', { noremap = true, silent = true })



map("n", "<leader>ex", "<cmd>Ex<CR>", { silent = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<leader>ds", vim.diagnostic.setloclist)
map("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
map("n", "K", vim.lsp.buf.hover, { buffer = 0 })
map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
map("n", "<leader>rn", vim.lsp.buf.rename)
