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

vim.opt.colorcolumn = '+1'
vim.opt.number = true
vim.opt.spell = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.textwidth = 79

--vim.cmd[[colorscheme solarized]]
vim.cmd[[colorscheme NeoSolarized]]
vim.cmd[[filetype on]]
vim.cmd[[syntax on]]
vim.cmd[[Neotree]]

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = c,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = cpp,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = cmake,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = context,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 72
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = gitcommit,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 72
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = julia,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = lua,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = mail,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 72
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = python,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = r,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = rst,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = sgml,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 0
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = sql,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = tex,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = text,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.textwidth = 79
  end,
})
