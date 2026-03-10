return {
    'elkowar/yuck.vim',
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    dependencies = {
        'gpanders/nvim-parinfer',
    },
}
