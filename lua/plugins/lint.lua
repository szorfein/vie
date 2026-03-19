return {
    'mfussenegger/nvim-lint',
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    dependencies = {
        -- ansible files are not properly detected without this
        { 'mfussenegger/nvim-ansible' },
    },
    config = function()
        local lint = require('lint')

        vim.env.ESLINT_D_PPID = vim.fn.getpid()

        lint.linters_by_ft = {
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
            svelte = { 'eslint_d' },
            astro = { 'eslint_d' },
            ['yaml.ansible'] = { 'ansible_lint' },
        }

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set('n', '<leader>l', function()
            lint.try_lint()
        end, { desc = 'Trigger linting for current file' })
    end,
}
