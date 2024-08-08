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
    end
})
