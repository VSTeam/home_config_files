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
    inoremap [ <Nop>
    inoremap { <Nop>

    cnoremap a <Nop>
    cnoremap A <Nop>
    cnoremap / <Nop>
    cnoremap = <Nop>
    cnoremap 1 <Nop>
    cnoremap [ <Nop>
    cnoremap { <Nop>

endfunction

function EnableKeys()

    noremap a a
    noremap A A

    inoremap a a
    inoremap A A
    inoremap / /
    inoremap = =
    inoremap 1 1
    inoremap [ [
    inoremap { {

    cnoremap a a
    cnoremap A A
    cnoremap / /
    cnoremap = =
    cnoremap 1 1
    cnoremap [ [
    cnoremap { {

endfunction


" main bindings section -------------------------------------------------------

" avoid a and A. These are the only ctrl- commands here.
noremap <c-j> a
noremap <c-l> A
" mnemonics are Ratio, Equals, the roman numeral I, Straight, and Curly
"   Note: it's possible that I should be mapping so that these work in replaces
"         and in movement commands.
noremap <m-r> /
noremap <m-e> =
noremap <m-i> 1
noremap <m-s> [
noremap <m-c> {

inoremap <c-j> a
inoremap <c-l> A
inoremap <m-r> /
inoremap <m-e> =
inoremap <m-i> 1
inoremap <m-s> [
inoremap <m-c> {

cnoremap <c-j> a
cnoremap <c-l> A
cnoremap <m-r> /
cnoremap <m-e> =
cnoremap <m-i> 1
cnoremap <m-s> [
cnoremap <m-c> {


" Special case: colon ---------------------------------------------------------

" <m-k> generates a colon. In normal mode, <c-k> goes to command window.
noremap <c-k> q:i
noremap <m-k> :
inoremap <m-k> :
cnoremap <m-k> :
