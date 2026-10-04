return {
    {
        'nvim-treesitter/nvim-treesitter',
        optional = true,
        opts = {
            ensure_installed = { 'lua' },
        },
    },
    {
        'neovim/nvim-lspconfig',
        optional = true,
        opts = {
            servers = {
                lua_ls = {},
            },
        },
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        cmd = 'LazyDev',
        opts = {
            library = {
                { path = 'LazyVim', words = { 'LazyVim' } },
                { path = 'snacks.nvim', words = { 'Snacks' } },
                { path = 'lazy.nvim', words = { 'LazyVim' } },
            },
        },
    },
    {
        'stevearc/conform.nvim',
        optional = true,
        dependencies = {
            {
                'mason-org/mason.nvim',
                optional = true,
                opts = {
                    ensure_installed = { 'stylua' },
                },
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { 'stylua' },
            },
        },
    },
    -- remove mini.icon for now
    {
        'nvim-mini/mini.icons',
        enabled = false,
    },
}
