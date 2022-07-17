local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

local present, packer = pcall(require, 'packer')

if not present then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  use {
    'wbthomason/packer.nvim'
  }

  -- colorscheme
  use {
    'EdenEast/nightfox.nvim',
  }

  -- useful vim functions for plugins
  use {
    'nvim-lua/plenary.nvim',
  }

  -- auto-completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('setup.plugins._nvim_cmp')
    end,
    requires = {
      {
        'hrsh7th/cmp-path',
      },
      {
        'hrsh7th/cmp-buffer',
      },
      {
        'hrsh7th/cmp-nvim-lsp',
      },
      {
        'hrsh7th/cmp-nvim-lua',
      },
      {
        'L3MON4D3/LuaSnip',
        requires = {
          {
            'saadparwaiz1/cmp_luasnip',
          },
          {
            'rafamadriz/friendly-snippets',
          },
        },
      },
    }
  }

  -- language server protocol
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('setup.lsp')
    end,
    requires = {
      {
        'williamboman/nvim-lsp-installer',
      },
    },
  }

  -- syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('setup.plugins._treesitter')
    end,
    requires = {
      {
        'windwp/nvim-autopairs',
        config = function()
          require('nvim-autopairs').setup {}
        end,
      },
      {
        'windwp/nvim-ts-autotag',
      },
      {
        'nvim-treesitter/nvim-treesitter-refactor',
      },
    },
  }

  -- indentation
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        show_current_context = true,
      }
    end,
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('setup.plugins._gitsigns')
    end,
  }

  use {
    "tpope/vim-fugitive",
    cmd = "G",
  }

  -- file finder
  use {
    'nvim-telescope/telescope.nvim',
    config = function ()
      require('setup.plugins._telescope')
    end,
    tag = '0.1.0',
  }

  if Packer_bootstrap then
    require('packer').sync()
  end
end)
