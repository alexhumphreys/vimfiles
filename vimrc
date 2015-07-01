" sort tabs out
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" sort out backspace
set backspace=2
"
" leader
let mapleader = " "

" sort out backspace and undo
set nocompatible

" hide defaultmode
set t_Co=256
colorscheme badwolf

" first, enable status line always
" set laststatus=2

" kill trailing whitspace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python,yaml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" show insert mode
set showmode

" pathogen
execute pathogen#infect()
"syntax on
"filetype plugin indent on

" 'Focus' on new split
set splitright

" backup/swap/undo {{{2

let s:dir = has('win32') ? '$APPDATA/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim' 

if !isdirectory(expand(s:dir))
  call mkdir(expand(s:dir))
endif
if !isdirectory(expand(s:dir) . '/swap/')
  call mkdir(expand(s:dir) . '/swap/')
endif
if !isdirectory(expand(s:dir) . '/backup/')
  call mkdir(expand(s:dir) . '/backup/')
endif
if !isdirectory(expand(s:dir) . '/undo/')
  call mkdir(expand(s:dir) . '/undo/')
endif

let &directory = expand(s:dir) . '/swap//,' . &directory
let &backupdir = expand(s:dir) . '/backup//,' . &backupdir

if exists('+undodir')
  let &undodir = expand(s:dir) . '/undo//,' . &undodir
endif

set backup
set swapfile

if exists('+undofile')
  set undofile
endif

" cursorline to black
set cursorline
hi CursorLine    cterm=NONE ctermbg=237

" statusline to black
"hi StatusLine ctermbg=NONE ctermfg=16
hi StatusLine    ctermfg=15  ctermbg=237 cterm=NONE
hi StatusLineNC  ctermfg=8  ctermbg=16  cterm=NONE
hi VertSplit     ctermfg=16  ctermbg=237 cterm=NONE

" turn on rainbow braces
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'firebrick', 'royalblue3'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'yml': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" html
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sensible'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-repeat'
Plug 'chase/vim-ansible-yaml'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'honza/dockerfile.vim'
call plug#end()

"sytastic
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['python', 'pep8']

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
