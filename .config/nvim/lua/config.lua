require('nvim-web-devicons').setup({})
require('bufferline').setup({
  options = {
    separator_style = "thick",
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
