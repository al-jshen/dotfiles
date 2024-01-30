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
  ensure_installed = {"bash", "bibtex", "c", "cmake", "comment", "cpp", "css", "cuda", "dockerfile", "go", "html", "javascript", "jsdoc", "json", "json5", "jsonc", "julia", "latex", "llvm", "lua", "make", "markdown", "ocaml", "perl", "python", "r", "regex", "rust", "scss", "todotxt", "toml", "tsx", "typescript", "vim", "yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
  additional_vim_regex_highlighting = {"latex"},
})

-- following options are the default
require'nvim-tree'.setup {
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
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
