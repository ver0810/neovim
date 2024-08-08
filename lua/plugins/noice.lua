-- noice.nvim
return{
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp

            },

            message = {
                -- Messages shown by lsp servers
                enabled = true,
                view = 'notify',
                opts = {},
            },

            -- defaults for hover and signature help
            documentation = {
                opts = {
                    size = {max_width=80,max_height=10,},
                    position = {relative='cursor',},
                },
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
    },
}
