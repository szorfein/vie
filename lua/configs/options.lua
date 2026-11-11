local opt = vim.opt

-- Disable provider
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Disable the built-in netrw file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus' -- Sync with system clipboard
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.updatetime = 300 -- Save swap file and trigger CursorHold
opt.smartindent = true -- Insert indents automatically
opt.smarttab = true -- tab setting aware <Tab> key

opt.formatoptions = 'jcroqlnt' -- tcqj
opt.cursorline = true -- Enable highlighting of the current line
opt.linebreak = true -- Wrap lines at convenient points

-- https://thebetterwebmovement.com/how-to-make-nvim-cursor-quicker-simple-speed-fixes/
opt.timeoutlen = 500 -- ms to wait for next key in sequence
opt.ttimeoutlen = 10 -- ms to wait for next key in terminal key
opt.scrolloff = 8 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context

-- tab
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces tabs count for
opt.shiftwidth = 4 -- Number of spaces to use for indent. used by indent-o-matic or guess-indent plugin

-- perf
opt.synmaxcol = 300
opt.lazyredraw = true -- Do not redraw the screen while executing macros, registers, or complex commands.
opt.history = 1000 -- Limit the number of lines kept in history to save memory.
opt.swapfile = true --  Write swap files asynchronously (prevents UI freezes on save).
opt.writebackup = false -- Don't keep a backup file around (saves disk I/O)
