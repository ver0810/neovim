-- Neovim Configuration Entry Point
-- This file serves as the main entry point for the entire configuration

-- Load core configuration modules in order
require("config.settings")        -- General editor settings
require("config.keymaps")         -- Key mappings and shortcuts
require("config.lazy")            -- Plugin management with lazy.nvim
require("config.autocommands")    -- Filetype-specific autocommands

-- Set color scheme (loaded after plugins are initialized)
vim.cmd[[colorscheme catppuccin]]
