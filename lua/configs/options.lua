local opt = vim.opt

opt.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus' -- Sync with system clipboard
opt.expandtab = true -- Use spaces instead of tabs
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.updatetime = 250 -- Save swap file and trigger CursorHold
opt.smartindent = true -- Insert indents automatically
opt.smarttab = true -- tab setting aware <Tab> key
