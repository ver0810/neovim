return {
    -- nvim-autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    -- neotree-nvim
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup()
            vim.keymap.set({"n", "v"}, "<leader>e", [[<cmd>Neotree toggle<CR>]])
        end
    },

    -- which-key.nvim
    {
       "folke/which-key.nvim",
       event = "VeryLazy",
       config = true,
       init = function()
           vim.o.timeout = true
           vim.o.timeoutlen = 300
       end,
   },

   -- markdown-preview
   {
       "iamcco/markdown-preview.nvim",
       cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
       build = "cd app && yarn install",
       init = function()
           vim.g.mkdp_filetypes = { "markdown" }
       end,
       keys = {
           {
               "<leader>cp",
               ft = "markdown",
               "<cmd>MarkdownPreviewToggle<cr>",
               desc = "Markdown Preview",
           },
       },
       ft = { "markdown" },
   },
    
   --obsidian.nvim
   {
       "epwalsh/obsidian.nvim",
       version = "*",  -- recommended, use latest release instead of latest commit
       lazy = true,
       ft = "markdown",
       dependencies = {
           "nvim-lua/plenary.nvim",
       },
       opts = {
           workspaces = {
               {
                   name = "Obsidian_Note",
                   path = "~/Code/Obsidian_Notes"
               },
           },
           completion = {
               nvim_cmp = true,
               min_char = 2,
           }
       }
   },


   -- flash.nvim
   {
       "folke/flash.nvim",
       event = "VeryLazy",
       ---@type Flash.Config
       opts = {},
       -- stylua: ignore
       keys = {
           { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
           { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
           { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
           { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
           { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
       },
   }

}

