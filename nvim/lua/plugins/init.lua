local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
end

local packer = require("packer")

packer.init {
    compile_path = install_path .. "/plugin/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end
    }
}

return packer.startup(function()
    -- General plugins

    use { "wbthomason/packer.nvim" }
    use { "tpope/vim-commentary" }
    use { "tpope/vim-surround" }

    use {
        "eddyekofo94/gruvbox-flat.nvim",
        -- "mhartington/oceanic-next",
        config = function()
            vim.g.gruvbox_italic_keywords = false
            vim.cmd([[colorscheme gruvbox-flat]])
            -- vim.cmd([[colorscheme OceanicNext]])
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim"
        },
        config = function()
            require("plugins.telescope")
        end
    }


    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("plugins.indent_blankline")
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.gitsigns")
        end
    }

    -- Development plugins

    use { "neovim/nvim-lspconfig" }

    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        ft = { "bash", "c", "cpp", "python" },
        config = function()
            require("plugins.compe")
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end
    }
end)
