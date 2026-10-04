return {
    'mfussenegger/nvim-lint',
    -- Event to trigger linters
    event = 'LazyFile',
    opts = {
        -- Event to trigger linters
        events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
        linters_by_ft = {},
        linters = {},
    },
    config = function(_, opts)
        local lint = require('lint')

        for name, linter in pairs(opts.linters) do
            if type(linter) == 'table' and type(lint.linters[name]) == 'table' then
                lint.linters[name] = vim.tbl_deep_extend('force', lint.linters[name], linter)
                if type(linter.prepend_args) == 'table' then
                    lint.linters[name].args = lint.linters[name].args or {}
                    vim.list_extend(lint.linters[name].args, linter.prepend_args)
                end
            else
                lint.linters[name] = linter
            end
        end

        -- get all the opts.linters_by_ft
        lint.linters_by_ft = opts.linters_by_ft

        vim.env.ESLINT_D_PPID = vim.fn.getpid()

        --lint.linters_by_ft = {
        --  javascript = { 'eslint_d' },
        --  typescript = { 'eslint_d' },
        --  javascriptreact = { 'eslint_d' },
        --  typescriptreact = { 'eslint_d' },
        --  svelte = { 'eslint_d' },
        --}

        vim.api.nvim_create_autocmd(opts.events, {
            group = vim.api.nvim_create_augroup('lint', { clear = true }),
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set('n', '<leader>l', function()
            lint.try_lint()
        end, { desc = 'Trigger linting for current file' })
    end,
}
