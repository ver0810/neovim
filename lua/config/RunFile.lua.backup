-- python
vim.api.nvim_create_autocmd("Filetype",{
    pattern = 'python',
    callback = function ()
        vim.api.nvim_buf_set_keymap(
            0,
            'n',
            '<F5>',
            ":w<CR>:te time /home/ancheng/anaconda3/envs/yolov8-comment/bin/python -u %<CR>:ccl<CR>",
            {silent=true, noremap=true}
        )
    end,
})


-- rust
vim.api.nvim_create_autocmd("Filetype", {
    pattern = 'rust',
    callback = function ()
        vim.api.nvim_buf_set_keymap(
        0,
        'n',
        '<F5>',
        ":w<CR>:te time cargo run<CR>",
        {silent=false, noremap=true}
        )
    end,
})


-- c/c++
vim.api.nvim_create_autocmd("Filetype",{
    pattern = 'cpp',
    callback = function ()
        vim.api.nvim_buf_set_keymap(
            0,
            'n',
            '<F5>',
            ":w<CR>:te time g++ % -o %:r && ./%:r<CR>",
            {silent=true, noremap=true}
        )
    end,
})
