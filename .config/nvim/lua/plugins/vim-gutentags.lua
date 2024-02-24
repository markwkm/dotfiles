return {
  'ludovicchabant/vim-gutentags',
  config = function()
    vim.g.gutentags_modules = {'ctags'}
    vim.g.gutentags_add_default_project_roots = 0
    vim.g.gutentags_project_root = {'.git'}
    vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/tags')
    vim.g.gutentags_generate_on_new = 1
    vim.g.gutentags_generate_on_missing = 1
    vim.g.gutentags_generate_on_write = 1
    vim.g.gutentags_generate_on_empty_buffer = 0
    vim.g.gutentags_ctags_extra_args = {
      '--tag-relative=yes',
      '--fields=+ailmnS',
    }
    vim.g.gutentags_ctags_exclude = {
      '*.git',
      'builds',
      'CMakeFiles',
    }
  end,
}
