" The following bindings should work in all modes.


" Disable problem keys. -------------------------------------------------------
" This really needs to go in a function so I can switch.


function DisableKeys()

    noremap a <Nop>
    noremap A <Nop>

    inoremap a <Nop>
    inoremap A <Nop>
    inoremap / <Nop>
    inoremap = <Nop>
    inoremap 1 <Nop>
    inoremap 0 <Nop>
    inoremap [ <Nop>
    inoremap ] <Nop>
    inoremap { <Nop>
    inoremap } <Nop>

    cnoremap a <Nop>
    cnoremap A <Nop>
    cnoremap / <Nop>
    cnoremap = <Nop>
    cnoremap 1 <Nop>
    cnoremap 0 <Nop>
    cnoremap [ <Nop>
    cnoremap ] <Nop>
    cnoremap { <Nop>
    cnoremap } <Nop>

endfunction

function EnableKeys()

    noremap a a
    noremap A A

    inoremap a a
    inoremap A A
    inoremap / /
    inoremap = =
    inoremap 1 1
    inoremap 0 0
    inoremap [ [
    inoremap ] ]
    inoremap { {
    inoremap } }

    cnoremap a a
    cnoremap A A
    cnoremap / /
    cnoremap = =
    cnoremap 1 1
    cnoremap 0 0
    cnoremap [ [
    cnoremap ] ]
    cnoremap { {
    cnoremap } }
endfunction

" main bindings section -------------------------------------------------------

" these are positional. They are the only <c- > commands here
noremap <c-j> a
noremap <c-l> A
" mnemonics are seaRch or Ratio, Equals, roman numeral I, zerOh
noremap <m-r> /
noremap <m-e> =
noremap <m-i> 1
noremap <m-o> 0
" mnemonics are Slice and idX
noremap <m-s> [
noremap <m-x> ]
" mnemonics are that J looks like trebel cleff and m is Music (think staves)
noremap <m-j> {
noremap <m-m> }

inoremap <c-j> a
inoremap <c-l> A
inoremap <m-r> /
inoremap <m-e> =
inoremap <m-i> 1
inoremap <m-o> 0
inoremap <m-s> [
inoremap <m-x> ]
inoremap <m-j> {
inoremap <m-m> }

cnoremap <c-j> a
cnoremap <c-l> A
cnoremap <m-r> /
cnoremap <m-e> =
cnoremap <m-i> 1
cnoremap <m-o> 0
cnoremap <m-s> [
cnoremap <m-x> ]
cnoremap <m-j> {
cnoremap <m-m> }

" Special case: colon ---------------------------------------------------------

" <m-k> generates a colon. In normal mode, <c-k> goes to command window.
noremap <c-k> q:i
noremap <m-k> :
inoremap <m-k> :
cnoremap <m-k> :
