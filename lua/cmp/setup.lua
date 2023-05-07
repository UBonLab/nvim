local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    {
      name = "luasnip",
      group_index = 1,
    },
    {
      name = "nvim_lsp",
      group_index = 1,
    },
    {
      name = "nvim_lsp_signature_help",
      group_index = 1,
    },
    {
      name = "buffer",
      group_index = 2,
    },
    {
      name = "path",
      group_index = 2,
    },
  }),

  -- 使用lspkind-nvim显示类型图标
  formatting = require("cmp.lspkind").formatting,
})


cmp.setup.filetype({ "markdown", "help" }, {
  sources = { {
    name = "luasnip",
  }, {
    name = "buffer",
  }, {
    name = "path",
  } },
})

--Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore.
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' }
  })
})

require("cmp.luasnip")
