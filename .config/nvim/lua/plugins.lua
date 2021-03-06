local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'                                                          -- Package manager
  use 'neovim/nvim-lspconfig'                                                           -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-compe'                                                              -- Autocompletion plugin
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}                            -- Treesitter configurations and abstraction layer for Neovim
  use {'kyazdani42/nvim-tree.lua',requires = 'kyazdani42/nvim-web-devicons'}            -- A file explorer tree for neovim written in lua
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}} -- Statusline written in pure lua.
  use "lukas-reineke/indent-blankline.nvim"                                             -- Indent guides for Neovim
  use 'navarasu/onedark.nvim'                                                           -- One Dark Theme for Neovim
end)
