# Global paths
export ZSH="$HOME/.oh-my-zsh"
export VIM="$HOME/.vim"
export CONDA="$HOME/miniconda3"
export GCLOUD="$HOME/google-cloud-sdk"
export ZPLUG="$HOME/.zplug"

# ----------------------------------------------------
# oh-my-zsh 
# ----------------------------------------------------
if [ ! -d $ZSH ]; then
    printf "oh-my-zsh hasn't been installed. Installing...\n"
    curl -so ohmyzsh_installer.sh \
        "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" 
    bash ohmyzsh_installer.sh
fi

if [ ! -d "$ZSH/custom/themes/powerlevel10k" ]; then
    printf "Powerlevel10k hasn't been installed. Installing...\n"
    git clone -q --depth=1 "https://github.com/romkatv/powerlevel10k.git" \
        ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable vi key bindings
bindkey -v

# Keep 1000 lines of history and save to file
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


alias vim_config="vim ~/.vimrc"
alias tmux_config="vim ~/.tmux.conf"
alias zsh_config="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"


# ----------------------------------------------------
# Vim-plug
# ----------------------------------------------------
if [ ! -f "$VIM/autoload/plug.vim" ]; then
    printf "vim-plug hasn't been installed. Installing...\n"
    curl -sfLo "$VIM/autoload/plug.vim" \
        --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi


# ----------------------------------------------------
# Miniconda setup
# ----------------------------------------------------
if [ ! -d $CONDA ]; then
    printf "conda hasn't been installed. Installing...\n"
    curl -so ./conda_installer.sh \
        "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
    bash ./conda_installer.sh -b -p $CONDA && rm -rf ./conda_installer.sh
fi
    
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
# Google Cloud SDK
# ----------------------------------------------------
if [ -f "$GCLOUD/path.zsh.inc" ]; then . "$GCLOUD/path.zsh.inc"; fi
if [ -f "$GCLOUD/completion.zsh.inc" ]; then . "$GCLOUD/completion.zsh.inc"; fi


# ----------------------------------------------------
# Plugins
# ----------------------------------------------------
if [ ! -d $ZPLUG ]; then
    printf "zplug hasn't been installed. Installing...\n"
    git clone -q "https://github.com/zplug/zplug" $ZPLUG
fi

source "$ZPLUG/init.zsh"

zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
