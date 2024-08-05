call plug#begin('~/.vim/plugged/')

" General
Plug 'github/copilot.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'airblade/vim-gitgutter'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'segeljakt/vim-silicon'
Plug 'psliwka/vim-smoothie'
Plug 'ggandor/lightspeed.nvim'
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
Plug 'dstein64/vim-startuptime'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'arzg/vim-rust-syntax-ext'
" Plug 'eigenfoo/stan-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kovisoft/slimv' " lisp

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colors
Plug 'gko/vim-coloresque'
Plug 'sainnhe/everforest'
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }

call plug#end()

" set <leader> to space
let mapleader = "\<Space>"


" fzf-lua shortcuts
nnoremap <c-F> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <c-G> <cmd>lua require('fzf-lua').grep()<CR><CR>
set rtp+=/opt/homebrew/opt/fzf

" " colors
set background=dark
let g:everforest_background = 'hard'
colorscheme everforest
" colorscheme nordic

" hi Normal guibg=NONE ctermbg=NONE
" autocmd FileType tex colorscheme one

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
xnoremap ; :
xnoremap : ;

" silicon
vnoremap <leader>s :Silicon<CR>

" quick-save, don't format
nnoremap <leader>W :noa w<CR>
" quick save, format
nnoremap <leader>w :w<CR>

" use <esc> to clear highlighting after a search
nnoremap <silent> <esc> :noh<cr><esc>

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

noremap <leader>f :Files<CR>

let g:gitgutter_grep=''
let g:gitgutter_log=1

set mouse=a

" lisp parentheses colors
let g:lisp_rainbow=1



" coc.nvim node path
let g:coc_node_path = "/Users/js5013/Library/Caches/fnm_multishells/51867_1717013200380/bin/node"
" neovim nodejs path
let g:node_host_prog = "/Users/js5013/Library/Caches/fnm_multishells/51867_1717013200380/bin/node"
" copilot nodejs path
let g:copilot_node_command = "/Users/js5013/Library/Caches/fnm_multishells/51867_1717013200380/bin/node"
" neovim python path
let g:python3_host_prog = "/opt/homebrew/Caskroom/miniconda/base/envs/main/bin/python"


" Window splitting
set splitbelow
set splitright

" Syntax Highlighting
syntax enable
filetype plugin indent on
set nospell

" Semshi Configurations
"let g:semshi#always_update_all_highlights = 1

" alias :Prettier for :CocCommand prettier.formatFile
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Run rustfmt on save
let g:rustfmt_autosave = 1
" format files on save
" map <F3> :Autoformat
" au BufWrite * :Autoformat :Prettier


" Terminal true colors
set termguicolors
set t_CO=256

" Latex stuff
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_view_method = 'skim' " Choose which program to use to view PDF file 
let g:vimtex_view_skim_sync = 1 " Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_activate = 0 " Value 1 allows change focus to skim after command `:VimtexView` is given
nnoremap <leader>v <plug>(vimtex-view)

" focus on neovim after reverse search
function! s:TexFocusVim() abort
  silent execute "!open -a Alacritty"
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventViewReverse call s:TexFocusVim()
augroup END



" UTF-8 Support
set encoding=utf-8

" Fix weird backspace behaviour
set bs=2

" Faster update time
set updatetime=300

nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_width = 25 "30 by default
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file

set completeopt=menuone,longest,noinsert
set completeopt-=preview
set shortmess+=c

let g:completion_timer_cycle = 50
let g:completion_matching_ignore_case = 1
let g:completion_trigger_on_delete = 0

" bottom message display height
set cmdheight=1

" Less delay
set timeout timeoutlen=2000 ttimeoutlen=200

" Undo history
set undodir=~/.vimdid
set undofile

lua require'config'

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_underline = 1

" " Navigating completion list
" " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" " Insert <tab> when previous text is space, refresh completion if not.
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" snippets 

" Press Tab and Shift+Tab and navigate around completion selections
" function! s:check_back_space() abort
"   let col = col('.') -1
"   return !col || getline('.')[col - 1] =~ '\s'
" endfunction

inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <silent><expr> <S-Tab>
  \ coc#pum#visible() ? coc#pum#prev(1) :
  \ CheckBackspace() ? "\<S-Tab>" :
  \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Press Enter to select completion items or expand snippets
inoremap <silent><expr> <cr>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ "\<C-g>u\<CR>"

let g:coc_snippet_next = '<Tab>'              " Use Tab to jump to next snippet placeholder
let g:coc_snippet_prev = '<S-Tab>'            " Use Shift+Tab to jump to previous snippet placeholder


" copilot remap
inoremap <silent> <C-j> <Plug>(copilot-next)
inoremap <silent> <C-k> <Plug>(copilot-previous)
inoremap <silent> <C-l> <Plug>(copilot-suggest)

imap <silent><script><expr> <C-s> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Show actions available at this location
nnoremap <silent> <leader>a <Plug>(coc-codeaction-cursor)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

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

" custom comments for js, jsx
autocmd! BufRead,BufNewFile *.{jsx,jx,js} setlocal filetype=javascript.jsx
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}


" sort imports on save for python
autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')

" Disable formatting for some filetypes
au BufNewFile,BufRead *.stan,*.vert,*.frag let b:autoformat_autoindent=0

" highlight the word TODO
augroup HiglightTODO
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

" Enable incrementing letters
set nrformats+=alpha

" Crontab vim fix
autocmd FileType crontab setlocal nobackup nowritebackup

