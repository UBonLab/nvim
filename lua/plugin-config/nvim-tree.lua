local nvim_tree = require("nvim-tree")

vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', opt)

nvim_tree.setup({
  view = {
    float = {
      enable = true,
    }
  } 
})
