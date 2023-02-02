# ------------------------------------------------------------------------------
# Git repository branch display
# ------------------------------------------------------------------------------
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	    # We have color support; assume it's compliant with Ecma-48
	    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	    # a case would tend to support setf rather than setaf.)
	    color_prompt=yes
    else
	    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(parse_git_branch)\$\n'
fi

unset color_prompt force_color_prompt

# ------------------------------------------------------------------------------
# Add to global path
# ------------------------------------------------------------------------------

if [ -d "$HOME/Code/bin" ] ; then
    PATH="$PATH:$HOME/Code/bin"
fi

if [ -d "$HOME/Code/.bin" ] ; then
    PATH="$PATH:$HOME/Code/.bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin"
fi

# Laravel Specifics

if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
    PATH="$PATH:$HOME/.config/composer/vendor/bin"
fi

alias sail='bash vendor/bin/sail'
