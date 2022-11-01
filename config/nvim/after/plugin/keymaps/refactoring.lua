local Remap = require("seshotake.keymaps")
local nnoremap = Remap.nnoremap

nnoremap("<leader>ri", function()
    require("refactoring").refactor("Inline Variable")
end);
