return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'shaunsingh/solarized.nvim',
  },
  options = { theme = 'auto' },
  config = function()
    local lualine = require("lualine")
    lualine.setup()
  end,
}
