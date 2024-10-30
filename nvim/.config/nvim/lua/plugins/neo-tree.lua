return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",               -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true, -- Close Neotree if it's the last window open
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            -- other settings as desired
            window = {
                mappings = {
                    ["o"] = "open",    -- Use `o` to open files and folders
                    ["<CR>"] = "noop", -- Optionally unbind the Enter key if you don't want it to open files
                },
            },
        })
    end
}
