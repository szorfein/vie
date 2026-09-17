return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.opt.timeout = true
    end,
    opts_extend = { 'spec', 'icons.rules' },
    opts = {
        preset = 'modern',
        layout = {
            --spacing = 0,
        },
        win = {
            no_overlap = false,
            --padding = { 0, 1 },
            --title = false,
        },
        --notify = true,
        icons = {
            rules = {
                { pattern = 'multicursor', icon = ' ', color = 'green' },
            },
        },
        -- https://github.com/folke/which-key.nvim/issues/824
        -- triggers = {
        --   { "<auto>", mode = "nsot" },
        -- },
    },
    keys = {
        {
            '<C-h>b',
            function()
                --require('which-key').show({ global = false })
                require('which-key').show()
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
}
