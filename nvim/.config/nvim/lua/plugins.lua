local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(
function(use)
  use {
    "wbthomason/packer.nvim"
  }

  --- COLORSCHEMES ---
  use {
    "EdenEast/nightfox.nvim"
  }

  -- use {
  --   "rebelot/kanagawa.nvim"
  -- }

  --- GIT ---
  use {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    config = function ()
      require "plugins.nv_gitsigns"
    end,
  }

  use {
    "tpope/vim-fugitive",
    cmd = "G",
  }

  --- COMMENTS ---
  use {
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
    config = function ()
      require "plugins.nv_comment"
    end,
  }

  --- CORE PLUGINS ---
  use {
    "nathom/filetype.nvim"
  }

  use {
    "AndrewRadev/tagalong.vim",
    after = "nvim-lsp-installer"
  }

  use {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    ft = "json",
    config = function()
      require('package-info').setup()
    end
  }

  use {
    "ggandor/lightspeed.nvim",
    after = "nvim-treesitter",
  }

  use {
    "goolord/alpha-nvim",
    config = function ()
      require("plugins.nv_alpha")
    end
  }

  use {
    "ThePrimeagen/harpoon",
    after = "nvim-treesitter",
  }

  use {
    "nvim-lualine/lualine.nvim",
    after = "nvim-treesitter",
    config = function ()
      require "plugins.nv_lualine"
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    after = "nvim-treesitter",
    config = function ()
      require "plugins.nv_blankline"
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function ()
      require "plugins.nv_tree"
    end,
  }

  use {
    "kyazdani42/nvim-web-devicons",
    config = function ()
      require "plugins.nv_devicons"
    end
  }

  use {
    "LionC/nest.nvim",
  }

  use {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function ()
      require "plugins.nv_outline"
    end
  }

  --- TREESITTER ---
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "VimEnter",
    config = function ()
      require "plugins.nv_treesitter"
    end,
    requires = {
      {
        "nvim-treesitter/nvim-treesitter-refactor",
        after = "nvim-treesitter",
        opt = true,
      },
      {
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter",
        opt = true,
      },
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        after = "nvim-treesitter",
        opt = true,
      }
    },
  }

  --- TELESCOPE ---
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function ()
      require "plugins.nv_telescope"
    end,
    requires = {
      {
        "nvim-lua/plenary.nvim",
      },
      {
        "nvim-lua/popup.nvim",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
    }
  }

  --- COMPLETION ---
  use {
    "hrsh7th/nvim-cmp",
    module = "cmp_nvim_lsp",
    config = function ()
      require "plugins.nv_cmp"
    end,
    requires = {
      {
        "hrsh7th/cmp-nvim-lsp",
        after = "nvim-cmp",
        opt = true,
      },
      {
        "hrsh7th/cmp-path",
        after = "nvim-cmp",
        opt = true,
      },
      {
        "windwp/nvim-autopairs",
        opt = true,
        after = "nvim-cmp",
        module = "nvim-autopairs.completion.cmp",
        config = function ()
          require "plugins.nv_autopairs"
        end,
      },
      {
        "dcampos/nvim-snippy",
        opt = true,
        after = "nvim-cmp",
        config = function ()
          require "plugins.nv_snippy"
        end,
        requires = {
          "dcampos/cmp-snippy",
          after = "nvim-snippy",
        },
      },
    },
  }

  use {
    "honza/vim-snippets",
    after = "nvim-snippy",
  }

  --- LSP ---
  use {
    "williamboman/nvim-lsp-installer",
    event = "VimEnter",
  }

  use {
    "neovim/nvim-lspconfig",
    after = "nvim-lsp-installer",
    config = function ()
      require "plugins.nv_lspconfig"
    end,
  }

  use {
    "akinsho/nvim-toggleterm.lua",
    after = "nvim-treesitter",
    config = function ()
      require "plugins.nv_toggleterm"
    end
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lsp-installer",
    module = "null-ls",
  }

  use {
    "akinsho/flutter-tools.nvim",
    after = "nvim-lsp-installer",
    config = function ()
      require("flutter-tools").setup{}
    end
  }

  use {
    "windwp/lsp-fastaction.nvim",
    after = "nvim-lsp-installer",
    config = function ()
      require "plugins.nv_lspfastaction"
    end
  }

  if Packer_bootstrap then
    require("packer").sync()
  end
end
)
