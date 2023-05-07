local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

packer.startup({
function(use)
  use 'wbthomason/packer.nvim'

  use { "catppuccin/nvim", as = "catppuccin" }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("plugin-config.nvim-tree")
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('plugin-config.telescope')
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('plugin-config.lualine')
    end
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugin-config.bufferline')
    end
  }

  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('plugin-config.dashboard')
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    config = function()
      require('plugin-config.nvim-treesitter')
    end
  }

  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      run = ":MasonUpdate", -- :MasonUpdate updates registry contents
  }

  -- Lua增强
  use 'folke/neodev.nvim'
  -- 补全引擎
  use 'hrsh7th/nvim-cmp'
  -- 补全源
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  use("hrsh7th/cmp-path") -- { name = 'path' }
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  use("hrsh7th/cmp-nvim-lsp-signature-help")

  -- snippet引擎
  use {
    	"L3MON4D3/LuaSnip",
      -- follow latest release.
      tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!:).
      run = "make install_jsregexp"
  }

  -- ui
  use 'onsails/lspkind-nvim'
  use 'mhartington/formatter.nvim'

   -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
  config = {
    max_jobs = 16,
    git = {},
    display = {
      open_fn = function()
        return require('packer.util').float( {border = 'single'} )
      end,
    },
  },
})
