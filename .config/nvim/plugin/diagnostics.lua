local function open_float()
    vim.diagnostic.open_float { border = 'rounded' }
end
vim.keymap.set('n', 'g?', open_float, { silent = true })

vim.diagnostic.config({ virtual_text = { current_line = true } })
