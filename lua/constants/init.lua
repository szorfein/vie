local lang_utils = require('utils.lang')

local M = {}

local common_exclude_filetypes = {
    -- neo-tree.nvim
    'neo-tree',
    -- diffview.nvim
    'DiffviewFileHistory',
    'DiffviewFiles',
    -- blame.nvim
    'blame',
    -- trouble.nvim
    'trouble',
    -- nvim-dap
    'dap-repl',
    -- nvim-dap-ui
    'dap-view',
    'dap-view-term',
    -- lazy.nvim
    'lazy',
    -- mason.nvim
    'mason',
    -- which-key.nvim
    'wk',
    -- noice.nvim
    'noice',
    -- harpoon
    'harpoon',
    -- avante.nvim
    'Avante',
    'AvanteInput',
    'AvanteSelectedFiles',
    -- incline.nvim
    'incline',
    -- snacks
    'snacks_picker_input',
    'snacks_picker_list',
    'snacks_picker_preview',
    -- fidget.nvim
    'fidget',
    -- nvim
    'qf',
    'notify',
    'terminal',
    'netrw',
    'tutor',
}

M.exclude_filetypes = lang_utils.list_merge(common_exclude_filetypes, {
    -- nvim-lspconfig
    'lspinfo',
    -- leetcode.nvim
    'leetcode.nvim',
    -- oil.nvim
    'oil',
    -- grug-far.nvim
    'grug-far',
    'grug-far-history',
    'grug-far-help',
    -- nvim-spectre
    'spectre_panel',
    -- checkhealth
    'checkhealth',
    -- nvim
    'help',
    'vim',
})

M.window_picker_exclude_buftypes = {
    'terminal',
    'nofile',
    'prompt',
}

M.exclude_buftypes = lang_utils.list_merge(M.window_picker_exclude_buftypes, {
    'help',
})

return M
