call plug#begin('~/.vim/plugged/')
  " General
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-commentary'
  Plug 'machakann/vim-highlightedyank'
  Plug 'jpalardy/vim-slime'
  Plug 'jiangmiao/auto-pairs'

  " Languages
  Plug 'lervag/vimtex'
  Plug 'rust-lang/rust.vim'
  Plug 'arzg/vim-rust-syntax-ext'
  Plug 'eigenfoo/stan-vim'
  Plug 'sheerun/vim-polyglot'

  " Syntax/Highlighting
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

  " Completion 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'tjdevries/lsp_extensions.nvim'
  " Plug 'nvim-lua/completion-nvim'
  " Plug 'nvim-lua/diagnostic-nvim'
  " Plug 'aca/completion-tabnine', { 'do': './install.sh' }

  " Plug 'SirVer/ultisnips'
  " Plug 'epilande/vim-react-snippets'
    
call plug#end()

" disable arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" use ; instead of : to trigger command mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;


" use <esc> to clear highlighting after a search
nnoremap <silent> <esc> :noh<cr><esc>

set mouse=a
" set statusline^=%{coc#status()}

" coc.nvim node path
let g:coc_node_path = '/home/js/.nvm/versions/node/v14.0.0/bin/node'

" vim-slime target
let g:slime_target = "x11"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
let g:slime_python_qtconsole = 1

" Buffer configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Airline theme 
let g:airline_theme='deus'

" Window splitting 
set splitbelow
set splitright

" Syntax Highlighting
syntax on
filetype plugin indent on
set nospell

" Semshi Configurations
"let g:semshi#always_update_all_highlights = 1

" Run rustfmt on save
let g:rustfmt_autosave = 1

" alias :Prettier for :CocCommand prettier.formatFile
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Terminal true colors
if (has("termguicolors"))
  set termguicolors
endif

" Python Provider
let g:python3_host_prog = '/usr/bin/python'

" Latex stuff
let g:tex_flavor = 'latex'
" let g:vimtex_view_method = 'zathura'

" UTF-8 Support
set encoding=utf-8

" Fix weird backspace behaviour
set bs=2

" Faster update time
set updatetime=100

" Nerdtree Configurations
" let g:NERDTreeHijackNetrw=0
map <silent> <C-n> ;NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeMouseMode=3 

set completeopt=menuone,longest,noinsert
set completeopt-=preview
set shortmess+=c

let g:completion_timer_cycle = 50
let g:completion_matching_ignore_case = 1
let g:completion_trigger_on_delete = 0

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
"EOF
"
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


"" auto pop up diagnostics
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
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

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

" Don't wrap lines
set formatoptions-=t
set nowrap

" wrap certain filetypes
au BufNewFile,BufRead *.txt setlocal wrap linebreak nolist
au BufNewFile,BufRead *.tex setlocal wrap linebreak nolist
au BufNewFile,BufRead *.md setlocal wrap linebreak nolist

" Enable incrementing letters
set nrformats+=alpha

" Crontab vim fix
autocmd FileType crontab setlocal nobackup nowritebackup

" Theming
colorscheme gruvbox-dark-hard
hi Normal guibg=NONE ctermbg=NONE
hi Identifier guifg=#a9b0bf
