############################################################################
# My aliases
alias gi='gvim --remote-silent'
alias de='cd devel'
alias da='cd data'
alias quickcython='python setup.py build_ext --inplace'
#### alias wrapping issues to make tab completion work ####

# Wraps a completion function
# make-completion-wrapper <actual completion function> <name of new func.>
#                         <command name> <list supplied arguments>
# eg.
#   alias agi='apt-get install'
#   make-completion-wrapper _apt_get _apt_get_install apt-get install
# defines a function called _apt_get_install (that's $2) that will complete
# the 'agi' alias. (complete -F _apt_get_install agi)
#

function make-completion-wrapper () {
    local function_name="$2"
    local arg_count=$(($#-3))
    local comp_function_name="$1"
    shift 2
    local function="
function $function_name {
    ((COMP_CWORD+=$arg_count))
    COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
    "$comp_function_name"
    return 0
}"
    eval "$function"
}

# make a wrapper for my gi to have tab completion
# using the completion function "_git"
# make a wrapper for my gi to have tab completion
#  how do I know what the name of the completion function is?
#  do this:        `complete -p            |        vim`
#           (list all completion functions)  (which ones involve vim?)
#  and you find that the completion function used is _filedir_spec
make-completion-wrapper _filedir_xspec _gi_compl gvim --remote-silent

# we tell bash to actually use _git_checkout_mine to complete "gco"
complete -o bashdefault -o default -o nospace -F _gi_compl gi

############################################################################
# Static copy of git utilities, in case it's not on the system
. $HOME/.bash_git_completion

# Only load system bash_completion if it hasn't been read yet (it defines some
# read-only variables and will error out if you read it twice).
if [[ -z $BASH_COMPLETION && -e /etc/bash_completion ]]; then
    source /etc/bash_completion
fi

# My usual login name on most machines.  This file is set to display any login
# that is NOT this one in red (root, when I log into machines with an atypical
# login, etc.).
export MYLOGIN="st"

############################################################################
#
# Load basic bash utilities (handy functions and constants)
#
. $HOME/.bash_utils




##############################################################################
#
# Interactive login shell configuration, make sure it doesn't happen under
# non-interactive shells (like those created by ssh for single commands)
case "$-" in
   *i*)

        # Interactive prompt
        if [[ "$WHOAMI" == "$MYLOGIN" ]]; then
            USERNAME=""
        else
            USERNAME="$WHOAMI@"
        fi

        # Declare the main prompt
        if [[ "$TERM" == "dumb" ]]; then  # no colors
            PS1="${USERNAME}\h[\W]> "
        else
            PS1="$GREEN\$(__git_ps1 '(%s)')$L_BLUE${USERNAME}\h[$GRAY\w${L_BLUE}]$GRAY \n> $NO_COLOR"
            # above, you can replace \w (full pwd path) with \W (current wd without the full path) to save space.
            #PS1="$L_RED${USERNAME}$L_BLUE\h[$L_CYAN\W${L_BLUE}]$L_GREEN> $NO_COLOR"
        fi
	
	# Various options for interactive behavior
    shopt -s cdspell
	shopt -s cmdhist
	shopt -s dotglob
	shopt -s extglob
	
        # bind a few keys to search patterns
	bind '"\e[A"':history-search-backward
	bind '"\e[B"':history-search-forward
	bind "C-p":history-search-backward
	bind "C-n":history-search-forward
esac

#######################################################
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

##################################################################
# make less more friendly for non-text input files, see lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#**********************  END OF FILE <.bashrc> *******************************
