local opt = vim.opt

opt.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus' -- Sync with system clipboard
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.updatetime = 250 -- Save swap file and trigger CursorHold
opt.smartindent = true -- Insert indents automatically
opt.smarttab = true -- tab setting aware <Tab> key

opt.formatoptions = 'jcroqlnt' -- tcqj
opt.cursorline = true -- Enable highlighting of the current line
opt.linebreak = true -- Wrap lines at convenient points

-- https://thebetterwebmovement.com/how-to-make-nvim-cursor-quicker-simple-speed-fixes/
opt.timeoutlen = 300 -- ms to wait for next key in sequence
opt.ttimeoutlen = 50 -- ms to wait for next key in terminal key
opt.scrolloff = 8 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context

-- tab
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces tabs count for
opt.shiftwidth = 4 -- Number of spaces to use for indent. used by indent-o-matic or guess-indent plugin
