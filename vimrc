set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
filetype off

"""""""""""""""Vundle"""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
let path='~/.vim/bundle'
call vundle#begin(path)
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'ivanov/vim-ipython'
Plugin 'pep8'
Plugin 'luochen1990/rainbow'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Townk/vim-autoclose'
Plugin 'supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'kien/ctrlp.vim'
let g:rainbow_active = 1

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""""""""""""""""""""""""""""""""""""

set path+=%USERPROFILE%/Desktop/**

"""""""""""""""Mappings"""""""""""""

" Fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
"nnoremap <space>ge :Gedit<CR>
"nnoremap <space>gr :Gread<CR>
"nnoremap <space>gw :Gwrite<CR><CR>
"nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
"nnoremap <space>gp :Ggrep<Space>
"nnoremap <space>gm :Gmove<Space>
"nnoremap <space>gb :Git branch<Space>
"nnoremap <space>go :Git checkout<Space>
"nnoremap <space>gps :Dispatch! git push<CR>
"nnoremap <space>gpl :Dispatch! git pull<CR>
 
" Select the last pasted text
nnoremap gp `[v`]

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Vim book pg 202. supposed to :noh on C-l.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"Full Timestamp
:nnoremap <F2> "=strftime("%m/%d/%y %X")<CR>P
:inoremap <F2> <C-R>=strftime("%m/%d/%y %X")<CR>

"Date Timestamp
:nnoremap <F3> "=strftime("%a %m/%d/%y")<CR>P
:inoremap <F3> <C-R>=strftime("%a %m/%d/%y")<CR>
let mapleader=","

" Swap s and l because dvorak.  Still testing this.
noremap s l
noremap l s

" Fast saving
nmap <leader>w :w!<cr>

" Latex-suite interferes with <c-j> mapping
"imap <C-space> <Plug>IMAP_JumpForward
" ?
let g:BASH_Ctrl_j = 'off'

" Move around splits easily
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h


" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Easier normal mode
inoremap <S-CR> <Esc>
"inoremap aa <Esc>
inoremap hh <Esc>

" Undo without first leaving insert mode.  Maybe a bad idea.
inoremap uu <Esc>u

" use +/- to increment/decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>

" move by screen lines, not by real lines - great for creative writing
nnoremap j gj
nnoremap k gk
" also in visual mode
xnoremap j gj
xnoremap k gk

map <F2> :NERDTreeToggle<CR>

" insert a blank line with <leader>o and <leader>O
nnoremap <silent> <leader>o o<ESC>
nnoremap <silent> <leader>O O<ESC>

"""""""""""""""""""""""""""""""""""""
" ms to wait for multikey commands in insert mode
:autocmd InsertEnter * set timeoutlen=300
:autocmd InsertLeave * set timeoutlen=1000
"set timeoutlen=300


" Stop autocomplete from scanning Tags and Included files
set complete-=t,i

function! Autosave()
  exe ":au FocusLost * :w"
endfunction

" This is supposed to stop rope from killing computer in pymode
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

set ignorecase
set smartcase

if has('win32')
    let $TMP="C:/tmp"
    set directory=.,$TMP,$TEMP
    " Screw backup file
    " set nobackup
    " set nowb
    set dir=C:/tmp/
endif

set wildmenu
set wildmode=list:longest,full

" Auto reload when file is changed from outside
set autoread

set history=700

set noerrorbells

set cpoptions+=$
"set virtualedit=all                        


set number
syntax on

set tabstop=8 expandtab shiftwidth=4 softtabstop=4 shiftround autoindent

set background=dark
"colors blackboard
colors ron
"colors solarized


" Automatic reloading of _vimrc
autocmd! bufwritepost _vimrc source %
""""""""""""""""""""""""""""""""""""
"""""""""""""Things I actually want from mswin.vim""""""""

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all, except in normal modh
"noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""Example vimrc had this stuff """"""""""""""""
set diffexpr=
"set diffexpr=MyDiff()
"function MyDiff()
   "let opt = '-a --binary '
   "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
   "let arg1 = v:fname_in
   "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   "let arg2 = v:fname_new
   "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   "let arg3 = v:fname_out
   "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   "if $VIMRUNTIME =~ ' '
     "if &sh =~ '\<cmd'
       "if empty(&shellxquote)
         "let l:shxq_sav = ''
         "set shellxquote&
       "endif
       "let cmd = '"' . $VIMRUNTIME . '\diff"'
     "else
       "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     "endif
   "else
     "let cmd = $VIMRUNTIME . '\diff'
   "endif
   "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   "if exists('l:shxq_sav')
     "let &shellxquote=l:shxq_sav
   "endif
 "endfunction

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
