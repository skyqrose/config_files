set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"""
" Settings
"""

set tabstop=2
set shiftwidth=2
set expandtab
set number
set pastetoggle=<F12>

" Prevent cursor from stepping back when leaving insert mode
au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" disable beeping/flashing.
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" make keyboard mappings timeout quicker
set timeoutlen=300

" disable modlines to prevent security vulnerability
set modelines=0
set nomodeline

"""
" Aliases
"""

" Get out of insert mode with shortcuts
inoremap jj <Esc>
inoremap kk <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

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

" use H/L to jump to beginning and end of line
" (ctrl-D and ctrl-U are better than H/L)
nnoremap H ^
nnoremap L $

" Leader
let mapleader = " "
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>

" I didn't want to hit F1. I meant escape.
map <F1> <Esc>
imap <F1> <Esc>
vmap <F1> <Esc>

" Move between windows with ctrl k and ctrl j instead of ctrl w w
nnoremap <C-J> <C-w>w
nnoremap <C-K> <C-w>W

" sudo write with w!!
cnoremap w!! w !sudo tee % > /dev/null

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

"""
" Plugins
"""

" dein install
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.cache/dein
" To install plugins after changing the list
" :call dein#install()
" To remove plugins after changing the list
" :call map(dein#check_clean(), "delete(v:val, 'rf')")
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('scrooloose/nerdtree') |
        \ call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-surround')

  call dein#end()
  call dein#save_state()
endif

" Install missing plugins on startup
if dein#check_install()
  call dein#install()
endif

" deoplete
" use C-j/C-k in autocomplete lists
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "<C-k>"

" nerdtree (file browser)
" Open/close NERDTree Tabs with <leader>t
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
