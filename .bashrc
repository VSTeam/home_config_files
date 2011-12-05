############################################################################
# My aliases
gi='gvim --remote-silent'
de='cd devel'
da='cd data'

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
