require 'mahadia.core.colorscheme'
require 'mahadia.core.options'
require 'mahadia.core.keymaps'
require 'mahadia.plugins-setup'
require 'mahadia.plugins.whichkey'
require 'mahadia.plugins.treesitter'
require 'mahadia.plugins.comment'
require 'mahadia.plugins.nvim-tree'
require 'mahadia.plugins.lualine'
require 'mahadia.plugins.telescope'
require 'mahadia.plugins.bufferline'
require 'mahadia.plugins.lspZero'
require 'mahadia.plugins.harpoon'
require 'mahadia.plugins.autopairs'
require 'mahadia.plugins.toggleterm'
-- require 'mahadia.plugins.undotree'

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
