local vim = vim

return {
    'nvim-treesitter/nvim-treesitter',
    --build = ':TSUpdate',
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    --lazy = false,
    --event = 'VeryLazy',
    event = { 'BufReadPost', 'BufNewFile' },
    --build = function()
    --    local treesitter = require('nvim-treesitter')
    ---    treesitter.update(nil, { summary = true })
    --end,
    cmd = { 'TSUpdate', 'TSInstall', 'TSInstallFromGrammar', 'TSLog', 'TSUninstall' },
    build = ':TSUpdate',
    --cmd = { 'TSUpdate', 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSLog', 'TSUninstall' },
    opts_extend = { 'ensure_installed' },
    opts = {
        ensure_installed = {
            'lua',
            'markdown',
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

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '<filetype>' },
            callback = function()
                vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo[0][0].foldmethod = 'expr'
                vim.treesitter.start()
            end,
        })

        -- add toggle keymap for treesitter
        Snacks.toggle.treesitter():map('<leader>uT')
    end,
}
