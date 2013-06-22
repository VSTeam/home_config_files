" LIST OF BASH EMACS BINDINGS
"
" Arrow keys: C-b, C-f, C-n, C-p
" Word movement: M-f, M-b
" Line beginning/end: C-a, C-e
" Character deletion (back/fwd): Rubout(backspace), Del(fwdel)
" Word deletion (back/fwd): M-Rubout, M-Del
" Line deletion back/forward from cursor: C-u, C-k
" Paste (emacs yank) last deletion: C-y
" Undo within-line edits: C-xC-u

" Insert Mode -----------------------------------------------------------------
"
" Skipped: C-y, C-xC-u

" movement
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-n> <Down>
inoremap <c-p> <Up>
inoremap <m-b> <S-Left>
inoremap <m-f> <S-Right>
inoremap <c-a> <Esc>I
inoremap <c-e> <Esc>A
" deletion
inoremap <m-BS> <c-w>
inoremap <m-Del> <Esc>lcw
inoremap <c-u> <Esc>lc^
inoremap <c-k> <Esc>lC

" missing but important in the shell is C-y, which pastes the last deletion.

" Command Mode ----------------------------------------------------------------
"
" Skipped: C-y, C-xC-u, M-Del (there's no way to get M-Del in ex mode)

" movement
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-n> <Down>
cnoremap <c-p> <Up>
cnoremap <m-b> <S-Left>
cnoremap <m-f> <S-Right>
cnoremap <c-a> <c-b>
cnoremap <c-e> <c-e>

" deletion
cnoremap <m-BS> <c-w>
cnoremap <c-u> <c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w>
cnoremap <c-k> <Del><Del><Del><Del><Del><Del><Del><Del><Del><Del><Del><Del>

