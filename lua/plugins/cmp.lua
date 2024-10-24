return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        "hrsh7th/cmp-buffer",
        'hrsh7th/cmp-cmdline',
        {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                }
            }
        },
    },

    config = function()


        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        -- Set up nvim-cmp.
        require("luasnip.loaders.from_vscode").lazy_load()
        local luasnip = require 'luasnip'
        local cmp = require'cmp'

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        cmp.setup({

            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
      
            mapping = {
                -- ... rest of your mappings
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if #cmp.get_entries() == 1 then
                            cmp.confirm({ select = true })
                        else
                            cmp.select_next_item()
                        end
                    elseif has_words_before() then
                        cmp.complete()
                        if #cmp.get_entries() == 1 then
                            cmp.confirm({ select = true })
                        end
                    else
                        fallback()
                    end
                end, { "i", "s" }),

            },

            sources = cmp.config.sources ({
                { name = 'nvim_lsp'},
                { name = 'path' },
                { name = "supermaven"}
            },{
                { name = 'buffer'},
            }),

            window = {
                completion = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
                    col_offset = 0,
                    side_padding = 1,

                    max_width = 80,
                    max_height = 20,

                },
                documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
                    max_width = 80,
                    max_height = 20,
                },
            },

        })


        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end
}


