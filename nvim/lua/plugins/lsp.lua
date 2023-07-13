return {{
    'neovim/nvim-lspconfig',
    config = function()
    end
}, {
    'williamboman/mason.nvim',
    dependence = {'williamboman/mason-lspconfig.nvim'},
    config = function()
        require('mason').setup()
    end

}, {
    'williamboman/mason-lspconfig.nvim',
    dependence = {'williamboman/mason.nvim'},
    config = function()
        require('mason-lspconfig').setup()
    end
}, {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {{"nvim-tree/nvim-web-devicons"}, -- Please make sure you install markdown and markdown_inline parser
    {"nvim-treesitter/nvim-treesitter"}}
}, {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
}}
