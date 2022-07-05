local _ = vim.cmd [[packadd packer.nvim]]

local _ = vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup END
]]

require("packer").init { max_jobs = 50 }

return require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "navarasu/onedark.nvim"
  use "nvim-lualine/lualine.nvim"
  -- use "kassio/neoterm"
  -- use "kyazdani42/nvim-web-devicons"
  use "airblade/vim-gitgutter"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use "tpope/vim-git"
  use "tpope/vim-markdown"
  use "justinmk/vim-syntax-extra"
  use "mattn/emmet-vim"
  use "neovim/nvim-lspconfig"
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- "saadparwaiz1/cmp_luasnip",
    },
  }
  use "jose-elias-alvarez/null-ls.nvim"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "weilbith/nvim-code-action-menu"
  use "kosayoda/nvim-lightbulb"
  use { "rust-lang/rust.vim", ft = { "rust" } }
  use "pangloss/vim-javascript"
  use "mxw/vim-jsx"
  use "jparise/vim-graphql"
  use "robbles/logstash.vim"
  use "cespare/vim-toml"
  use "xolox/vim-misc"
  use { "tpope/vim-bundler", ft = { "ruby" } }
  -- use { "tpope/vim-rails", ft = { "ruby" } }
  use { "tpope/vim-rake", ft = { "ruby" } }
  use { "tpope/vim-rbenv", ft = { "ruby" } }
  use { "vim-ruby/vim-ruby", ft = { "ruby" } }
  use "coderifous/textobj-word-column.vim"
  use "ntpeters/vim-better-whitespace"
  use "Shougo/neopairs.vim"
  use "godlygeek/tabular"
  use "mattn/webapi-vim"
  use "sjl/gundo.vim"
  use "tpope/vim-abolish"
  use "tpope/vim-commentary"
  use "tpope/vim-dispatch"
  use "tpope/vim-endwise"
  use "tpope/vim-eunuch"
  use "tpope/vim-projectionist"
  use "tpope/vim-repeat"
  use "tpope/vim-sleuth"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use "tpope/vim-rsi"
  use "vim-scripts/AnsiEsc.vim"
  use "bkad/CamelCaseMotion"
  use "vim-scripts/lastpos.vim"
  -- use "xolox/vim-easytags"
  use "editorconfig/editorconfig-vim"
  use { "Shougo/vimproc.vim", run = "make" }
  use "Shougo/neomru.vim"
  use "zhaocai/GoldenView.Vim"

  -- Telescope stuff
  use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope-packer.nvim"

  use "tpope/vim-jdaddy"
  -- use "mhinz/vim-startify"
  use {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "ianks.startup"
    end,
  }
  use "janko-m/vim-test"
  use "machakann/vim-highlightedyank"
  use { "hashivim/vim-terraform", ft = { "terraform" } }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
    requires = { "tami5/sqlite.lua" },
  }
end)
