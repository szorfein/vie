local vim = vim

return {
    'mason-org/mason.nvim',
    build = ':MasonUpdate',
    opts_extend = { 'ensure_installed' },
    opts = {
        -- NOTE: mason.nvim doesn't have the option `ensure_installed`
        ensure_installed = {},
        ui = {
            border = 'shadow',
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗',
            },
        },
    },
    config = function(_, opts)
        require('mason').setup(opts)

        local ensure_installed = {
            'ansible-lint',
            'bash-language-server',
            'css-lsp',
            'eslint_d',
            'lua-language-server',
            'oxlint',
            'prettier',
            'prettierd',
            'rufo',
            'shellcheck',
            'shfmt',
            'stylua',
            'tailwindcss-language-server',
            'typescript-language-server',
            --'standardjs',
        }

        local mr = require('mason-registry')
        mr:on('package:install:success', function()
            vim.defer_fn(function()
                -- trigger FileType event to possibly load this newly installed LSP server
                require('lazy.core.handler.event').trigger({
                    event = 'FileType',
                    buf = vim.api.nvim_get_current_buf(),
                })
            end, 100)
        end)

        mr.refresh(function()
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end)
    end,
}
