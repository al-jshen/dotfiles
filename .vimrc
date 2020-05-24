call plug#begin('~/.vim/plugged/')
  " General
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'

  " Languages
  Plug 'sheerun/vim-polyglot'

" Syntax/Highlighting
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

  " Completion 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'
  Plug 'epilande/vim-react-snippets'
    
call plug#end()

set mouse=a
set statusline^=%{coc#status()}

" Buffer configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Window splitting 
set splitbelow
set splitright

" Syntax Highlighting
let python_highlight_all=1
syntax on
set nospell

" Terminal true colors
if (has("termguicolors"))
  set termguicolors
endif

" Python Provider
let g:python3_host_prog = '/usr/bin/python'

" UTF-8 Support
set encoding=utf-8

" Fix weird backspace behaviour
set bs=2

" Semshi Configurations
let g:semshi#always_update_all_highlights = 1

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

" Navigating completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"   

" Line Numbers
set nu

set expandtab       " Convert \t into spaces
set tabstop=2       " The width of a TAB
set shiftwidth=2    " Indent width (when you use >)
set softtabstop=2   " Sets the number of columns for a TAB
set autoindent
set smartindent


" Don't wrap lines
set formatoptions-=t
set nowrap

" wrap .tex files
augroup WrapLineInTeXFile
    autocmd!
    autocmd FileType tex setlocal wrap linebreak nolist
    autocmd FileType txt setlocal wrap linebreak nolist
augroup END

" Enable incrementing letters
set nrformats+=alpha

" Crontab vim fix
autocmd FileType crontab setlocal nobackup nowritebackup

" Theming
set background=dark
colorscheme one
hi Normal guibg=NONE ctermbg=NONE
