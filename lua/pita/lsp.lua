-- local capabilities = require('cmp_nvim_lsp').default_capabilities()


vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    vim.keymap.set("n", "<leader>th", function()
      vim.lsp.inlay_hint(0, nil)
    end, { desc = "Toggle Inlay Hints" })

    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
    map("gr", vim.lsp.buf.references, "[G]oto [R]eferences ")
    map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    map("<leader>bf", vim.lsp.buf.format, "[F]ormat [B]uffer")



    map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    map("<leader>w", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
        end,
      })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "i " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
vim.diagnostic.config({
  virtual_text = {
    source = "always", -- Or "if_many"
  },
  float = {
    source = "always", -- Or "if_many"
  },
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  diagnostics = { globals = { "vim", "bit", "jit", "utf8" } },
  root_dir = vim.fs.dirname(vim.fs.find({ ".luarc.json", ".git" }, { upward = true })[1]),
  Lua = {
    workspace = { checkThridParty = false },
    telemtry = { enable = false },
    hint = { enable = true },
  }
})
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "-j=12",
    "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    "--clang-tidy",
    "--clang-tidy-checks=*",
    "--all-scopes-completion",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
    "--pch-storage=memory",
  },
})
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- lspconfig.csharp_ls.setup({ capabilities = capabilities })
-- lspconfig.gopls.setup({ capabilities = capabilities })
-- lspconfig.hls.setup({ capabilities = capabilities })
-- lspconfig.nixd.setup({ capabilities = capabilities })
-- lspconfig.zls.setup({ capabilities = capabilities })


lspconfig.csharp_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.hls.setup({})
lspconfig.nixd.setup({})
lspconfig.zls.setup({})




--formating

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'nix',
  callback = function()
    vim.keymap.set("n", "<C-f>", "<CMD>silent !nixfmt %<CR>", { silent = true })
  end,
})
