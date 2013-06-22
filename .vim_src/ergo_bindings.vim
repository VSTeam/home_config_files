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
" mnemonics are Slice and Dict, lEft and Right
noremap <m-s><m-e> [
noremap <m-s><m-r> ]
noremap <m-d><m-e> {
noremap <m-d><m-r> }

inoremap <c-j> a
inoremap <c-l> A
inoremap <m-s> /
inoremap <m-e> =
inoremap <m-i> 1
inoremap <m-o> 0
inoremap <m-s><m-e> [
inoremap <m-s><m-r> ]
inoremap <m-d><m-e> {
inoremap <m-d><m-r> }

cnoremap <c-j> a
cnoremap <c-l> A
cnoremap <m-s> /
cnoremap <m-e> =
cnoremap <m-i> 1
cnoremap <m-o> 0
cnoremap <m-s><m-e> [
cnoremap <m-s><m-r> ]
cnoremap <m-d><m-e> {
cnoremap <m-d><m-r> }

" Special case: colon ---------------------------------------------------------

" <m-k> generates a colon. In normal mode, <c-k> goes to command window.
noremap <c-k> q:i
noremap <m-k> :
inoremap <m-k> :
cnoremap <m-k> :
