-- Key Mappings Configuration
-- Centralized keybinding configuration with consistent patterns and descriptions

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =============================================================================
-- MOVEMENT AND NAVIGATION
-- =============================================================================

-- Better line movement (handles wrapped lines)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Window navigation using Ctrl+hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Window resizing
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- =============================================================================
-- BUFFER MANAGEMENT
-- =============================================================================

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to alternate buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to alternate buffer" })

-- =============================================================================
-- TEXT MANIPULATION
-- =============================================================================

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Add undo break-points for better undo granularity
map("i", ",", ",<c-g>u", { desc = "Add undo break-point after comma" })
map("i", ".", ".<c-g>u", { desc = "Add undo break-point after period" })
map("i", ";", ";<c-g>u", { desc = "Add undo break-point after semicolon" })

-- =============================================================================
-- SEARCH AND CLEAR
-- =============================================================================

-- Clear search highlighting
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear search highlighting" })

-- Clear search, update diff, and redraw screen
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw screen / clear search / update diff" }
)

-- =============================================================================
-- WINDOW MANAGEMENT
-- =============================================================================

-- Window operations
map("n", "<leader>ww", "<C-W>p", { desc = "Switch to other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Close window", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window horizontally", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window vertically", remap = true })

-- =============================================================================
-- TAB MANAGEMENT
-- =============================================================================

-- Tab operations
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Go to last tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Go to first tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Create new tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- =============================================================================
-- TERMINAL AND SYSTEM
-- =============================================================================

-- Open terminal
map({"n", "t"}, "<C-/>", "<cmd>belowright split | terminal /usr/bin/fish<cr>",
    { desc = "Open terminal below" })

-- =============================================================================
-- PLUGIN-RELATED KEYBINDS
-- =============================================================================

-- Lazy plugin manager
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open Lazy plugin manager" })

-- File operations
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "Create new file" })

-- Quickfix and location lists
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open location list" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open quickfix list" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix item" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix item" })

-- Documentation lookup
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Look up keyword under cursor" })

-- =============================================================================
-- GENERAL COMMANDS
-- =============================================================================

-- Exit Neovim
map("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit Neovim" })
