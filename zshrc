# ----------------------------------------------------
# Powerlevel10k
# ----------------------------------------------------
# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/btcnhung1299/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# ----------------------------------------------------
# Plugins
# ----------------------------------------------------
plugins=(git)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# ----------------------------------------------------
# Aliases
# ----------------------------------------------------
alias vim_config    = "vim ~/.vimrc"
alias tmux_config   = "vim ~/.tmux.conf"
alias zsh_config    = "vim ~/.zshrc"
alias ohmyzsh       = "vim ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable vi key bindings
bindkey -v


# ----------------------------------------------------
# Conda
# ----------------------------------------------------
__conda_setup="$('/home/btcnhung1299/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/btcnhung1299/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/btcnhung1299/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/btcnhung1299/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Activate `jasmine` as default environment
conda activate jasmine


# ----------------------------------------------------
# Google Cloud SDK
# ----------------------------------------------------
# Update PATH
if [ -f '/home/btcnhung1299/Cinnamon/google-cloud-sdk/path.zsh.inc' ]; then . '/home/btcnhung1299/Cinnamon/google-cloud-sdk/path.zsh.inc'; fi

# Enable shell command completion
if [ -f '/home/btcnhung1299/Cinnamon/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/btcnhung1299/Cinnamon/google-cloud-sdk/completion.zsh.inc'; fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

