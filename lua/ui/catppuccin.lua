local mycolors = require('colors')

return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    opts = {
        color_overrides = {
            all = {
                rosewater = mycolors.rosewater,
                flamingo = mycolors.flamingo,
                pink = mycolors.pink,
                mauve = mycolors.mauve,
                red = mycolors.red,
                maroon = mycolors.maroon,
                peach = mycolors.peach,
                yellow = mycolors.yellow,
                green = mycolors.green,
                teal = mycolors.teal,
                sky = mycolors.sky,
                sapphire = mycolors.sapphire,
                blue = mycolors.blue,
                lavender = mycolors.lavender,
                text = mycolors.text,
                overlay2 = mycolors.overlay2,
                --surface2 = mycolors.surface2,
                --surface1 = mycolors.surface1,
                surface0 = mycolors.surface0, --comment
                base = mycolors.base,
                mantle = mycolors.mantle,
                --crust = mycolors.crust,
            },
        },
        highlight_overrides = {
            all = function(colors)
                return {
                    CursorLine = { bg = colors.surface0 }, -- don't work...
                }
            end,
        },
        default_integrations = false,
        --auto_integrations = true,
        integrations = {
            gitsigns = true,
            treesitter = true,
            snacks = {
                enabled = true,
                indent_scope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: overlay2
            },
            lsp_trouble = true,
            vimwiki = true,
            which_key = true,
            indent_blankline = {
                enabled = false,
            },
        },
    },
}
