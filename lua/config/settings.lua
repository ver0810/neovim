-- General Neovim Settings
-- This file contains all global editor settings and configurations

local opt = vim.opt
local g = vim.g

-- =============================================================================
-- EDITOR APPEARANCE
-- =============================================================================

-- Line numbers and cursor
opt.number = true           -- Show absolute line numbers
opt.relativenumber = true   -- Show relative line numbers
opt.cursorline = true       -- Highlight current line
opt.signcolumn = "yes"      -- Always show sign column

-- Text display
opt.textwidth = 80          -- Maximum text width for wrapping
opt.wrap = true             -- Enable line wrapping
opt.conceallevel = 1        -- Conceal markup characters

-- =============================================================================
-- SEARCH SETTINGS
-- =============================================================================

opt.hlsearch = false        -- Don't highlight all search matches
opt.ignorecase = true       -- Case-insensitive search
opt.smartcase = true        -- Case-sensitive when uppercase present

-- =============================================================================
-- TAB AND INDENTATION
-- =============================================================================

opt.tabstop = 4             -- Number of spaces a tab counts for
opt.shiftwidth = 4          -- Number of spaces for auto-indent
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftround = true       -- Round indent to multiple of shiftwidth
opt.autoindent = true       -- Auto-indent new lines
opt.smartindent = true      -- Smart auto-indenting
opt.backspace = { "indent", "eol", "start" }  -- Proper backspace behavior

-- =============================================================================
-- FILE HANDLING
-- =============================================================================

opt.fileencoding = "utf-8"  -- File encoding
opt.autoread = true         -- Auto-reload files changed outside vim
opt.swapfile = false        -- Don't create swap files
opt.backup = false          -- Don't create backup files
opt.undofile = true         -- Persistent undo
opt.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')  -- Undo directory

-- =============================================================================
-- UI BEHAVIOR
-- =============================================================================

opt.showmode = false        -- Don't show mode in command line
opt.wildmenu = true         -- Enhanced command-line completion
opt.completeopt = { "menuone", "noselect" }  -- Completion options
opt.termguicolors = true    -- True color support
opt.title = true            -- Set terminal title
opt.mouse = "a"             -- Enable mouse support
opt.updatetime = 50         -- Faster completion
opt.splitright = true       -- Split windows to the right
opt.exrc = true             -- Allow local .nvim.lua files

-- =============================================================================
-- GLOBAL VARIABLES
-- =============================================================================

g.mapleader = " "           -- Set leader key to space
g.bigfile_size = 1024 * 1024 * 1.5  -- 1.5MB threshold for big files

-- =============================================================================
-- LSP ENHANCEMENTS
-- =============================================================================

-- Better hover window appearance
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  max_width = 80,
  max_height = 20,
})
