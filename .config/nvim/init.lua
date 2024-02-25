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

require("lazy").setup("plugins")

--vim.opt.colorcolumn = '79'
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.spell = true
vim.opt.termguicolors = true
vim.opt.textwidth = 79

--vim.cmd[[colorscheme solarized]]
vim.cmd[[colorscheme NeoSolarized]]
vim.cmd[[filetype on]]
vim.cmd[[syntax on]]
vim.cmd[[Neotree]]
