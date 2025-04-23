return {
    'IogaMaster/neocord',
    event = "VeryLazy",
    config = function()
        require("neocord").setup_no_return({ logo = "auto" })
    end,
}
