return {

    -- bufferline
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = true,
    },

    -- indent-blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },

    -- gitsigns-nvim
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
    

    -- alpha-nvim
    {
        "goolord/alpha-nvim",
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },


    -- vim-illuminate
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require('illuminate').configure()
        end
    },

    -- lualine.nvim
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup({
                opts = {
                    theme = 'auto'
                }
            })
        end
    },


    -- nvim-web-devicons
    { "nvim-tree/nvim-web-devicons" },


    -- barbecue.nvim
    {
        "utilyre/barbecue.nvim",
        config = function()
            require('barbecue').setup({
                theme = 'auto'
            })
        end
    },

    -- nvim-navic
    { "SmiteshP/nvim-navic" },

    --better vim.ui
    {
        'stevearc/dressing.nvim',
        opts = {},
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
}

