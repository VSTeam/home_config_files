" Source file for maps

" Notes: There are some exceptions, but as a rule, at the moment my normal mode
" maps start with <Space>, and my insert-mode imaps start with <c-j> or <c-k>
"
" This does not include my bash emacs shortcuts (in insert and command modes)
" 
" When looking to create (or find) a command, search the help page (:help) to
" see what commands exist and what you might be overwriting. As long as you use
" noremap, the commands you are overwriting should still be available for you
" to remap.

" general-purpose maps --------------------------------------------------------
noremap <CR> :
noremap <c-s> :w<CR>
noremap <Space><Space> :noh<CR>

" clipboard copy and paste. Note paste is before cursor if C-p, after if M-p.
noremap <c-p> "+P
noremap <m-p> "+p
noremap <c-y> "+y

" It bothers my that dd vs D and cc vs C are consistent but not yy vs Y.
" This fixes that.
noremap Y y$

" ctags shortcut for calling devtags only (call distags and bigtags by hand)
noremap <Space>t :!devtags<CR>

" Extension maps --------------------------------------------------------------

" fuzzyfinder: 
noremap <Space> <Nop>
noremap <Space>b :FufBuffer<Enter>
noremap <Space>f :FufFile<Enter>
noremap <Space>d :FufDir<Enter>

" Nerdtree
noremap <Space>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" General purpose insert mode maps --------------------------------------------

" Saving... C-s takes you out of insert mode *and* saves.
inoremap <c-s> <c-c>:w<CR>
" Exiting... ESC and C-c work fine, but kj is faster on most keybards
" Note: as a result, k looks funny when I first type it. Don't worry about it.
inoremap kj <Esc>
" Tab completion, most basic (think about changing this to omni completion)
inoremap <Tab> <c-n>

" Custom imaps leading with C-j -----------------------------------------------
"
inoremap <c-j> <Nop>
" l, t, and o for line, tag, and omni completion. c to close previews.
inoremap <c-j>l <c-x><c-l>
inoremap <c-j>t <c-x><c-]>
inoremap <c-j>o <c-x><c-o>
inoremap <c-j>c <c-c>:pc<CR>a
inoremap <c-j><c-l> <c-x><c-l>
inoremap <c-j><c-t> <c-x><c-l>
inoremap <c-j><c-o> <c-c>:pc<CR>a

" Custom imaps for char insertion, leading with C-k ---------------------------

" Note: Why C-k? Two reasons:
" 1. It is free in normal and command modes, which means I can use it in the
"    same way to avoid bad keys if I need to. This could be most useful in the
"    cases of a, A, {, and z.
" 2. It is really easy to type. In particular, C-k j rivals a for speed.

inoremap <c-k> <Nop>
" d and k, D and K for [ and ], { and } respectively.
inoremap <c-k>f [
inoremap <c-k>d {
inoremap <c-k>j ]
inoremap <c-k>k }
inoremap <c-k><c-t> [
inoremap <c-k><c-d> {
inoremap <c-k><c-y> ]
inoremap <c-k><c-k> }
" e for equal
inoremap <c-k>e =
inoremap <c-k><c-e> =
" j for a, because it is super fast
inoremap <c-k>j a
inoremap <c-k><c-j> a
inoremap <c-k>J A
" n for 1 and N for ~ (the mnemonic are oNe and eNye (from Spanish)
inoremap <c-k>n 1
inoremap <c-k>N ~
" s for z (I wouldn't use this imap, but as a map it could be handy)
inoremap <c-k><c-s> z
inoremap <c-k>s z
inoremap <c-k>S Z

" Custom maps corresponding to the C-k imaps ----------------------------------

noremap <c-k> <Nop>
" d and k, D and K for [ and ], { and } respectively.
noremap <c-k>f [
noremap <c-k>d {
noremap <c-k>j ]
noremap <c-k>k }
noremap <c-k><c-t> [
noremap <c-k><c-d> {
noremap <c-k><c-y> ]
noremap <c-k><c-k> }
" e for equal
noremap <c-k>e =
noremap <c-k><c-e> =
" j for a, because it is super fast
noremap <c-k>j a
noremap <c-k><c-j> a
noremap <c-k>J A
" n for 1 and N for ~ (the mnemonic are oNe and eNye (from Spanish)
noremap <c-k>n 1
noremap <c-k>N ~
" s for z (I wouldn't use this imap, but as a map it could be handy)
noremap <c-k><c-s> z
noremap <c-k>s z
noremap <c-k>S Z

" Bash emacs shortcuts --------------------------------------------------------

" basic movement
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-n> <Down>
inoremap <c-p> <Up>

" slightly more advanced movement
inoremap <m-b> <S-Left>
inoremap <m-f> <S-Right>
inoremap <c-a> <Esc>I
inoremap <c-e> <Esc>A

" deletion: note that I skip C-Rubout (<c-BS>) because <BS> works fine.
"   Notes:
"     M-d should work under most circumstances, but it could occasionally 
"         result in funny cursor placement.
"     Using C-k requires an additional k because I used C-k for char insertion
inoremap <m-BS> <c-w>
inoremap <c-d> <Del>
inoremap <m-d> <Esc>lcw
inoremap <c-u> <Esc>lc^
inoremap <c-k>k <Esc>lc$
inoremap <c-k><c-k> <Esc>lc$

" undo within-line edits (not impt in vim, but impt in bash so I included it)
inoremap <c-x><c-u> <c-u>

" Bash emacs shortcuts for command line mode ----------------------------------

" basic movement
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-n> <Down>
cnoremap <c-p> <Up>

" slightly more advanced movement
cnoremap <m-b> <S-Left>
cnoremap <m-f> <S-Right>
cnoremap <c-a> <c-b>
cnoremap <c-e> <c-e>

" deletion: note that I skip C-Rubout (<c-BS>) because <BS> works fine.
"   Notes:
"     M-d won't work (vim has no equiv command)
"         result in funny cursor placement.
"     C-u and C-k delete big chunks, but not necessarily everything
inoremap <m-BS> <c-w>
inoremap <c-d> <Del>
inoremap <c-u> <c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w>
inoremap <c-k> <Del><Del><Del><Del><Del><Del><Del><Del><Del><Del><Del><Del>

" ****************************
" Stuff that needs to be moved
" ****************************

" Breakpoint. This really belongs in a filetype source file.
noremap <Space>p Oimport pudb; pudb.set_trace()<c-s>
inoremap <c-j>p <CR>import pudb; pudb.set_trace()
