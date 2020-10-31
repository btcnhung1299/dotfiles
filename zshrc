# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Global paths
export ZSH="$HOME/.oh-my-zsh"
export CONDA="$HOME/miniconda3"
export GCLOUD="$HOME/google-cloud-sdk"

ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable vi key bindings
bindkey -v

plugins=(git)

alias vim_config="vim $HOME/.vimrc"
alias tmux_config="vim $HOME/.tmux.conf"
alias zsh_config="vim $HOME/.zshrc"
alias ohmyzsh="vim $HOME/.oh-my-zsh"


# ----------------------------------------------------
# Miniconda setup
# ----------------------------------------------------
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

# Activate `jasmine` as default environment
conda activate jasmine


# ----------------------------------------------------
# Google cloud sdk
# ----------------------------------------------------
if [ -f '$GCLOUD/path.zsh.inc' ]; then . '$GCLOUD/path.zsh.inc'; fi
if [ -f '$GCLOUD/completion.zsh.inc' ]; then . '$GCLOUD/completion.zsh.inc'; fi
