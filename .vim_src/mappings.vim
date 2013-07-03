" first my basic bindings that don't add functionality
source ~/.vim_src/emacs_bindings.vim
source ~/.vim_src/ergo_bindings.vim

" general-purpose maps --------------------------------------------------------

noremap <c-s> :w<CR>
noremap <BS> :noh<CR>

" CopyPaste: some fixes
"     Y works analogously to C and D
"     <c-m> is register prefix... 
"         think of <m-c>y or <m-c>p as 'clipboard yank' and 'clipboard paste'
"         p, P, y, Y, yy, d, D, dd, c, C, and cc all should work.
noremap Y y$
noremap <m-c> "+

" TODO: split these operations up among <Space>, <BS>, and <Tab>.
" The <CR> key shouldn't be used as a trigger key, but it can be as the
" second key.
"
" Using <c-Space>, <c-BS>, and <m-Enter> also might work.
" The reason to split them up is just to offload my right thum. It may be that
" just removing the <Space><Space> command will be enough for that, in which
" case I don't necessarily need to worry about it.
"
" C-h is also free. C-] is free but I wouldn't want to use it for common
" commands. Any meta combination not claimed in emacs_bindings or ergo_bindings
" is free.
"
" For my use, S and R are free. I don't use R (I think there's no reason you
" would want to in a modern terminal) and S does the same thing as cc.

" repeat aGain
noremap <m-g> n.

noremap <Space> <Nop>

" Make Space-w work like C-w
noremap <Space>w <c-w>

" fuzzyfinder: 
noremap <Space>b :FufBuffer<CR>
noremap <Space>f :FufFile<CR>
noremap <Space>d :FufDir<CR>

" fuzzyfinder with auto-splitting
"     Note: this is sort of unnecessary. If you hit C-j or C-k instead
"           of <CR> to select, it will split or vsplit.
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

" M-] v and M-] h chase tags in new windows
noremap <m-]><m-h> :sp<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]>h :sp<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]><m-v> :vs<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]>v :vs<CR>:exec("tag ".expand("<cword>"))<CR>

" fugitiVe shortcuts  (v for version control)
noremap <m-v>g :G
noremap <m-v>c :Gcommit<Space>--amend<CR>
noremap <m-v>s :Gst<CR>
noremap <m-v>d :Gdi<CR>
noremap <m-v>p :Git<Space>push

" #################### BELOW HERE IS OKAY I THINK
" #################### BELOW HERE IS OKAY I THINK
" #################### BELOW HERE IS OKAY I THINK
" #################### BELOW HERE IS OKAY I THINK

" Insert mode -----------------------------------------------------------------

" C-d is claimed by emacs bindings. So, we map C-u to untab
inoremap <c-u> <c-d>

" Completion: via <Tab>
"    j for within-file, l for line, t for tag, o for omni
"        if you need a mnemonic for j, I guess jeneral[sic] works.
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
noremap <Space>p Oimport pudb; pudb.set_trace()<Esc>:w<CR>
inoremap <Tab>p <CR>import pudb; pudb.set_trace()
