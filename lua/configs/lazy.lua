local list_merge = function(...)
    local lists = {}
    for _, list in ipairs({ ... }) do
        vim.list_extend(lists, list)
    end
    return lists
end

-- Load `lazy.nvim`
require('utils.lazy').install()

-- Load `LazyVim` if possible
require('utils.lazyvim').install()

-- enable experimental Lua module loader
vim.loader.enable()

-- Setup lazy.nvim
require('lazy').setup({
    defaults = {
        lazy = true,
    },
    spec = {
        { 'folke/lazy.nvim', version = '*' },
        require('utils.lazy').find_local_nolazy_spec() or {},
        { 'LazyVim/LazyVim', priority = 10000, lazy = false, opts = {}, version = '*', config = function() end },
        -- import your plugins
        { import = 'ui' },
        { import = 'plugins' },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = {
        colorscheme = { 'catppuccin' },
    },
    -- automatically check for plugin updates, no thanks
    checker = { enabled = false },

    rocks = {
        enabled = false,
    },

    change_detection = { enabled = false },

    -- https://github.com/NvChad/starter/blob/main/lua/configs/lazy.lua
    performance = {
        reset_packpath = true,
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = list_merge({
                '2html_plugin',
                'fzf',
                'tohtml',
                'getscript',
                'getscriptPlugin',
                'gzip',
                'logipat',
                'net',
                'netrw',
                'netrwPlugin',
                'netrwSettings',
                'netrwFileHandlers',
                'matchit',
                'matchparen',
                'tar',
                'tarPlugin',
                'rrhelper',
                'spellfile_plugin',
                'vimball',
                'vimballPlugin',
                'zip',
                'zipPlugin',
                'tutor',
                'rplugin',
                'syntax',
                'synmenu',
                'optwin',
                'compiler',
                'bugreport',
                'ftplugin',
            }),
        },
    },
})
