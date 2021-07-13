--- PACKER PLUGINS MANAGEMENT ---
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require("packer").startup(function (use)
  --- PACKER ---
  use {
    "wbthomason/packer.nvim"
  }

  --- COLORSCHEMES ---
  use {
    "RRethy/nvim-base16"
  }

  --- GIT ---
  use {
    "lewis6991/gitsigns.nvim",
    config = function () require "plugins.nv-gitsigns" end,
  }
  use {
    "tpope/vim-fugitive"
  }

  --- COMMENTS ---
  use {
    "terrortylor/nvim-comment",
    config = function () require "plugins.nv-comment" end,
  }

  --- CORE PLUGINS ---
  use {
    "hoob3rt/lualine.nvim",
    config = function () require "plugins.nv-lualine" end,
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function () require "plugins.nv-blankline" end,
  }
  use {
    "kyazdani42/nvim-tree.lua",
    config = function () require "plugins.nv-tree" end,
  }
  use {
    "alvarosevilla95/luatab.nvim",
    config = function () require "plugins.nv-luatab" end,
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
    config = function () require "plugins.nv-treesitter" end,
    run = ":TSUpdate",
  }
  use {
    "windwp/nvim-autopairs",
    config = function () require "plugins.nv-autopairs" end,
  }
  use {
    "windwp/nvim-ts-autotag"
  }

  --- STARTIFY ---
  use {
    "mhinz/vim-startify"
  }

  --- TELESCOPE ---
  use {
    "nvim-telescope/telescope.nvim",
    config = function () require "plugins.nv-telescope" end,
    requires = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope-fzy-native.nvim"},
    }
  }

  --- LSP ---
  use {
    "hrsh7th/vim-vsnip",
    config = function () require "plugins.nv-vsnip" end,
  }
  use {
    "hrsh7th/nvim-compe",
    config = function () require "plugins.nv-compe" end,
  }
  use {
    "neovim/nvim-lspconfig",
    config = function () require "plugins.lsp" end,
  }
  use {
    "kabouzeid/nvim-lspinstall"
  }
  use {
    "RishabhRD/nvim-lsputils",
    requires = "RishabhRD/popfix",
  }
end)
