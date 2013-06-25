" The following bindings should work in all modes.

" main bindings section -------------------------------------------------------

" these are positional. They are the only <c- > commands here
noremap <c-j> a
noremap <c-l> A
" mnemonics are seaRch or Ratio, Equals, roman numeral I, zerOh
noremap <m-r> /
noremap <m-e> =
noremap <m-i> 1
noremap <m-o> 0
" mnemonics are Slice and Dict, and for x and c, idX and Curly (or the fact
" that x and c are under s and d)
noremap <m-s> [
noremap <m-x> ]
noremap <m-d> {
noremap <m-c> }

inoremap <c-j> a
inoremap <c-l> A
inoremap <m-r> /
inoremap <m-e> =
inoremap <m-i> 1
inoremap <m-o> 0
inoremap <m-s><m-e> [
inoremap <m-s><m-r> ]
inoremap <m-d><m-e> {
inoremap <m-d><m-r> }
inoremap <m-s> [
inoremap <m-x> ]
inoremap <m-d> {
inoremap <m-c> }

cnoremap <c-j> a
cnoremap <c-l> A
cnoremap <m-r> /
cnoremap <m-e> =
cnoremap <m-i> 1
cnoremap <m-o> 0
cnoremap <m-s> [
cnoremap <m-x> ]
cnoremap <m-d> {
cnoremap <m-c> }

" Special case: colon ---------------------------------------------------------

" <m-k> generates a colon. In normal mode, <c-k> goes to command window.
noremap <c-k> q:i
noremap <m-k> :
inoremap <m-k> :
cnoremap <m-k> :
