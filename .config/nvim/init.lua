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
--vim.opt.expandtab = false
vim.opt.filetype = 'off'
vim.opt.number = true
vim.opt.spell = true
vim.opt.syntax = 'on'
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.textwidth = 79

--vim.cmd[[colorscheme solarized]]
vim.cmd[[set noexpandtab]]
vim.cmd[[colorscheme NeoSolarized]]

--vim.cmd[[highlight Normal guibg=#002b36]]
--vim.cmd[[highlight Normal guibg=#fdf6e3]]

local group = vim.api.nvim_create_augroup("myGroup", { clear = true })

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  group = "myGroup",
  pattern = "*",
  command = "setlocal noexpandtab",
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.h", "*.cpp"},
  command = "setlocal colorcolumn=+1",
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.h", "*.cpp"},
  command = "setlocal noexpandtab",
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.h", "*.cpp"},
  command = "setlocal shiftwidth=4",
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.h", "*.cpp"},
  command = "setlocal tabstop=4",
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.h", "*.cpp"},
  command = "setlocal textwidth=4",
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = cmake,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=79
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = context,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal textwidth=72
    setlocal spell
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = gitcommit,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal textwidth=72
    setlocal spell
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = julia,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=79
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = lua,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal textwidth=79
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = mail,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=72
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = python,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=79
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = r,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=79
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = rst,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=79
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = sgml,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=0
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = sh,
  command = [[
    setlocal colorcolumn=+1
    setlocal noexpandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=79
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = sql,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=79
  ]],
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = tex,
  callback = function()
    vim.opt.colorcolumn = '+1'
    vim.opt_local.expandtab = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.textwidth = 79
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  filetype = text,
  command = [[
    setlocal colorcolumn=+1
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal textwidth=79
  ]],
})
