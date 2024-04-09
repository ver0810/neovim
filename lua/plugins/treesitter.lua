return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require'nvim-treesitter.configs'.setup {
             ensure_installed = {"python", "c", "cpp", "lua", "java", "go", "rust"},
              highlight = {
                  enable = true,
              }
        }
    end
}
