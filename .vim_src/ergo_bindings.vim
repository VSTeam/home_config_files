" The following bindings should work in all modes.
"
" The only normal mode commands hidden here are
"     <c-u> : opposite <c-d>, scrolls a half-screen up
"     <c-i> : equivalent to <Tab>, has something to do w the jump list
"     <c-o> : also related to jump list

" Remember, : is not mapped because it is on 2nd finger of right hand.


" mnemonically justified
"   Semicolon
"   equaL
"   Divide
"   Wxy -> z
"   questiOn
noremap <m-s> ;
noremap <c-l> =
noremap <m-w> z
noremap <m-d> /
noremap <c-o> ?
" positionally justified
"   j and f are easy, and A comes before a
"   r and u are on opposite sides, and e and i are further to the outside
noremap <c-j> a
noremap <m-f> A
noremap <c-r> [
noremap <c-u> ]
noremap <c-e> {
noremap <c-i> }

inoremap <m-s> ;
inoremap <c-l> =
inoremap <m-w> z
inoremap <m-d> /
inoremap <c-o> ?
inoremap <c-j> a
inoremap <m-f> A
inoremap <c-r> [
inoremap <c-u> ]
inoremap <c-e> {
inoremap <c-i> }

cnoremap <m-s> ;
cnoremap <c-l> =
cnoremap <m-w> z
cnoremap <m-d> /
cnoremap <c-o> ?
cnoremap <c-j> a
cnoremap <m-f> A
cnoremap <c-r> [
cnoremap <c-u> ]
cnoremap <c-e> {
cnoremap <c-i> }
