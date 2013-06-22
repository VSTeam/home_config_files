" Source file for maps

" Notes: (on available keys)
"
" In Normal mode, few keys are free...
" <Space>, <Backspace>, \, and C-[ are free.
" C-{hjkl} are free: I checked, and window commands are not affected by
" remapping these.
" ---
" Virtually any alt key is free.
" ---
" <Tab> is used in the jump list. I should check whether it is important
" before doing any mappings.
"
" In command line and insert mode, the following are reserved for bash emacs
" <c-b>, <c-f>, <c-n>, <c-p>, <m-b>, <m-f>, <c-a>, <c-e>, <m-BS>, <c-d>, <m-d>
" <c-k>, <c-u>
"
" Furthermore, in insert mode <C-t> and <M-t> are reserved for tabbing
" Feel free to imap all other insert mode C and M combinations, and also Tab.
" (C-t is builtin, M-t is a remapping of C-d, which I need for bash emacs)
"
" Furthermore in command mode <C-j> is reserved for jumping to the command line
" window (this is a remapping of <C-f>) and <Tab> is reserved for command-line
" completion. Other keys are free to remap *BUT* I'd prefer to keep my
" command-line close to the bash shell.
" 
" The <Del> key is free in all modes in the sense that x or <c-d> do the same
" thing.


" Note: in insert mode, C-t and M-t are reserved for tabbing. Aside from
" these and the bash commands, all other M and C combinations are available
" for imaps, as is <Tab>


" TODO
"
"
" ALL OF THIS NEEDS TO BE RETHOUGHT.
"
" IN INSERT MODE, I CAN WORK WITH ALMOST ANY META OR CONTROL KEY NOT USED IN 
"     EMACS OR ERGO. TAB IS ALSO AVAILABLE DEPENDING.
"     THE ONLY BUILTINS I REALLY NEED ARE C-T and C-D.
" IN NORMAL MODE, I CAN WORK WITH
"     ANY META COMBO NOT USED IN ERGO OR EMACS... TRY TO AVOID META-T
"     ANYTHING STARTING WITH SPACE OR BACKSACE
"     WITH MINIMAL FIXES ON THE JUMP LIST, ANYTHING STARTING WITH TAB
"     ANYTHING STARTING WITH C-H or C-K
"     ANYTHING STARTING WITH \
"     
" NOTE: I FORGOT THAT THERE IS AN EXTRA COLON (2ND FINGER RIGHT HAND). THINK
" ABOUT WHETHER THAT AFFECTS MY CHOICE OF ERGO MAPPINGS.

" Try to avoid all common pinky keys in both normal and insert mode.
"
" Offload the space bar: my right thumb gets tired. Using backspace and alt
" could help.
"
" Make it easy to get to : and / (this is part of offloading the pinkies)
"
" Make it easy to get to the vim command window
"
" Write notes on fuzzyfinder
noremap <Space> <Nop>

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

" Make Space-w work like C-w
map <Space>w <c-w>

" Extension maps --------------------------------------------------------------

" fuzzyfinder: 
noremap <Space>b :FufBuffer<CR>
noremap <Space>f :FufFile<CR>
noremap <Space>d :FufDir<CR>

" fuzzyfinder with auto-splitting:
noremap <Space>hb :sp<CR>:FufBuffer<CR>
noremap <Space>vb :vs<CR>:FufBuffer<CR>
noremap <Space>hf :sp<CR>:FufFile<CR>
noremap <Space>vf :vs<CR>:FufFile<CR>

" ctags shortcuts for opening windows
noremap <Space>vta :vs<Cr>:ta
noremap <Space>vtj :vs<Cr>:tj
noremap <Space>hta :sp<Cr>:ta
noremap <Space>htj :sp<Cr>:tj


" Nerdtree
noremap <Space>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" General purpose insert mode maps --------------------------------------------

" Notes regarding builtin insert mode stuff:
" ------------------------------------------
" Del and BS work fine. The arrow keys work, but I am trying to avoid them.
" C-y inserts the character immediately above the cursor. This can be
" super-useful on occasion.

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

" ****************************
" Stuff that needs to be moved
" ****************************

" Breakpoint. This really belongs in a filetype source file.
noremap <Space>p Oimport pudb; pudb.set_trace()<c-s>
inoremap <c-j>p <CR>import pudb; pudb.set_trace()
