" first my basic bindings that don't add functionality
source ~/.vim_src/emacs_bindings.vim
source ~/.vim_src/ergo_bindings.vim

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

" general-purpose maps --------------------------------------------------------

noremap <c-s> :w<CR>
noremap \ :noh<CR>

" CopyPaste: some fixes
"     Y works analogously to C and D
"     <c-m> is register prefix... 
"         think of <m-c>y or <m-c>p as 'clipboard yank' and 'clipboard paste'
"         p, P, y, Y, yy, d, D, dd, c, C, and cc all should work.
noremap Y y$
noremap <m-c> "+

noremap <Space> <Nop>

" Make Space-w work like C-w
noremap <Space>w <c-w>

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

" shortcut to build tags
noremap <Space>t :Devtags<CR>

" Nerdtree
noremap <Space>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" M-] v and M-] s chase tags in new windows
noremap <m-]><m-h> :sp<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]>h :sp<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]><m-v> :vs<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]>v :vs<CR>:exec("tag ".expand("<cword>"))<CR>

" Git shortcuts
<Space>gg :G
<Space>gc :Gcommit --amend<CR>
<Space>gs :Gst<CR>
<Space>gd :Gdi<CR>
<Space>gp :Git push

" #################### BELOW HERE IS OKAY I THINK
" #################### BELOW HERE IS OKAY I THINK
" #################### BELOW HERE IS OKAY I THINK
" #################### BELOW HERE IS OKAY I THINK

" Insert mode -----------------------------------------------------------------

" Completion: via <Tab>
"    j for within-file, l for line, t for tag, o for omni
"    if you do omni, you get a preview window. c will close it
inoremap <Tab> <Nop>
inoremap <Tab>j <c-n>
inoremap <Tab>l <c-x><c-l>
inoremap <Tab>t <c-x><c-]>
inoremap <Tab>o <c-x><c-o>
inoremap <Tab>c <c-c>:pc<CR>a

" Exiting: C-s saves and exits. kj exits and adds a <CR>
"    kj is very good in the command window.
inoremap <c-s> <c-c>:w<CR>
inoremap kj <Esc><CR>

" Command mode ----------------------------------------------------------------

" Window: <c-f> was mapped for emacs bindings, so I mapped <c-d> to go to the
" command line window. Mnemonic is eDit; thinking of this as an untabbing sort
" of makes sense too.
cnoremap <c-d> <c-f>

" ****************************
" Stuff that needs to be moved
" ****************************

" Breakpoint. This really belongs in a filetype source file.
noremap <Space>p Oimport pudb; pudb.set_trace()<c-s>
inoremap <Tab>p <CR>import pudb; pudb.set_trace()
