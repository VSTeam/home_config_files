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

set tags=$HOME/devtags,$HOME/distags
