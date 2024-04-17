return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require('illuminate').configure()
        end
    },
    {"nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup({
                opts = {
                    theme = 'auto'
                }
            })
        end
    },
    {"nvim-tree/nvim-web-devicons"},
    {
        "utilyre/barbecue.nvim",
        config = function ()
            require('barbecue').setup({
                theme = 'auto'
            })
        end
    },
    {"SmiteshP/nvim-navic"},
}

