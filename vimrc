" Ensure that we are in modern vim mode, not backwards-compatible vi mode
set nocompatible
set backspace=indent,eol,start

" Helpful information: cursor position in bottom right, line numbers on left
set ruler
set number

" Enable filetype detection and syntax hilighting
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Show multicharacter commands as they are being typed
set showcmd

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number
set pastetoggle=<F12>

" Get out of insert mode with shortcuts
inoremap jj <Esc>
inoremap kk <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Prevent cursor from stepping back when leaving insert mode
au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" disable beeping/flashing.
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Allow quick recording/playback with qq/Q 
nnoremap Q @q

" This keeps the current visual block selection active after changing indent with '<' or '>'.
" Usually the visual block selection is lost after you shift it, which is incredibly annoying.
vnoremap > >gv
vnoremap < <gv

" Copy to end of line with Y (like C or D).
" Default is to yank whole line with Y. Now only do that with yy
nnoremap Y y$

" Use arrow keys to scroll by one displayed line. (faster gj or gk)
inoremap <up> <C-O>gk
inoremap <down> <C-O>gj
nnoremap <up> gk
nnoremap <down> gj
vnoremap <up> gk
vnoremap <down> gj

" use C-j/C-k in autocomplete lists
" can't use j/k because jj/kk are Esc.
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("<C-k>"))

" use H/L to jump to beginning and end of line
" (ctrl-D and ctrl-U are better than H/L)
nnoremap H ^
nnoremap L $

" Leader
let mapleader = " "
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>m :w<CR> :!make<CR>
nnoremap <silent> <leader>p :w<CR> :!python %<CR>
nnoremap <silent> <leader>l :w<CR> :!pdflatex -halt-on-error -file-line-error -output-directory=$(dirname %) %<CR>
nnoremap <silent> <leader>h :w<CR> :!ghc %<CR>

" Better use of enter, add an empty line after this one.
nnoremap <CR> o<Esc>0d$
" But not in the command window.
autocmd CmdwinEnter * nnoremap <CR> <CR>

" I didn't want to hit F1. I meant escape.
map <F1> <Esc>
imap <F1> <Esc>
vmap <F1> <Esc>

" Move between windows with ctrl k and ctrl j instead of ctrl w w
nnoremap <C-J> <C-w>w
nnoremap <C-K> <C-w>W

" sudo write with w!!
cnoremap w!! w !sudo tee % > /dev/null

" make keyboard mappings timeout quicker
set timeoutlen=300

" Turn the mouse on (at least in xterm).
" Can highlight without grabbing line numbers,
" Can click to move the cursor.
" Can scroll
" You probably only want this on if vim was compiled with xterm_clipboard,
" or else it's hard to copy out of vim.
" set mouse=a

" If I'm writing TeX, it's LaTeX
" I don't know what this changes, though.
let g:tex_flavor='latex'

" TODO
" code folding

" Vundle / Plugins
" From CMUCC talk 2015/02/25 - Vim as an IDE
" https://github.com/jez/vim-as-an-ide
" Installation :
" git clone https://github.com/gmarik/Vundle.vim
" vim +PluginInstall +qall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized' " solarized
Plugin 'scrooloose/syntastic'             " syntastic
Plugin 'scrooloose/nerdtree'              " nerdtree
Plugin 'jistr/vim-nerdtree-tabs'          " nerdtree
Plugin 'airblade/vim-gitgutter'           " gitgutter
Plugin 'tpope/vim-surround'               " surround
call vundle#end()
filetype plugin indent on

" solarized (colorscheme)
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
" Change background to black
hi Normal ctermfg=247 ctermbg=232
hi LineNr ctermfg=241 ctermbg=232
hi clear SignColumn
hi texStatement ctermbg=232

" syntastic (syntax error detection)
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
let g:syntastic_python_python_exec = '/usr/bin/python2.7/'

" nerdtree (file browser)
" Open/close NERDTree Tabs with \t
nnoremap <silent> <leader>t :NERDTreeTabsToggle<CR>

" command line
" enter cmdline-window by default with :, / and ?
set cmdwinheight=3
nn : q:i
vn : q:i
nn / q/i
vn / q/i
nn ? q?i
vn ? q?i
" allow normal cmdline :, / and ?
nn q: :
vn q: :
nn q/ /
vn q/ /
nn q? ?
vn q? ?

" Use <Esc> to exit command window
au CmdwinEnter * nnoremap <Esc> o<CR>
au CmdwinLeave * unmap <Esc>
