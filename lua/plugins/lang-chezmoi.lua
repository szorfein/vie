if vim.fn.executable('chezmoi') == 0 then
    return {}
end

return {
    {
        -- highlighting for chezmoi files template files
        'alker0/chezmoi.vim',
        lazy = false, -- don't load if true
        init = function()
            vim.g['chezmoi#use_tmp_buffer'] = 1
            vim.g['chezmoi#source_dir_path'] = vim.env.HOME .. '/.local/share/chezmoi'
        end,
    },
}
