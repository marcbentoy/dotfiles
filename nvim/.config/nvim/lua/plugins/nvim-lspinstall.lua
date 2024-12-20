return {
    "kabouzeid/nvim-lspinstall",
    config_dev = function()
        require("lspinstall").setup() -- important

        local servers = require("lspinstall").installed_servers()
        for _, server in pairs(servers) do
            require("lspconfig")[server].setup({})
        end
    end,
}
