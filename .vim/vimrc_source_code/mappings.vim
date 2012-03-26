" In order to get a mapping to include command characters, hit
" C-v while in insert mode and editing this file (if you want to try out
" a command from the ex line before adding it to your .vimrc, use the same
" C-v in ex mode to treat the command character as a literal.


" *** VI MODE ***

" Set C-f and C-d (they are both paging commands I don't use) to fold
" functions and docstrings. These will only work if you have manual foldmethod
" set.
map  :set nowrapscan?defjmf/defkzf'f:set wrapscan
map  :set nowrapscan?"""mf/"""zf'f:set wrapscan
map  Ofrom IPython import embed; embed()
" clipboard cut and paste: can only paste above, unfortunately.
" samething like C-y y should still work correctly, I hope
map  "+P
map  "+y

" *** INSERT MODE ***

" `C-p c` in insert mode will execute the :pc (preview close) command.
" This makes omnicompletion more useful. Not sure if it will help with
" ctags and such.
imap c :pca
" Completion: tab-c will do omni-complete and tab-l will do lines.
inoremap <tab>c 
inoremap <tab>l 
