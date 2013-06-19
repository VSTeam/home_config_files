" Notes:
" For reference, the best websites I found were:
" http://benoithamelin.tumblr.com/post/15101202004/using-vim-exuberant-ctags-easy-source-navigation
" http://vim.wikia.com/wiki/Browsing_programs_with_tags
"
" At the moment, I have .bashrc functions called devtags, distags, and
" bigtags, which makes this redundant. Unfortunately, vim's shell doesn't seem
" to read .bashrc, so I put a separate implementation here.

command Devtags !ctags -R --exclude=".git" -L $HOME/.devtagsrc -f $HOME/devtags
command Distags !ctags -R --exclude=".git" -L $HOME/.distagsrc -f $HOME/distags
command Bigtags !ctags /bigdev/bottleneck -R --exclude=".git" --exclude="*.c" i
            \-f $HOME/bigtags
" Shortcut for Devtags only
noremap <Space>t :Devtags<CR>

set tags=$HOME/devtags,$HOME/distags

" M-] v and M-] s chase tags in new windows
noremap <m-]><m-h> :sp<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]>h :sp<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]><m-v> :vs<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <m-]>v :vs<CR>:exec("tag ".expand("<cword>"))<CR>
