if vim.fn.executable('eww') == 0 then
    return {}
end

return {
    'elkowar/yuck.vim',
    event = { 'BufReadPre', 'BufNewFile' },
    ft = { 'yuck' },
    dependencies = {
        'gpanders/nvim-parinfer',
    },
}
