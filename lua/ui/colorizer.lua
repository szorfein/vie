-- the first link (origin) freeze a lot when scrolling with render = virtual

return {
    --'brenoprata10/nvim-highlight-colors',
    'wochap/nvim-highlight-colors',
    event = { 'BufReadPost' },
    --event = 'VeryLazy',
    cmd = 'HighlightColors',
    opts = {
        --render = 'background',
        render = 'virtual',
        enable_tailwind = true,
        enable_hex = true,
        virtual_symbol = '󱓻',
    },
}
