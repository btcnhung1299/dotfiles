# Global variables
export MNT_HOME=$HOME/joanna
export SHELL=`(which zsh)`
export GPG_TTY=$(tty)
cd $MNT_HOME

# Shell variables
ZSH=$HOME/.oh-my-zsh
ZPLUG=$HOME/.zplug
VIM=$HOME/.vim
CONDA=$MNT_HOME/miniconda3

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f $HOME/.p10k.zsh ] && source $HOME/.p10k.zsh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Enable vi key bindings
bindkey -v

# Keep 1000 lines of history and save to file
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

# Set up plug-ins via zplug
[ -f $ZPLUG/init.zsh ] && source $ZPLUG/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
if ! zplug check --verbose; then
    zplug install
fi
zplug load

# Set up conda
__conda_setup="$('$CONDA/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA/etc/profile.d/conda.sh" ]; then
        . "$CONDA/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA/bin:$PATH"
    fi
fi
unset __conda_setup

conda activate default-env
if [ $? -eq 1 ]; then
    conda create -n default-env -y && conda activate default-env
    echo "Created and activated `default-env`."
    echo "Installing gawk for zplug ..."
    conda install -y -c anaconda gawk
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# My "remove"
[[ ! -d ~/.trash ]] && mkdir ~/.trash
del() {
    mv "$@" ~/.trash && echo "Successfully delete them"
}
