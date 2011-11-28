" Indent and tab, line numbers
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
filetype indent on
set nu

" Highlight characters after column 79 (PEP8)
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" Search as you type, highlight result
set incsearch
set hlsearch

" Set shell title---handy way to see file name and directory. Restore on exit.
" (Restore works for me on gnome-terminator but not gnome-terminal.)
set title
set titleold=""

" Nerdtree: Toggle nerdtree with F2; ignore *.pyc files
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" pyflakes-vim needs this
filetype plugin indent on

" MiniBufExpl plugin stuff: I still need to figure the keys out
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" omnicompletion stuff: when in insert mode, use C-x C-o
filetype plugin on
set ofu=syntaxcomplete#Complete

" tagslist stuff
let Tlist_Ctags_Cmd='/usr/bin/ctags'
map T :TaskList<CR>
map P :TlistToggle<CR>
