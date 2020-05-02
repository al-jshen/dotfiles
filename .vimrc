call plug#begin('~/.vim/plugged/')
    " General
	"Plug 'vim-syntastic/syntastic'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'

    " Syntax/Highlighting
    Plug 'sheerun/vim-polyglot'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

    " Completion 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Snippets, mostly for React 
    "Plug 'SirVer/ultisnips'
    " Plug 'mlaursen/vim-react-snippets'
    " Plug 'epilande/vim-es2015-snippets'


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

" Line Numbers
set nu

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
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
colorscheme nord-modified
hi Normal guibg=NONE ctermbg=NONE
