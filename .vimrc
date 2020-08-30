call plug#begin('~/.vim/plugged/')
  " General
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'

  " Languages
  Plug 'sheerun/vim-polyglot'
  Plug 'lervag/vimtex'
  Plug 'rust-lang/rust.vim'
  Plug 'arzg/vim-rust-syntax-ext'

" Syntax/Highlighting
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

  " Completion 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'SirVer/ultisnips'
  " Plug 'epilande/vim-react-snippets'
    
call plug#end()

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set mouse=a
set statusline^=%{coc#status()}

" coc.nvim node path
let g:coc_node_path = '/home/js/.nvm/versions/node/v14.0.0/bin/node'

" Buffer configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Airline theme 
let g:airline_theme='wombat'

" Window splitting 
set splitbelow
set splitright

" Syntax Highlighting
syntax on
set nospell

" Semshi Configurations
"let g:semshi#always_update_all_highlights = 1

" Run rustfmt on save
let g:rustfmt_autosave = 1

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
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeMouseMode=3 

set completeopt=longest,menuone
set completeopt-=preview
filetype plugin on
"set omnifunc=syntaxcomplete#Complete

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Navigating completion list
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Line Numbers
set relativenumber
set number

set noexpandtab       " Convert \t into spaces
"set tabstop=4       " The width of a TAB
set shiftwidth=4    " Indent width (when you use >)
set softtabstop=4   " Sets the number of columns for a TAB
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
colorscheme one
hi Normal guibg=NONE ctermbg=NONE
hi Identifier guifg=#a9b0bf
