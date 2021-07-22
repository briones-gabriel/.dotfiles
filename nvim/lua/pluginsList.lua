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
      after = "plenary.nvim",
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
      "hoob3rt/lualine.nvim",
      config = function ()
        require "plugins.nv-lualine"
      end,
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
      "alvarosevilla95/luatab.nvim",
      config = function ()
        require "plugins.nv-luatab"
      end,
    }

    use {
      "kyazdani42/nvim-web-devicons"
    }

    use {
      "tjdevries/astronauta.nvim"
    }

    --- TREESITTER ---
    use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
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
      "windwp/nvim-ts-autotag"
    }

    --- TELESCOPE ---
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      config = function ()
        require "plugins.nv-telescope"
      end,
      requires = {
        {
          "nvim-lua/popup.nvim",
          after = "plenary.nvim",
        },
        {
          "nvim-lua/plenary.nvim",
          event = "BufRead",
        },
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make",
          cmd = "Telescope",
        },
      }
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
      "neovim/nvim-lspconfig",
      after = "nvim-lspinstall",
      config = function ()
        require "plugins.lsp"
      end,
    }

    use {
      "kabouzeid/nvim-lspinstall",
      event = "BufRead",
    }

    use {
      "RishabhRD/nvim-lsputils",
      config = function ()
        require "plugins.nv-lsputils"
      end,
      requires = {
        "RishabhRD/popfix"
      },
    }
  end
)
