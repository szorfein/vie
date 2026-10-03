local lazy_utils = require('utils.lazy')
local format_utils = require('utils.format')
local lang_utils = require('utils.lang')

return {
    'stevearc/conform.nvim',
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
    },
    event = 'VeryLazy',
    cmd = { 'ConformInfo', 'LazyFormat' },
    opts = {
        formatters_by_ft = {
            --astro = { 'biome' },
            ['astro'] = { 'prettierd' },
            ['css'] = { 'prettierd' },
            ['scss'] = { 'prettierd' },
            ['graphql'] = { 'prettierd' },
            ['html'] = { 'prettierd' },
            --javascript = { 'standardjs' },
            ['javascript'] = { 'prettierd' },
            ['json'] = { 'prettierd' },
            ['typescript'] = { 'prettierd' },
            ['vue'] = { 'prettierd' },
        },
        formatters = {
            prettier = {
                command = 'prettier',
                prepend_args = { '-w' },
            },
            shfmt = {
                command = 'shfmt',
                prepend_args = { '-i', '0', '-sr', '-kp' },
                --prepend_args = { '-p', '-i', '0', '-sr', '-bn' },
            },
            biome = {
                command = 'biome',
                prepend_args = { 'check', '--write' },
            },
            ansible_lint = {
                command = 'ansible-lint',
                -- Only auto-fix formatting issues
                prepend_args = { '--strict', '--fix', '-t', 'formatting' },
            },
            injected = { options = { ignore_errors = true } },
        },
        -- Set default options
        default_format_opts = {
            timeout_ms = 3000,
            async = false, -- not recommended to change
            quiet = false, -- not recommended to change
            lsp_format = 'fallback', -- not recommended to change
        },
        -- Set up format-on-save
        -- Prefer format_after_save over format_on_save
        -- https://github.com/stevearc/conform.nvim/issues/401
        format_after_save = {
            lsp_format = 'fallback',
            --async = false,
            --timeout_ms = 500,
        },
        --format_on_save = {
        --timeout_ms = 5000, -- up to 5 secs
        --}
    },
    keys = {
        {
            '<leader>fb', -- format buffer
            function()
                --require('conform').format({ formatters = { 'injected' }, timeout_ms = 3000 })
                require('conform').format({ async = true })
            end,
            mode = { 'n', 'x' },
            desc = 'Format buffer',
        },
    },
    init = function()
        -- Install the conform formatter on VeryLazy
        lazy_utils.on_very_lazy(function()
            format_utils.register({
                name = 'conform.nvim',
                priority = 100,
                primary = true,
                format = function(buf, format_opts, cb)
                    local opts = lang_utils.tbl_merge({}, format_opts, { bufnr = buf })
                    require('conform').format(opts, cb)
                end,
                sources = function(buf)
                    local ret = require('conform').list_formatters(buf)
                    return vim.tbl_map(function(v)
                        return v.name
                    end, ret)
                end,
            })
        end)
    end,
}
