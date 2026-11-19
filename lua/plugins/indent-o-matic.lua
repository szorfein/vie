return {
    'Darazaki/indent-o-matic',
    event = { 'LazyFile', 'VeryLazy' },
    --lazy = true,
    enabled = true,
    opts = {
        standard_widths = { 2, 4 },
    },
    config = function(_, opts)
        require('indent-o-matic').setup(opts)
    end,
}
