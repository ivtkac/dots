local map = vim.api.nvim_set_keymap

map('n', '<leader>nt', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Find Files' })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Live Grep' })
map('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'List Buffers' })
map('n', '<leader>ft', ':Telescope help_tags<CR>', { desc = 'List Help Tags' })
map('n', '<leader>gf', ':Telescope git_files<CR>', { desc = 'Git Files' })
