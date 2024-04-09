return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
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
    {
       "folke/which-key.nvim",
       event = "VeryLazy",
       config = true,
       init = function()
           vim.o.timeout = true
           vim.o.timeoutlen = 300
       end,
   },

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
}

