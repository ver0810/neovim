# Neovim Configuration

A modern, well-organized Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## 🏗️ Project Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── settings.lua     # General editor settings
│   │   ├── keymaps.lua      # Key bindings and shortcuts
│   │   ├── lazy.lua         # Plugin manager configuration
│   │   └── autocommands.lua # Filetype-specific settings
│   └── plugins/             # Individual plugin configurations
│       ├── lsp.lua          # Language Server Protocol
│       ├── telescope.lua    # Fuzzy finder
│       ├── cmp.lua          # Autocompletion
│       ├── treesitter.lua   # Syntax highlighting
│       └── ...
└── README.md               # This file
```

## 🚀 Quick Start

### Prerequisites
- Neovim 0.8+ (0.9+ recommended)
- Git
- A Nerd Font (for icons)

### Installation

1. **Backup existing configuration**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim** (plugins will auto-install):
   ```bash
   nvim
   ```

## 🎯 Key Features

### 🔧 Core Features
- **Modern plugin management** with lazy.nvim
- **LSP support** for multiple languages
- **Smart autocompletion** with nvim-cmp
- **Fuzzy finding** with Telescope
- **Syntax highlighting** with Treesitter
- **Git integration** with various plugins
- **File explorer** integration
- **Terminal integration**

### ⌨️ Key Bindings

#### General
- `<leader>` is set to **space**
- `<C-q>` - Quit Neovim
- `<C-/>` - Open terminal below

#### Navigation
- `<C-h/j/k/l>` - Navigate between windows
- `<C-Up/Down/Left/Right>` - Resize windows
- `<S-h/l>` - Previous/Next buffer
- `<leader>bb` - Switch to alternate buffer

#### File Operations
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>fb` - Find buffers (Telescope)
- `<leader>fh` - Help tags (Telescope)

#### Code Actions
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show documentation
- `<leader>ca` - Code actions
- `<leader>cf` - Format code

#### Movement
- `<A-j/k>` - Move line/selection up/down
- `j/k` - Smart movement (handles wrapped lines)

## 🧩 Adding New Plugins

To add a new plugin, create a new file in `lua/plugins/` following this template:

```lua
-- plugins/your-plugin.lua
return {
  "author/plugin-name",
  event = "VeryLazy",  -- or specific events like "BufReadPost"
  dependencies = {
    -- list any dependencies here
  },
  config = function()
    -- plugin configuration here
    require("plugin-name").setup({
      -- plugin options
    })
    
    -- optional: key mappings
    vim.keymap.set("n", "<leader>xx", function()
      -- your mapping
    end, { desc = "Description" })
  end,
}
```

### Plugin Categories

- **LSP & Language Support**: `lsp.lua`, `treesitter.lua`
- **UI & Appearance**: `theme.lua`, `ui.lua`
- **Navigation**: `telescope.lua`
- **Development**: `dap.lua`, `formatter.lua`
- **Utilities**: `utils.lua`, `notify.lua`

## 🛠️ Customization

### Settings
Edit `lua/config/settings.lua` to change general editor behavior.

### Keymaps
All key bindings are centralized in `lua/config/keymaps.lua` with clear sections and descriptions.

### Filetype-specific Settings
Add custom behaviors for different file types in `lua/config/autocommands.lua`.

### Colorscheme
The default colorscheme is **catppuccin**. To change it:
1. Install your preferred colorscheme plugin
2. Update the colorscheme in `init.lua`

## 📋 Language Support

### Currently Configured Languages
- **Python**: pyright, ruff
- **Rust**: rust_analyzer
- **JavaScript/TypeScript**: tsserver
- **HTML/CSS**: html, cssls
- **Lua**: lua_ls
- **C/C++**: clangd

### Adding New Language Support
1. Add the LSP server to the `servers` table in `lua/plugins/lsp.lua`
2. Ensure the server is installed via Mason: `:MasonInstall server-name`
3. Add any filetype-specific settings to `lua/config/autocommands.lua`

## 🔍 Troubleshooting

### Common Issues

**Plugin not loading?**
- Check `:Lazy` to see plugin status
- Ensure plugin file is in `lua/plugins/` directory
- Check for syntax errors with `:checkhealth`

**LSP not working?**
- Run `:Mason` to check LSP server installation
- Use `:LspInfo` to debug LSP issues
- Check `:checkhealth lspconfig`

**Key bindings not working?**
- Verify leader key is set correctly
- Check for conflicting mappings with `:nmap <key>`
- Ensure keymaps.lua is loaded in init.lua

### Useful Commands
- `:Lazy` - Plugin manager
- `:Mason` - LSP server manager
- `:LspInfo` - LSP status
- `:checkhealth` - Health check
- `:Telescope keymaps` - Search key bindings

## 📝 Contributing

Feel free to fork this configuration and adapt it to your needs. The modular structure makes it easy to customize individual components without affecting the entire setup.

## 📄 License

This configuration is provided as-is for educational and personal use.

---

**Last updated**: 2024.7.23