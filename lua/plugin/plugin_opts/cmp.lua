
vim.api.nvim_command('highlight CmpItemMenuBuffer guifg=#504945')
vim.api.nvim_command('highlight CmpItemMenuNvimLsp guifg=#504945')
vim.api.nvim_command('highlight CmpItemMenuLuasnip guifg=#504945')
vim.api.nvim_command('highlight CmpItemMenuNvimLua guifg=#504945')
vim.api.nvim_command('highlight CmpItemMenuLatexSymbols guifg=#504945')
vim.api.nvim_command('highlight CmpItemMenuTreesitter guifg=#504945')
vim.api.nvim_command('highlight CmpItemMenuFish guifg=#504945')


local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:CmpNormal",
      scrollbar = false
    },
    documentation = {
      winhighlight = "Normal:CmpNormal",
      scrollbar = false,
    }
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-k>"] = cmp.mapping(function(fallback)
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
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
  }),
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = 'luasnip_choice' },
    { name = "nvim_lsp" },
    { name = 'fish' },
    { name = "buffer" },
  }),

  formatting = {
    fields = { "menu", "abbr", "kind" },
    format = function(entry, vim_item)
      -- Kind icons

      -- Source
      local menu_text, hl_group
      if entry.source.name == 'buffer' then
        menu_text = "[BFR]"
        hl_group = "CmpItemMenuBuffer"
      elseif entry.source.name == 'nvim_lsp' then
        menu_text = "[LSP]"
        hl_group = "CmpItemMenuNvimLsp"
      elseif entry.source.name == 'luasnip' then
        menu_text = "[SNP]"
        hl_group = "CmpItemMenuLuasnip"
      elseif entry.source.name == 'nvim_lua' then
        menu_text = "[LUA]"
        hl_group = "CmpItemMenuNvimLua"
      elseif entry.source.name == 'latex_symbols' then
        menu_text = "[LTX]"
        hl_group = "CmpItemMenuLatexSymbols"
      elseif entry.source.name == 'treesitter' then
        menu_text = "[TS]"
        hl_group = "CmpItemMenuTreesitter"
      elseif entry.source.name == 'fish' then
        menu_text = "[FSH]"
        hl_group = "CmpItemMenuFish"
      else
        menu_text = "[" .. entry.source.name .. "]"
        hl_group = "Normal"
      end

      vim_item.menu = menu_text
      vim_item.menu_hl_group = hl_group

      return vim_item
    end
  },


  -- formatting = {
  --   fields = { "menu", "abbr", "kind" },
  --   format = function(entry, vim_item)
  --     -- Kind icons
  --     vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
  --     -- Source
  --     vim_item.menu = ({
  --       buffer = "[BFR]",
  --       nvim_lsp = "[LSP]",
  --       luasnip = "[SNP]",
  --       nvim_lua = "[LUA]",
  --       latex_symbols = "[LTX]",
  --       treesitter = "[TS]",
  --       fish = "[FSH]"
  --     })[entry.source.name]
  --     return vim_item
  --   end
  -- },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require("clangd_extensions.cmp_scores"),
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})
