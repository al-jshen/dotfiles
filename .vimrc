call plug#begin('~/.vim/plugged/')
" General
" Plug 'scrooloose/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
" Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

" Languages
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'eigenfoo/stan-vim'
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Chiel92/vim-autoformat'

" Syntax/Highlighting
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'SirVer/ultisnips'
" Plug 'epilande/vim-react-snippets'

call plug#end()

" set <leader> to space
let mapleader = "\<Space>"

" disable arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" use arrow keys to go to next/previous buffer
nnoremap <silent><Right> :BufferLineCycleNext<CR>
nnoremap <silent><Left> :BufferLineCyclePrev<CR>

" use ; instead of : to trigger command mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Quick-save
nmap <leader>w :w<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" use <esc> to clear highlighting after a search
nnoremap <silent> <esc> :noh<cr><esc>


let g:gitgutter_grep=''
let g:gitgutter_log=1

set mouse=a
" set statusline^=%{coc#status()}

" coc.nvim node path
let g:coc_node_path = '/home/js/.nvm/versions/node/v14.0.0/bin/node'

" vim-slime target
" let g:slime_target = "x11"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
" let g:slime_python_qtconsole = 1

" Buffer configurations
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

" Airline theme
" let g:airline_theme='base16'

" Lightline theme
" let g:lightline = {
"       \ 'colorscheme': 'one',
"       \ }

" Window splitting
set splitbelow
set splitright

" Syntax Highlighting
syntax enable
filetype plugin indent on
set nospell

" Semshi Configurations
"let g:semshi#always_update_all_highlights = 1

" Run rustfmt on save
let g:rustfmt_autosave = 1
" format files on save
au BufWrite * :Autoformat

" alias :Prettier for :CocCommand prettier.formatFile
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Disable formatting for some filetypes
autocmd FileType stan,yaml let b:autoformat_autoindent=0
autocmd FileType py let b:autoformat=0

" Terminal true colors
set termguicolors
set t_CO=256

" Python Provider
let g:python3_host_prog = '/home/js/miniconda3/bin/python'

" Latex stuff
let g:tex_flavor = 'latex'
" let g:vimtex_view_method = 'zathura'

" UTF-8 Support
set encoding=utf-8

" Fix weird backspace behaviour
set bs=2

" Faster update time
set updatetime=100

" " Nerdtree Configurations
" " let g:NERDTreeHijackNetrw=0
" map <silent> <C-n> ;NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" let g:NERDTreeMouseMode=3

nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.



set completeopt=menuone,longest,noinsert
set completeopt-=preview
set shortmess+=c

let g:completion_timer_cycle = 50
let g:completion_matching_ignore_case = 1
let g:completion_trigger_on_delete = 0

" Better message display
set cmdheight=2

" Less delay when pressing o
set timeoutlen=300

" Undo history
set undodir=~/.vimdid
set undofile


lua << EOF
require'nvim-web-devicons'.setup{}
require'bufferline'.setup{
options = {
  separator_style = "thick",
  show_buffer_icons = true,
  }
}
require'nvim-treesitter.configs'.setup {
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
}
EOF

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% nvim_lsp

" lua << EOF
"
"  local on_attach_vim = function(client)
"    require'completion'.on_attach(client)
"    require'diagnostic'.on_attach(client)
"  end
"
"  require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
"  require'nvim_lsp'.jsonls.setup{on_attach=on_attach_vim}
"  require'nvim_lsp'.rust_analyzer.setup{on_attach=on_attach_vim}
"  require'nvim_lsp'.texlab.setup{on_attach = on_attach_vim}
"  require'nvim_lsp'.cssls.setup{on_attach = on_attach_vim, cmd = {"/home/js/.nvm/versions/node/v14.11.0/bin/css-languageserver", "--stdio"}}
"  require'nvim_lsp'.rome.setup{on_attach = on_attach_vim, cmd = {"/home/js/.nvm/versions/node/v14.11.0/bin/rome", "lsp"}}
" EOF

"autocmd BufEnter * lua require'completion'.on_attach()
"
"" Inlay hints
"autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
      "\ lua require'lsp_extensions'.inlay_hints{
" \ prefix = ' » ',
" \ highlight = "Frost1",
" \ aligned = false,
" \ only_current_line = false}
"
"" use tabnine
"let g:completion_chain_complete_list = {
"   \ 'default': [
"   \    {'complete_items': ['lsp', 'snippet', 'tabnine' ]},
"   \    {'mode': '<c-p>'},
"   \    {'mode': '<c-n>'}
"   \]
"\}

" auto pop up diagnostics
" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_underline = 1

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Navigating completion list
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Implement methods for traits
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>

" Show actions available at this location
nnoremap <silent> <space>a  :CocAction<cr>

" have a column for symbols (eg for errors)
set signcolumn=yes

" Line Numbers
set relativenumber
set number

set expandtab       " Convert \t into spaces
set tabstop=2       " The width of a TAB
set shiftwidth=2    " Indent width (when you use >)
set softtabstop=2   " Sets the number of columns for a TAB
set autoindent
set smartindent

" " Don't wrap lines
" set formatoptions-=t
" set nowrap

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


" wrap certain filetypes
au BufNewFile,BufRead *.txt setlocal wrap linebreak nolist
au BufNewFile,BufRead *.tex setlocal wrap linebreak nolist
au BufNewFile,BufRead *.md setlocal wrap linebreak nolist


" Enable incrementing letters
set nrformats+=alpha

" Crontab vim fix
autocmd FileType crontab setlocal nobackup nowritebackup

" Theming
" let alt_colorscheme_types = ['.tex']

set background=dark
colorscheme flow
hi Normal guibg=NONE ctermbg=NONE
" hi Identifier guifg=#a9b0bf
hi Comment NONE
hi Comment guifg=#808080
autocmd FileType tex colorscheme one
