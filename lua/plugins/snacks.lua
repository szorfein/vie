-- https://github.com/folke/snacks.nvim/blob/main/docs
local vim = vim
local icon = require('utils.icon')

-- Generator https://patorjk.com/software/taag
-- ANSI Compact
local banner_compact = [[
  ▄▄▄  ▄▄ ▄▄ ▄▄ ▄▄▄▄▄
  ██▀██ ██▄██ ██ ██▄▄
   ██▀██  ▀█▀  ██ ██▄▄▄
  ]]
-- Bloody
local banner_bloody = [[
      ▄▄▄    ██▒   █▓ ██▓▓█████
     ▒████▄ ▓██░   █▒▓██▒▓█   ▀
     ▒██  ▀█▄▓██  █▒░▒██▒▒███
     ░██▄▄▄▄██▒██ █░░░██░▒▓█  ▄
      ▓█   ▓██▒▒▀█░  ░██░░▒████▒
      ▒▒   ▓▒█░░ ▐░  ░▓  ░░ ▒░ ░
       ▒   ▒▒ ░░ ░░   ▒ ░ ░ ░  ░
       ░   ▒     ░░   ▒ ░   ░
           ░  ░   ░   ░     ░  ░
                 ░
                 ]]
-- classy
local banner_classy = [[
             ▀▀
 ▄▀▀█▄▀█▄ ██▀██ ▄█▀█▄
 ▄█▀██ ██▄██ ██ ██▄█▀
▄▀█▄██  ▀█▀ ▄██▄▀█▄▄▄
]]
-- Delta Corps Priest 1
local banner_priest_4 = [[
     ▄█    █▄   ▄█     ▄████████
    ███    ███ ███    ███    ███
   ███    ███ ███▌   ███    █▀
███    ███ ███▌  ▄███▄▄▄
   ███    ███ ███    ███    █▄
    ███    ███ ███    ███    ███
     ▀██████▀  █▀     ██████████
]]

return {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        -- dashboard
        dashboard = {
            preset = {
                keys = {
                    { icon = icon.get('FileNew'), key = 'n', desc = 'New file', action = ':ene | startinsert' },
                    {
                        icon = icon.get('SearchFile'),
                        key = 'f',
                        desc = 'Search and open a file',
                        action = function()
                            require('snacks').picker.files({
                                hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat('.git') or {}, 'type') == 'directory',
                            })
                        end,
                    },
                    {
                        icon = icon.get('SessionLoad'),
                        key = 's',
                        desc = 'Restore Session',
                        action = function()
                            require('persistence').load()
                        end,
                    },
                    {
                        icon = icon.get('LazySync'),
                        key = 'u',
                        desc = 'Updates with Lazy',
                        action = ':Lazy sync',
                    },
                    { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
                },
                header = banner_priest_4,
            },
            sections = {
                { section = 'header' },
                { section = 'keys', gap = 0, padding = 1 },
                { section = 'startup' },
            },
        },
        -- configure indent
        indent = {
            enabled = true,
            char = '▏',
            animate = { enabled = false },
            scope = {
                enabled = true,
                char = '▏',
            },
            -- filter for buffers to enable indent guides
            filter = function(buf)
                return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ''
            end,
        },

        -- configure notifier
        notifier = {
            icons = {
                error = ' ',
                warn = ' ',
                info = ' ',
                debug = ' ',
                trace = ' ',
            },
        },

        -- configure picker
        picker = {
            ui_select = true,
        },

        explorer = {},

        -- configure scope
        scope = {
            filter = function(buf)
                return vim.bo[buf].buftype == '' and vim.b[buf].snacks_scope ~= false and vim.g.snacks_scope ~= false
            end,
        },
    },
    keys = {
        {
            '<c-f><c-f>',
            function()
                require('snacks').picker.files({
                    hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat('.git') or {}, 'type') == 'directory',
                })
            end,
            desc = 'Find Files',
        },
        {
            '<leader>lD',
            function()
                require('snacks').picker.diagnostics()
            end,
            desc = 'Search diagnostics',
        },
        {
            '<C-x>b',
            function()
                require('snacks').picker.buffers()
            end,
            desc = 'Search buffer',
        },
    },
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'VeryLazy',
            callback = function()
                local r = require('utils.remaps')

                -- https://github.com/folke/snacks.nvim/blob/main/docs/debug.md
                _G.dd = function(...)
                    require('snacks').debug.inspect(...)
                end
                _G.bt = function()
                    require('snacks').debug.backtrace()
                end

                -- Override print to use snacks for `:=` command
                -- :=Snacks.notifier.notify("hello",4)
                if vim.fn.has('nvim-0.11') == 1 then
                    vim._print = function(_, ...)
                        _G.dd(...)
                    end
                else
                    vim.print = _G.dd
                end

                r.noremap('n', '<c-x><c-f>', function()
                    require('snacks').picker.files({
                        hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat('.git') or {}, 'type') == 'directory',
                    })
                end, 'Find files')
            end,
        })
    end,
}
