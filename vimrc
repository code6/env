"
" MAIN CUSTOMIZATION FILE
"

" Enable loading filetype and indentation plugins
filetype on
filetype plugin on
filetype indent on

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Use 4 spaces for edit tab by <Tab> or <BS>
set softtabstop=4

" Use smart indent
set smartindent

" Use auto indent
set autoindent

" Use Vim defaults (much better!)
set nocompatible	

" Turn syntax highlighting on
syntax on

"
" GLOBAL SETTINGS
"

"set mouse=a [disable this for copying in vim]

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
" set history=100

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Allow backspacing over everything
set backspace=indent,eol,start

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status line
set ruler

" Expand tab
set expandtab 

:colorscheme evening

" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" au BufWinEnter * let w:m2=matchadd('OverLength', '\%>80v.\+', -1)


"
" MAPPINGS
"

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Save changes
map ,s :w<CR>
" Exit vim without saving any changes
map ,q :q!<CR>

" Map ,f to display all lines with keyword under cursor and ask which one to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Page down with <Space>
nmap <Space> <PageDown>

" Use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>

" Open filename under cursor in a new tab (use current file's working
" directory) 
nmap gf :tabnew %:p:h/<cfile><CR>

" Insert mode shortcut
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <DELETE>

" Command line
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

"
" Tab Config
"

" Switch tabs
nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

" save a read-only file in vim using sudo
cmap w!! %!sudo tee > /dev/null %

"
" Plugin
"
call pathogen#infect()

" NerdTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"hide pyc && others
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$']

" Pydiction
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'


"
" PHP
"

let php_folding = 1 

:autocmd BufRead,BufNewFile *.py set expandtab tabstop=4 shiftwidth=4 autoindent smartindent

