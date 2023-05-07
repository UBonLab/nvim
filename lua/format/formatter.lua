local formatter = require "formatter"

formatter.setup({
  filetype = {
    go = {
      function ()
        return {
          exe = "gofumpt"
        }
      end,
    },
    lua = {
      function ()
        return {
          exe = "stylua",
          args = {
            "-",
          },
          stdin = true,
        }
      end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
          stdin = true,
        }
      end,
    },
  }
})

-- format on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
augroup END
]],
  true
)
