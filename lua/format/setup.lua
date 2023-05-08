require("format.null-ls")

vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.format {async = true}")
