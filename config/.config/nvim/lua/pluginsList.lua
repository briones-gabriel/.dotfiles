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
      "shaunsingh/nord.nvim",
    }

    --- GIT ---
    use {
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      branch = "main",
      config = function ()
        require "plugins.nv-gitsigns"
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
      "kyazdani42/nvim-web-devicons",
      config = function ()
        require "plugins.nv-icons"
      end
    }

    --- TREESITTER ---
    use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      branch = "0.5-compat",
      config = function ()
        require "plugins.nv-treesitter"
      end,
    }

    use {
      "windwp/nvim-autopairs",
      after = "coq_nvim",
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
      cmd = "Telescope",
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
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make",
        },
      }
    }

    --- COMPLETION ---
    use {
      "ms-jpq/coq_nvim",
      run = "COQdeps",
      event = "InsertEnter",
      branch = "coq",
      config = function ()
        require "plugins.nv-coq"
        cmd "COQnow -s"
      end,
      requires = {
        {
          "ms-jpq/coq.artifacts",
          branch = "artifacts",
          after = "coq_nvim",
        },
      }
    }

    --- LSP ---
    use {
      "kabouzeid/nvim-lspinstall",
      event = "BufEnter",
    }

    use {
      "neovim/nvim-lspconfig",
      after = "nvim-lspinstall",
      config = function ()
        require "plugins.nv-lspconfig"
      end,
    }

    use {
      "glepnir/lspsaga.nvim",
      after = "nvim-lspconfig",
    }

    use {
      "mhartington/formatter.nvim",
      cmd = "Format",
      config = function ()
        require "plugins.nv-formatter"
      end
    }

    use {
      "ethanjwright/toolwindow.nvim",
      module = "toolwindow",
      requires = {
        {
          "akinsho/nvim-toggleterm.lua",
          module = "toggleterm.terminal",
        },
      },
    }
  end
)
