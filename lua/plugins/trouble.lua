return {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
        {
            '<leader>tt',
            '<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>',
            desc = 'trouble diagnostics',
        },
    },
    opts = {
        win = {
            type = 'split',
            position = 'bottom',
        },
        preview = {
            type = 'main',
            scratch = true,
        },
    },
}
