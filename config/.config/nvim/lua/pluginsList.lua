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
      "EdenEast/nightfox.nvim"
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
      "akinsho/bufferline.nvim",
      event = "VimEnter",
      config = function ()
        require "plugins.nv-bufferline"
      end,
    }

    use {
      "hoob3rt/lualine.nvim",
      event = "BufRead",
      requires = {
        {
          "kyazdani42/nvim-web-devicons",
          opt = true,
        },
        {
          "SmiteshP/nvim-gps",
          module = "nvim-gps",
          opt = true
        },
      },
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
      "kyazdani42/nvim-web-devicons",
    }

    use {
      "beauwilliams/focus.nvim",
      event = "BufRead",
      config = function ()
        require("focus").setup({
          excluded_filetypes = { "toggleterm" },
          excluded_buftypes = { "help", "prompt", "nofile" },
          compatible_filetrees = { "nvimtree" },
          treewidth = 30,
          signcolumn = false,
          number = true,
          relativenumber = true,
          cursorline = false,
        })
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
      requires = {
        {
          "nvim-treesitter/nvim-treesitter-refactor",
          event = "BufRead",
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

    use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function ()
        require "plugins.nv-autopairs"
      end,
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
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      module = {"cmp_nvim_lsp", "nvim-autopairs.completion.cmp"},
      config = function ()
        require "plugins.nv-cmp"
      end,
      requires = {
        {
          "hrsh7th/cmp-buffer",
          after = "nvim-cmp",
        },
        {
          "hrsh7th/cmp-nvim-lsp",
          after = "nvim-cmp",
        },
        {
          "hrsh7th/cmp-path",
          after = "nvim-cmp",
        },
        {
          "jose-elias-alvarez/minsnip.nvim",
          module = "minsnip",
          after = "nvim-cmp",
          config = function ()
            require "plugins.nv-minsnip"
          end
        },
      },
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
