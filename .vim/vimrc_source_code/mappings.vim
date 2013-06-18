" In order to get a mapping to include command characters, hit
" C-v while in insert mode and editing this file (if you want to try out
" a command from the ex line before adding it to your .vimrc, use the same
" C-v in ex mode to treat the command character as a literal.


" *** VI MODE ***

" clipboard cut and paste: can only paste above, unfortunately.
" samething like C-y y should still work correctly, I hope
map <c-p> "+P
map <c-y> "+y
" It bothers my that dd vs D and cc vs C are consistent but not yy vs Y.
" This fixes that.
map Y y$
" windows... if you are using fugitive, omni-completion, tag-chasing with
" splitting, or a few other tools, you wind up having to close windows a lot.
" This sets the easy-to-grab C-u (unopen is my questionable mnemonic) to do
" C-w c
map <c-u> <c-w>c

" fuzzyfinder: 
map <Space> <Nop>
map <Space>b :FufBuffer<Enter>
map <Space>f :FufFile<Enter>
map <Space>d :FufDir<Enter>

" Nerdtree
map <Space>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" highlighting and breakpoints (really breakpoints should be filetype)
map <Space><Space> :noh<Enter>

" C-s saves. I do this mostly because I get :q in so many files.
noremap <c-s> :w

" *** INSERT MODE ***

" `C-p c` in insert mode will execute the :pc (preview close) command.
" This makes omnicompletion more useful. Not sure if it will help with
" ctags and such.
imap c :pca
" Completion... C-l can be used for C-x C-l
inoremap <c-l> <c-x><c-l>
" Saving... C-s takes you out of insert mode *and* saves.
inoremap <c-s> <c-c>:w

" Breakpoint. This really belongs in a filetype source file.
map <Space>p Oimport pudb; pudb.set_trace()<c-s>
