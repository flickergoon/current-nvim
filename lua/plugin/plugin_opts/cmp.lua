local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {},
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = 'treesitter' },
  }),
  -- formatting = {
  --   format = lspkind.cmp_format({
  --     mode = 'symbol_text',
  --     maxwidth = 50,
  --     ellipsis_char = '...',
  --     menu = {
  --       Struct = "[󰙅 Struct]",
  --       Operator = "[󰆕 Operator]",
  --       event = "[ Event]",
  --       folder = "[󰉋 Folder]",
  --       Function = "[󰊕 function]",
  --       Method = "[󰆧 Method]",
  --       Variable = "[󰀫 Variable]",
  --       Constant = "[󰏿 Const]",
  --       field = "[󰜢 Field]",
  --     },
  --   }),
  -- },

  formatting = {
    fields = { "abbr", "kind", "menu" },
    expandable_indicator = true,
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })

      -- Custom source names
      vim_item.menu = ({
        nvim_lsp = "「LS」",
        buffer = "「BF」",
        path = "「PA」",
        luasnip = "「SN」",
        Codeium = "「AI」",
        treesitter = "「TS」",
      })[entry.source.name] or "   "

      -- Custom completion item kind names
      -- Variable = "[󰀫]",
      local custom_kind_names = {
        Struct = "[󰙅]",
        event = "[]",
        Function = "[󰊕]",
        Method = "[󰆧]",
        Variable = '[]',
        Constant = "[󰏿]",
        Constructor = '[]',
        field = "[󰜢]",
        Text = '[]',
        String = "[]",
        Comment = "[]",
        Class = '[]',
        Interface = '[]',
        Module = '[]',
        Unit = '[]',
        Property = '[]',
        Value = '[]',
        Enum = '[ ]',
        Keyword = '[]',
        Snippet = '[]',
        Color = '[]',
        File = '[]',
        Reference = '[]',
        Folder = '[ ]',
        EnumMember = '[]',
        Field = '  ',
        Event = '[]',
        Operator = '[]',
        TypeParameter = '[]',
        -- Add more customizations as needed
      }

      -- Combine menu and kind
      local kind_name = custom_kind_names[strings[1]] or strings[1] or " "
      kind.kind = string.format("%s  %s ", vim_item.menu, kind_name)

      -- Keep the detailed description in the menu
      kind.menu = "" .. (" " or " ") .. " "

      return kind
    end,
  },
})
