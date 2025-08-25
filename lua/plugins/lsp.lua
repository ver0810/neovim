-- LSP Configuration
-- Language Server Protocol setup with Mason for automatic installation

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neoconf.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    -- Define LSP servers and their configurations
    local servers = {
      -- Lua
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      },
      
      -- Python
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      
      -- Rust
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      },
      
      -- Web development
      html = {},
      cssls = {},
      ts_ls = {},
      
      -- C/C++
      clangd = {},
      
      -- Python linting
      ruff = {},
    }

    -- Configure keybindings when LSP attaches to buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        local opts = { buffer = event.buf }
        
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Navigation
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        -- Code actions
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
        
        -- Workspace management
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        -- Formatting
        vim.keymap.set("n", "<leader>cf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })

    -- Setup neoconf BEFORE configuring LSP servers
    require("neoconf").setup()
    require("neodev").setup()

    -- Setup Mason for LSP server installation
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Setup Mason-LSPconfig
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true,
    })

    -- Configure each LSP server
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    for server, config in pairs(servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, config))
    end
  end,
}
