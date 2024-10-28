return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local buff = require("bufferline")
        buff.setup({
            options = {
                offsets = { { filetype = "NvimTree", text = "Files", text_align = "left" } },
            },
        })
    end,
}
