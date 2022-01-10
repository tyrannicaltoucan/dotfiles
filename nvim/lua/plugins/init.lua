local fn = vim.fn
local cmd = vim.cmd

local path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', path, '--depth=1' })
    cmd('packadd packer.nvim')
end

local packer = require('packer')
packer.init {
    compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'single' }
        end
    }
}

return packer.startup(
    function()
        use { 'wbthomason/packer.nvim' }
        use { 'tpope/vim-commentary' }
        use { 'tpope/vim-surround' }

        use {
            'kvrohit/substrata.nvim',
            config = function()
                vim.cmd('colorscheme substrata')
            end
        }

        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/popup.nvim',
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-fzy-native.nvim'
            },
            config = function()
                require('plugins.telescope')
            end
        }

        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('plugins.indent_blankline')
            end
        }

        use {
            'lewis6991/gitsigns.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('plugins.gitsigns')
            end
        }

        use { 
            'neovim/nvim-lspconfig',
            config = function()
                require('plugins.lspconfig')
            end
        }

        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-nvim-lsp',
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
            },
            config = function()
                require('plugins.cmp')
            end
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require('plugins.treesitter')
            end
        }
    end
)
