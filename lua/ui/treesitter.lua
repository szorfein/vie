local vim = vim
local treesitter_utils = require('utils.treesitter')

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    --lazy = false,
    event = { 'LazyFile', 'VeryLazy' },
    branch = 'main',
    version = false,
    cmd = { 'TSUpdate', 'TSInstall', 'TSInstallFromGrammar', 'TSLog', 'TSUninstall' },
    build = function()
        local treesitter = require('nvim-treesitter')
        treesitter.update(nil, { summary = true })
    end,
    opts_extend = { 'ensure_installed' },
    opts = {
        -- NOTE: nvim-treesitter doesn't have the option `ensure_installed`
        ensure_installed = {
            'vim',
            'vimdoc',
            'yaml',
        },
    },
    config = function(_, opts)
        -- setup treesitter
        require('nvim-treesitter').setup({
            install_dir = vim.fn.stdpath('data') .. '/site',
            match = {
                enable = true,
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>rp'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>rP'] = '@parameter.inner',
                },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = 'zi',
                    node_incremental = 'zn',
                    scope_incremental = 'zo',
                    node_decremental = 'zd',
                },
            },
        })

        require('nvim-treesitter').install(opts.ensure_installed)
        treesitter_utils.get_installed(true) -- initialize the installed langs

        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup('lazyvim_treesitter', { clear = true }),
            callback = function(ev)
                if not treesitter_utils.have(ev.match) then
                    return
                end
                -- highlighting
                pcall(vim.treesitter.start)
                -- indents
                if treesitter_utils.have(ev.match, 'indents') then
                    local exclude_filetypes = { 'html', 'yaml', 'lua', 'javascript' }
                    if not vim.tbl_contains(exclude_filetypes, ev.match) then
                        vim.bo.indentexpr = [[%!v:lua.require('utils.treesitter').indentexpr()]]
                    end
                end

                -- folds
                if treesitter_utils.have(ev.match, 'folds') then
                    vim.wo.foldexpr = [[%!v:lua.require('utils.treesitter').foldexpr()]]
                end
            end,
        })

        vim.treesitter.language.register('bash', 'zsh')

        -- add toggle keymap for treesitter
        Snacks.toggle.treesitter():map('<leader>uT')
    end,
}
