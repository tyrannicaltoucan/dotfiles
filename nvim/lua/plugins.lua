local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Installing packer...")
    packer_bootstrap = vim.fn.system({
        "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim", install_path
    })
    vim.cmd("packadd packer.nvim")
end

local install_packages = function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "kyazdani42/nvim-web-devicons"

    use {
        "windwp/nvim-autopairs",
        config = [[require("nvim-autopairs").setup()]]
    }

    use {
        "numToStr/Comment.nvim",
        config = [[require("Comment").setup()]]
    }

    use {
        "rebelot/kanagawa.nvim",
        config = [[vim.cmd("colorscheme kanagawa")]]
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = [[require("config.indent-blankline")]]
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = [[require("config.treesitter")]]
    }

    use {
        "neovim/nvim-lspconfig",
        config = [[require("config.lspconfig")]]
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = [[require("config.cmp")]]
    }

    use {
        "lewis6991/gitsigns.nvim",
        config = [[require("config.gitsigns")]]
    }

    use {
        "nvim-lualine/lualine.nvim",
        config = [[require("config.lualine")]]
    }

    use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        requires = { "nvim-telescope/telescope-fzy-native.nvim" },
        config = [[require("config.telescope")]]
    }
end

local packer = require("packer")
return packer.startup({
    function(use)
        install_packages(use)
        if packer_bootstrap then
            packer.sync()
        end
    end,
    config = {
        compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end
        }
    },
})
