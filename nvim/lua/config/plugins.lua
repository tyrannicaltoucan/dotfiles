local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
      "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
    })
    print "Packer has been installed! Fetching plugins..."
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local packer = require("packer")

packer.init {
  compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lua/plenary.nvim"

  use {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd [[colorscheme kanagawa]]
    end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugin.lualine")
    end
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("plugin.telescope")
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugin.lspconfig")
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
    config = function()
      require("plugin.cmp")
    end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugin.indent-blankline")
    end
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugin.gitsigns")
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("plugin.treesitter")
    end,
  }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }

  if packer_bootstrap then
    packer.sync()
  end
end)
