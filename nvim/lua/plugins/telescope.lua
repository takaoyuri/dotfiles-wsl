return {{
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'vertical',
                layout_config = {},
                mappings = {
                    i = {
                        ['<esc>'] = require('telescope.actions').close,
                        ['<C-u>'] = false,
                    }
                },
                winblend = 20
            }
        })
        local telescope_builtin = require('telescope.builtin')
        -- vim.keymap.set('n', '<leader><leader>', telescope_builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, {})
    end
}}
