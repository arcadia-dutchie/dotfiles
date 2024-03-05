" Eanble filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed externally
set autoread
au FocusGained,BufEnter * checktime

" Use the space key as our map leader.  So that vim doesn't
" interpret it as a literal space and move the cursor, we
" map space to a no-operation in normal mode.
nnoremap <SPACE> <Nop>
let mapleader = " "

" The following set up the foundation of file-searching.
"
" The RG command opens a new vertical pane containing output
" from running `rg` against your input arguments.  By default,
" the buffer will only list files containing the text found and
" not include the matched text itself.
" This is useful for finding definitions of classes, methods, etc.
"
" The FD command opens a new vertical pane containing output
" from running the `fd` command against your input arguments.
" This is basically just a simpler and faster way of invoking `find`.
"
" The <leader>f binding will open the file under the cursor in a
" new horizontal pane.  This plays nicely with the longer vertical
" pane opened by RG and FD.  Since the two commands list files on
" separate lines, vim doesn't have a hard time finding the end of the
" filename.
command -nargs=+ RG :vnew | :r ! rg -l <args> .
command -nargs=+ FD :vnew | :r ! fdfind <args>
nnoremap <leader>f <c-w>f

" Toggle NerdTree with a leader shortcut
nnoremap <leader>n :NERDTreeToggle<CR>

" Highlight the current position
set ruler

" Small command bar
set cmdheight=1

" Make sure backspace acts the way we expect
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching, try to be smart about casing
set smartcase

" Highlight search results
set hlsearch

" Make search act like it does in browsers
set incsearch

" Don't redraw while executing macros
set lazyredraw

" Better regular expressions
set magic

" Show matching brackets
set showmatch

" Turn off annoying error bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable

" Set utf-8 as the default encoding
set encoding=utf8

" Use spaces instead of tabs and configure width
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai   " Auto indent
set si   " Smart indent
set wrap " Wrap lines

" Use relative linenumbers
set number
set relativenumber

" Map jj as an alternative to esc
inoremap jj <ESC>

" Move between windows with qw+hjkl
nnoremap qwh :wincmd h<CR>
nnoremap qwj :wincmd j<CR>
nnoremap qwk :wincmd k<CR>
nnoremap qwl :wincmd l<CR>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'

call plug#end()

let g:LanguageClient_serverCommands = {
      \ 'ruby': ['bundle', 'exec', 'srb', 'tc', '--lsp']
      \ }

