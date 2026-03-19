return {
    'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = function()
        require('nvim-web-devicons').setup({
            override = {
                ['default_icon'] = {
                    icon = '󰈚',
                    name = 'Default',
                },
                deb = { icon = '', name = 'Deb' },
                ['conf'] = {
                    icon = ' ',
                },
                lua = {
                    icon = '',
                },
                lock = { icon = '󰌾', name = 'Lock' },
                ['markdown'] = {
                    icon = ' ',
                },
                mp3 = { icon = '󰎆', name = 'Mp3' },
                mp4 = { icon = '', name = 'Mp4' },
                out = { icon = '', name = 'Out' },
                ['robots.txt'] = { icon = '󰚩', name = 'Robots' },
                ttf = { icon = '', name = 'TrueTypeFont' },
                rpm = { icon = '', name = 'Rpm' },
                woff = { icon = '', name = 'WebOpenFontFormat' },
                woff2 = { icon = '', name = 'WebOpenFontFormat2' },
                xz = { icon = '', name = 'Xz' },
                zip = { icon = '', name = 'Zip' },
                js = { icon = '󰌞', name = 'js' },
                ts = { icon = '󰛦', name = 'ts' },
            },
        })
    end,
}
