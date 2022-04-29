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
Plug 'junegunn/fzf.vim'
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'segeljakt/vim-silicon'
Plug 'sainnhe/everforest'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-repeat'
Plug 'ggandor/lightspeed.nvim'

" Languages
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'eigenfoo/stan-vim'
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'Chiel92/vim-autoformat'
Plug 'tikhomirov/vim-glsl'
Plug 'JuliaEditorSupport/julia-vim'


" Syntax/Highlighting
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Completion
Plug 'neoclide/coc.nvim'
" Plug 'SirVer/ultisnips'
" Plug 'epilande/vim-react-snippets'

call plug#end()

" set <leader> to space
let mapleader = "\<Space>"

" Silicon
let g:silicon = {
      \   'theme':              'Dracula',
      \   'font':                  'Hack',
      \   'background':         '#AAAAFF',
      \   'shadow-color':       '#555555',
      \   'line-pad':                   2,
      \   'pad-horiz':                 80,
      \   'pad-vert':                 100,
      \   'shadow-blur-radius':         0,
      \   'shadow-offset-x':            0,
      \   'shadow-offset-y':            0,
      \   'line-number':           v:true,
      \   'round-corner':          v:true,
      \   'window-controls':       v:true,
      \ }
let g:silicon['output'] = '/home/js/screenshots/{time:%Y-%m-%d.%H-%M-%S.png}'
xnoremap <leader>s :'<,'>Silicon<CR>

" angry reviewer
let g:AngryReviewerEnglish = 'american'
nnoremap <leader>ar :AngryReviewer<cr>

" fugitive shortcuts
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>m :Git commit<CR>
nnoremap <leader>p :Git! push<CR>


" " colors
set background=dark
" let g:everforest_background = 'hard'
" colorscheme everforest
colorscheme flow

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
" set statusline^=%{coc#status()}

" coc.nvim node path
let g:coc_node_path = '/home/js/.nvm/versions/node/v16.4.2/bin/node'
" neovim nodejs path

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
set updatetime=300

nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
" let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_width = 25 "30 by default
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

" Less delay
set timeout timeoutlen=200 ttimeoutlen=50

" Undo history
set undodir=~/.vimdid
set undofile

lua require'config'

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

" copilot remap
inoremap <silent> <C-j> <Cmd>call copilot#Previous()<CR>
inoremap <silent> <C-k> <Cmd>call copilot#Next()<CR>

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

" Theming
" let alt_colorscheme_types = ['.tex']

