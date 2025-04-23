-- options.lua

-- Set options
vim.opt.nu = true             -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers

vim.opt.tabstop = 4           -- Tab width
vim.opt.shiftwidth = 4        -- Indent width
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Smart indentation

vim.opt.hlsearch = true       -- Highlight search results
vim.opt.incsearch = true      -- Incremental search

vim.opt.termguicolors = true  -- Enable true color support

vim.opt.scrolloff = 8         -- Lines to keep above/below cursor

vim.opt.updatetime = 50       -- Faster update time for plugins
vim.opt.timeoutlen = 300      -- Decrease timeout for key mappings

vim.opt.signcolumn = "yes"    -- Always show sign column
vim.opt.cmdheight = 1         -- Command line height

vim.opt.isfname:append("@-@") -- Allow '-' in file names
