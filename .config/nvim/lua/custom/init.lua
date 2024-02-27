local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.cmd "NvimTreeToggle"
    vim.cmd "wincmd l"
  end,
})
