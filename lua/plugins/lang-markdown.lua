require('utils.lazy').on_very_lazy(function()
    vim.filetype.add({
        extension = { mdx = 'markdown.mdx' },
    })
end)

return {
    {
        'nvim-treesitter/nvim-treesitter',
        optional = true,
        opts = {
            ensure_installed = {
                'markdown',
                'markdown_inline',
            },
        },
    },
    {
        'mason-org/mason.nvim',
        opts = { ensure_installed = { 'prettierd' } },
    },
    {
        'stevearc/conform.nvim',
        optional = true,
        opts = {
            formatters_by_ft = {
                ['markdown'] = { 'prettierd' },
                ['markdown.mdx'] = { 'prettierd' },
            },
        },
    },
    {
        'brianhuster/live-preview.nvim',
        dependencies = {
            -- You can choose one of the following pickers
            'folke/snacks.nvim',
        },
        --enabled = false,
        keys = {
            { '<leader>mo', ':LivePreview start<CR>', desc = 'Open Markdown preview' }, -- markdown open
            { '<leader>mc', ':LivePreview close<CR>', desc = 'Close Markdown preview' }, -- markdown close
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            code = {
                sign = false,
                width = 'block',
                right_pad = 1,
            },
            latex = {
                enabled = false,
            },
            overrides = {
                buftype = {
                    nofile = {
                        enabled = false,
                    },
                },
            },
        },
        ft = { 'markdown', 'norg', 'rmd', 'org', 'codecompanion' },
        config = function(_, opts)
            require('render-markdown').setup(opts)
            Snacks.toggle({
                name = 'Render Markdown',
                get = require('render-markdown').get,
                set = require('render-markdown').set,
            }):map('<leader>mt') -- markdown toggle
        end,
    },
}
