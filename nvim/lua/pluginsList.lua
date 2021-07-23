local present, _ = pcall(require, "packerInit")
local packer

if present then
  packer = require "packer"
else
  return false
end

return packer.startup(
  function (use)
    --- PACKER ---
    use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
    }

    --- COLORSCHEMES ---
    use {
      "RRethy/nvim-base16"
    }

    --- GIT ---
    use {
      "lewis6991/gitsigns.nvim",
      config = function ()
        require "plugins.nv-gitsigns"
      end,
    }

    use {
      "tpope/vim-fugitive"
    }

    --- COMMENTS ---
    use {
      "terrortylor/nvim-comment",
      cmd = "CommentToggle",
      config = function ()
        require "plugins.nv-comment"
      end,
    }

    --- CORE PLUGINS ---
    use {
      "ojroques/nvim-hardline",
      config = function ()
        require "plugins.nv-hardline"
      end
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function ()
        require "plugins.nv-blankline"
      end,
    }

    use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function ()
        require "plugins.nv-tree"
      end,
    }

    use {
      "kyazdani42/nvim-web-devicons"
    }

    --- TREESITTER ---
    use {
      "nvim-treesitter/nvim-treesitter",
      config = function ()
        require "plugins.nv-treesitter"
      end,
    }

    use {
      "windwp/nvim-autopairs",
      after = "nvim-compe",
      config = function ()
        require "plugins.nv-autopairs"
      end,
    }

    use {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
    }

    --- TELESCOPE ---
    use {
      "nvim-telescope/telescope.nvim",
      config = function ()
        require "plugins.nv-telescope"
      end,
      requires = {
        {
          "nvim-lua/plenary.nvim",
        },
        {
          "nvim-lua/popup.nvim",
        },
      }
    }

    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    }

    --- COMPLETION ---
    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function ()
        require "plugins.nv-compe"
      end,
      wants = "LuaSnip",
      requires = {
        {
          "L3MON4D3/LuaSnip",
          wants = "friendly-snippets",
          event = "InsertCharPre",
          config = function ()
            require "plugins.nv-luasnip"
          end
        },
        {
          "rafamadriz/friendly-snippets",
          event = "InsertCharPre",
        }
      }
    }

    use {
      "kabouzeid/nvim-lspinstall",
    }

    use {
      "neovim/nvim-lspconfig",
      config = function ()
        require "plugins.nv-lspconfig"
      end,
    }

    use {
      "RishabhRD/nvim-lsputils",
      config = function ()
        require "plugins.nv-lsputils"
      end,
      requires = {
        "RishabhRD/popfix",
      },
    }
  end
)
