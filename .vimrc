" basic behavior
set nocompatible
set nobackup
set history=500
set spelllang=en_us
set nu
set mouse=a
set incsearch
set hlsearch
set hidden
set wildmenu
set wildmode=longest:full
set scrolloff=2

" ################### EVERYTHING BELOW HERE NEEDS REFACTORING

" color column 80
set colorcolumn=80

if has("gui_running")
    winpos 1600 0
    set textwidth=80
    set lines=999
    set columns=180
    " enable use of mouse
    set mouse=a
    set equalalways
    set guioptions-=T
    set winaltkeys=no

    " Solarized needs boldface; other schemes don't.
    "colorscheme evening
    "set guifont=Monospace\ Regular\ 8
    set background=dark
    colorscheme solarized
    set guifont=Monospace\ Bold\ 10
else
    set background=light
    set t_Co=16
    colorscheme solarized
    " make mouse work, and use line highlighting to indicate insert mode
    set mouse=a
    autocmd InsertEnter,InsertLeave * set cul!
    " Note: terminal solarized will only work if your term is set up correctly.
    " To make gnome terminal use solarized colors, enter this in a terminal:
    " gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
    " gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
    " gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
    " gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#00002B2B3636"
    " gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#65657B7B8383"
endif

" Set shell title to filename and path. Restore on exit.
set title
set titleold=""

" basic editing behavior --------------------------------------------------

" These are good python defaults. The only reason they don't mess
" up my makefiles is the python.org source file below. Note that I don't
" do tabstop=4; if there are tabs in a file, they will still appear as 8 
" spaces.
set expandtab
set softtabstop=4
set shiftwidth=4


" Discussion of filetype-dependent settings: 
" Right now I use the python.org file below to do my filetype-dependent
" formatting. This is okay. But if I wind up working in multiple languages, 
" then the way to do this is to have filetype vimrc files.
" 1. In vimrc, do `filetype plugin on`
" 2. Create a direcotory ~/.vim/ftplugin
" 3. For each language you use (c, python, java, etc) you need to look up the
"    language name on google... for python, it is 'python' and for html it is
"    'html', but I'm not sure about things like C++, latex, etc.
" 4. Once you know the appropriate language_name string, place a file
"       language_name.vim
"    in the directory mentioned in (2). Now vim will automatically go there.
"
" see http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
"
" Notes: (a) This is how the pyflakes plugin I got from keith works, but it
"            is a little more complicated because it isn't called python.vim,
"            it's just in a subdirectory called python.
"        (b) I'm not sure if you can use this to specify settings for 
"            makefiles, since they aren't really a language. But the vimrc 
"            code from python.org shows a different way of doing file-dependent
"            formatting all in one vim source file, and in that code they have
"            the check that tab settings are correct for makefiles.
"
" The python.org source below says filetype plugin indent on; the filetype part of
" that means that this should work for me right now if I create such a vimrc file.

" python.org stuff... 
"   for all files:
"     auto indent
"     syntax highlighting
"     utf encoding
"     folding based on indent (may actually be worth switching for comments)
"     it does the impt `filetype plugin indent on` statement.
"   --
"   for c and python files:
"     tabstop is 8 (this is the default, so probably not necessary)
"     expandtab and shiftwidth=4
"        But, if the c file is not new, use noexpandtab and shiftwidth=8.
"     highlight bad whitespace in red (I might have to get rid of this).
"     wrap text at 79 characters for c and python
"     don't autocomment new lines after comments in c or in python
"     set file format to unix (affects newline encoding; \n only not \r\n)
"   --
"   for makefiles, specifically make sure noexpandtab and shiftwidth=8.
" NOTE: this should really be moved to a filetype source
source ~/.vim_src/tag_code.vim
source ~/.vim_src/abbreviations.vim
source ~/.vim_src/mappings.vim
source ~/.vim_src/python.org.vim
