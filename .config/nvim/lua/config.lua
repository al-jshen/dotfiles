require('nvim-web-devicons').setup({})


local colors = require('colors')

require('bufferline').setup({
  options = {
    -- separator_style = "thick",
    show_buffer_icons = true,
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
    }}
  },
})

require('nvim-treesitter.configs').setup ({
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {enable = true},
})

-- following options are the default
require'nvim-tree'.setup {
  -- closes/opens neovim automatically when the tree is the last/first **WINDOW** in the view
  auto_close          = true,
  auto_open           = true,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 25,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  },

  git = {
    ignore = true
  }
}

require('statusline')

-- " %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% nvim_lsp

-- " lua << EOF
-- "
-- "  local on_attach_vim = function(client)
--   "    require'completion'.on_attach(client)
--   "    require'diagnostic'.on_attach(client)
--   "  end
-- "
-- "  require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
-- "  require'nvim_lsp'.jsonls.setup{on_attach=on_attach_vim}
-- "  require'nvim_lsp'.rust_analyzer.setup{on_attach=on_attach_vim}
-- "  require'nvim_lsp'.texlab.setup{on_attach = on_attach_vim}
-- "  require'nvim_lsp'.cssls.setup{on_attach = on_attach_vim, cmd = {"/home/js/.nvm/versions/node/v14.11.0/bin/css-languageserver", "--stdio"}}
-- "  require'nvim_lsp'.rome.setup{on_attach = on_attach_vim, cmd = {"/home/js/.nvm/versions/node/v14.11.0/bin/rome", "lsp"}}
-- " EOF

-- "autocmd BufEnter * lua require'completion'.on_attach()
