return {
    {
        'mason-org/mason.nvim',
        optional = true,
        -- NOTE: `opts_extend` don't work as expected
        -- if it isn't read by `lazy.nvim` at the start
        opts_extend = { 'ensure_installed' },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        optional = true,
        opts_extend = { 'ensure_installed' },
    },
}
