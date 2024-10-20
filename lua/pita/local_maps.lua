local map = vim.keymap.set

--stuff
map("n", "<C-h>", "<cmd>TmuxNavigateRight <CR>", { desc = "switch window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateLeft<CR>", { desc = "switch window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "switch window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp <CR>", { desc = "switch window up" })


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
map('t', '<Esc>', [[<C-\><C-n>]])

map("v", "J", ":m '>+1<CR>gv=gv") --normal vim stuff
map("v", "K", ":m '>-2<CR>gv=gv", { silent = true })
map("n", "<C-d>", "zz")
map("n", "<C-f>", ":<C-f>")
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
