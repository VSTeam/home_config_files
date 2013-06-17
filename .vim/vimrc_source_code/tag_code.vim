" Notes:
" For reference, the best websites I found were:
" http://benoithamelin.tumblr.com/post/15101202004/using-vim-exuberant-ctags-easy-source-navigation
" http://vim.wikia.com/wiki/Browsing_programs_with_tags
"
" My setup is to have alias commands 'devtags' and 'distags', which will
" run 'ctags -R --exclude=".git"', specifiying the devtags and distags files
" in my home directory as the tags files (via the -f option) and using the
" .devtagsrc and .distagsrc files in my home directory to specify the paths
" over which to look for tags.
"
" See .bashrc, in the 'aliases' section, for these commands.
"
" I'm intending to include my .distagsrc and .devtagsrc files in my
" home_config version control, but they would vary from computer to computer
" depending on the file layout and such. And, of course, maybe more than two
" of these would be suitable for some workspace setups.
"
" The remaining task is done here: I have to tell vim to look for those two
" tags files. 

set tags=$HOME/devtags,$HOME/distags
