return {
  'stevearc/conform.nvim',
  dependencies = { "mason.nvim" },
  lazy = true,
  keys = {
      { 
          "<leader>cf",
          function()
              require('conform').format({ formatters = { 'eslint', 'stylua', 'prettier' }, time_out = 1000 });
          end,
          mode = {"n", "v"},
          desc = "Format code",
      },
  },
  config = function()
      require('conform').setup({
          format_on_save = {
              typeright = true,
              eslint = true,
              python = true,
              markdown = true,
              lua = true,
          },
          formatters_by_ft = {
              lua = { 'stylua' },
              rust = { 'rustfmt' },
              typeright = {"prettier"},
              python = {"ruff"},
              cpp = {"clang-format"},
              javascript = {"prettier"},
              typescript = {"prettier"},
              markdown = {"prettier"},
              json = {"prettier"},
              yaml = {"prettier"},
              html = {"prettier"},
              css = {"prettier"},
              scss = {"prettier"},
              tailwindcss = {"prettier"},
          }
      })
  end
}
