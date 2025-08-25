-- Telescope Configuration
-- Fuzzy finder for files, buffers, grep, and more

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    -- Configure telescope
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        file_ignore_patterns = { "node_modules", ".git" },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- Enable fzf extension
    pcall(telescope.load_extension, "fzf")

    -- Key mappings
    local map = vim.keymap.set
    
    -- File operations
    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    
    -- Git operations
    map("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
    map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
    
    -- Search operations
    map("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
    map("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
    map("n", "<leader>sr", builtin.resume, { desc = "Resume last search" })
  end,
}
