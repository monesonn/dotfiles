--[[
   _      _ __    __
  (_)__  (_) /_  / /_ _____ _
 / / _ \/ / __/ / / // / _ `/
/_/_//_/_/\__(_)_/\_,_/\_,_/
                nvim >= 0.5

]]

-- About:  Configuration files for Neovim
-- Author: Stanislav <git.io/monesonn>
-- Link:   http://git.io/.mn

local modules = {
    'general',
    'plugins'
}

for i=1, #modules do
    require("modules/" .. modules[i])
end

vim.cmd('source ~/.config/nvim/vimscript/plugins-settings.vim')
vim.cmd('source ~/.config/nvim/vimscript/ui.vim')
vim.cmd('source ~/.config/nvim/vimscript/shortcuts.vim')
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

