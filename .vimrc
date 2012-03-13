" drop vi compatibility
set nocompatible

" basic appearance ------------------------------------------------------

" line numbers
set nu

" color column 80
set colorcolumn=80

" gui window stuff
if has("gui_running")
    winpos 1600 0
    set textwidth=80
    set lines=999
    set columns=180
    " enable use of mouse
    set mouse=a
    set guifont=Monospace\ Regular\ 7.2
    set equalalways
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

" Always show 2 lines around what is being edited for context
set scrolloff=2

" incsearch... hlsearch is default, but setting it doesn't hurt.
set incsearch
set hlsearch

" buffers can be invisible (not seen in an open window in any tab) but open.
set hidden

" tab completion in the ex command line will behave more like in bash
set wildmenu
set wildmode=longest:full

" vimrc source code ----------------------------------------------------------

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
source ~/.vim/vimrc_source_code/python.org.vim

" abbreviations and mappings
source ~/.vim/vimrc_source_code/abbreviations.vim
source ~/.vim/vimrc_source_code/mappings.vim

" plugin-related code ---------------------------------------------------------

" Nerdtree: Toggle nerdtree with F2; ignore *.pyc files
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

