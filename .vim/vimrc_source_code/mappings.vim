" In order to get a mapping to include command characters, hit
" C-v while in insert mode and editing this file (if you want to try out
" a command from the ex line before adding it to your .vimrc, use the same
" C-v in ex mode to treat the command character as a literal.


" *** VI MODE ***

" Set C-b to insert a breakpoint.
map  Oimport pudb; pudb.set_trace()
" clipboard cut and paste: can only paste above, unfortunately.
" samething like C-y y should still work correctly, I hope
map  "+P
map  "+y

" fuzzyfinder: 
"     C-a will look at (a)ll buffers
"     C-d will look at (d)irectories
"     C-f will look at (f)iles
map  :FufBuffer
map  :FufFile
map  :FufDir

" *** INSERT MODE ***

" `C-p c` in insert mode will execute the :pc (preview close) command.
" This makes omnicompletion more useful. Not sure if it will help with
" ctags and such.
imap c :pca
" Completion... C-l and C-o can be used for C-x C-l and C-x C-o
inoremap  
