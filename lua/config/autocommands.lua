-- Filetype-specific Autocommands
-- Defines custom behaviors for different file types

local api = vim.api

-- =============================================================================
-- PYTHON CONFIGURATION
-- =============================================================================

api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Set F5 to run current Python file with timing
    vim.keymap.set("n", "<F5>", function()
      vim.cmd("write")
      vim.cmd("terminal time /home/ancheng/anaconda3/envs/yolov8-comment/bin/python -u %")
      vim.cmd("ccl")
    end, { buffer = true, desc = "Run Python file with timing" })
  end,
})

-- =============================================================================
-- RUST CONFIGURATION
-- =============================================================================

api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    -- Set F5 to run current Rust project with cargo
    vim.keymap.set("n", "<F5>", function()
      vim.cmd("write")
      vim.cmd("terminal time cargo run")
    end, { buffer = true, desc = "Run Rust project with cargo" })
  end,
})

-- =============================================================================
-- C/C++ CONFIGURATION
-- =============================================================================

api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    -- Set F5 to compile and run current C/C++ file
    vim.keymap.set("n", "<F5>", function()
      vim.cmd("write")
      local filename = vim.fn.expand("%:r")
      vim.cmd(string.format("terminal time g++ %% -o %s && ./%s", filename, filename))
    end, { buffer = true, desc = "Compile and run C/C++ file" })
  end,
})

-- =============================================================================
-- GENERAL FILETYPE SETTINGS
-- =============================================================================

-- Set appropriate indentation for different file types
api.nvim_create_autocmd("FileType", {
  pattern = { "python", "yaml", "yml", "json" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Auto-format on save for specific file types
api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py", "*.lua", "*.js", "*.ts", "*.jsx", "*.tsx", "*.rs" },
  callback = function()
    -- Only format if LSP is attached and supports formatting
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ async = false })
        break
      end
    end
  end,
})