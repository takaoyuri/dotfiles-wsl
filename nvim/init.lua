--
-- moving around, searching and patterns
--
vim.opt.wrapscan = true
-- vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

--
-- display
--
vim.opt.scrolloff = 5
vim.opt.cmdheight = 2
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

--
-- syntax, hilight
--
vim.opt.background = "dark"
-- true colorを有効にする
vim.opt.termguicolors = true
vim.opt.syntax = "enable"
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.cursorcolumn = false
vim.opt.cursorline = true

-- リーダーキー
vim.g.mapleader = " "

-- コンフィグ再読み込みのキーマップ　リーダー+Enter
function _G.ReloadConfig()
    for name, _ in pairs(package.loaded) do
        if name:match('^user') and not name:match('nvim-tree') then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.api.nvim_set_keymap("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>", {
    noremap = true,
    silent = false
})
-- END コンフィグ再読み込みのキーマップ　リーダー+Enter
--


--- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup 'plugins'

--- 
--- packer.nvim 
---
--[[
local ensure_packer = function()
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        print("Installing packer.nvim")
        vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.api.nvim_command("packadd packer.nvim")
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("neovim/nvim-lspconfig")

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    require("mason").setup()
    require("mason-lspconfig").setup()

    -- nvim-cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/vim-vsnip"

    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({
                select = true
            }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({{
            name = 'nvim_lsp'
        }, {
            name = 'vsnip'
        } -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        }, {{
            name = 'buffer'
        }})
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)

--]]
--
