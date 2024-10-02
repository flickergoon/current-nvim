local map = vim.keymap.set

--mini stuff
map("n", "<leader>o", "<cmd>Pick grep_live<CR>", { silent = true })
map("n", "<leader>bb", "<cmd>Pick buffers<CR>", { silent = true })
map("n", "<leader>df", "<cmd>Pick files<CR>", { silent = true })
map("n", "<leader>ht", "<cmd>Pick help<CR>", { silent = true })


map("n", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv", { silent = true })
map("n", "<C-d>", "zz")


map("n", "<leader>ex", "<cmd>Ex<CR>", { silent = true })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
