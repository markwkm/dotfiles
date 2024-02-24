return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  options = { theme = 'solarized_dark' },
  config = function()
    local lualine = require("lualine")
    lualine.setup()
  end,
}
