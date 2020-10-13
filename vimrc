" Plugins{{{
"" enable pathogen package manager
    execute pathogen#infect()
    call pathogen#helptags()
    filetype plugin indent on

"" enable mode lines, file specific configurations
    set modelines=1

"" enable markown preview in vim
    let vim_markdown_preview_github=1

" NERDTree"{{{
"" enable NERDTree on start up and move cursor to file on vim opening instead of
"" NERDTree
    autocmd vimenter * NERDTree
    autocmd VimEnter * wincmd p

"" toggle NERDTree
    map <C-n> :NERDTreeToggle<CR>

"" Autoclose NERDTree buffer when it's the last one opened
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}

" vim-pandoc"{{{
"" disable conceal from vim-pandoc-syntax
    let g:pandoc#syntax#conceal#use=0

"}}}

" }}}

" Colours and UI{{{
"" enable dark background
        set background=dark
    "let g:rehash256 = 1
        colorscheme molokai

"" enable 256 colours
        set t_Co=256

"" enable syntax highlighting
        syntax enable

"" forces txt files with pandoc highlight
        autocmd BufNewFile,BufRead *.txt set syntax=pandoc
        autocmd BufNewFile,BufRead *.txt set filetype=pandoc

"" enable cursorline and cursor column
        set cursorline
        set cursorcolumn

"" enable hybrid line numbering
        set number relativenumber

"" enable auto relativenumber/number
        augroup numbertoggle
          autocmd!
          autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
          autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
        augroup END

"" enable graphical autocompletion for files
    set wildmenu

"" show matching parenthesis
    set showmatch

"" show partial commands
    set showcmd

"" show max column length
    set textwidth=80
    set colorcolumn=81
    highlight colorcolumn ctermbg=red

"}}}

" Folding{{{
"" enable folding
    set foldenable
    set foldlevel=0
    set foldmethod=marker

"" open 10 levels of folds
    set foldlevelstart=10

"" max 10 levels of nested folds
    set foldnestmax=10

"}}}

" Misc{{{

"" enable auto changing directory
"    set autochdir
    autocmd BufEnter * silent! lcd %:p:h

"" enable clinking links in vim
        set mouse=a

"" enable autoindent
        set autoindent

"" set tabs as 4 spaces
        set expandtab
        set tabstop=4
        set softtabstop=4

"" enable file specific indentation
    filetype indent on

"" enable utf-8 encoding
    set encoding=utf-8

"" set spellcheck
    autocmd FileType pandoc setlocal nospell
    set nospell
    set spelllang=en
    "set spellfile=~/.vim/spell/en/.utf-8.spl

"" disable octal numbering
    set nrformats-=octals

"}}}

" Key remaps{{{

"" Make j and k move to the next row, not file line
    nnoremap j gj
    nnoremap k gk

"" Keep search results at the center of screen
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap * *zz
    nnoremap # #zz
    nnoremap g* g*zz
    nnoremap g# g#zz

"" Auto close parenthesis, brackets et al.
    inoremap ( ()<Esc>i
    inoremap { {}<Esc>i
    inoremap [ []<Esc>i
    inoremap ' ''<Esc>i
    inoremap " ""<Esc>i
"}}}

" Search{{{
"" search as characters are entered
    set incsearch

"" highlight search results
    set hlsearch

"" Search case insensivity
    set ignorecase

"" Override ignorecase if pattern contains upcase
    set smartcase

"" Enable wrap search
    set wrapscan

"}}}

" Backup, Swap and Undo{{{

    set backup
    set backupdir=~/.vim/backup//

    set directory=~/.vim/swap//

    set undofile
    set undodir=~/.vim/undo//

"}}}

" Python and Powerline{{{
""" enable python3 and powerline from python3 package
""    let g:powerline_pycmd="py3"
""    let g:powerline_pyeval="py3eval"
""    let $PYTHONPATH='/usr/bin/python3'
""    python3 from powerline.vim import setup as powerline_setup
""    python3 powerline_setup()
""    python3 del powerline_setup
"" enable powerline from powerline package
    set rtp+=/usr/share/powerline/bindings/vim
"" enable powerline from first window and powerline symbols
    set laststatus=2
    let g:Powerline_symbols = 'fancy'
""}}}

" Sourcing {{{ 
" "Source the .vimrc file after saving
    autocmd! bufwritepost ~/.vimrc source %
"}}}

