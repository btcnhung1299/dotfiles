#!/bin/bash

HOME=/home/joanna
MNT_HOME=$HOME/joanna
DOT_DIR=$MNT_HOME/dotfiles

# Set up oh-my-zsh as default zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh..."
    curl -so omzsh_installer.sh \
        "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
    bash omzsh_installer.sh && rm -rf omzsh_installer.sh
fi

# Symbolic link system configuration files
declare -a config_files=("vimrc" "tmux.conf" "zshrc" "p10k.zsh")
for config_name in "${config_files[@]}"
do
	sys_path=$HOME/.${config_name}
	ln_path=$DOT_DIR/${config_name}
	if [ -e $sys_path ]; then
        while true; do
            read -p "$sys_path exists. Replace? (yes/no) " yn
            case $yn in
                yes ) rm $sys_path && ln -s $ln_path $sys_path && echo "Successfully remove existing $sys_path and link $ln_path to $sys_path"; break;;
                no ) break;;
                * ) echo "Please answer 'yes' or 'no'.";;
            esac
        done
	else
		ln -s $ln_path $sys_path && echo "Successfully link $ln_path to $sys_path"
	fi
done

# Set up Powerlevel10k
if [ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "Installing Powerlevel10k..."
    git clone -q --depth=1 "https://github.com/romkatv/powerlevel10k.git" \
        $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

# Set up zplug
if [ ! -d $HOME/.zplug ]; then
    echo "Installing zplug..."
    git clone -q "https://github.com/zplug/zplug" $HOME/.zplug
fi

# Set up vim extensions
if [ ! -d $HOME/.vim/ ]; then
    mkdir $HOME/.vim
    cp -r $DOT_DIR/vim/* $HOME/.vim/
fi

# Set up vim-plug
if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
    curl -sfLo $HOME/.vim/autoload/plug.vim \
        --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

# Set zsh as default shell
zsh_command="[ -n \"ZSH_VERSION\" ] && exec zsh"
grep -F -q "$zsh_command" "${HOME}/.profile" || echo $zsh_command >> ${HOME}/.profile

# Set up conda
# Temporarily change home directory, inactivated when script finished
export HOME=$MNT_HOME
if [ ! -d $HOME/miniconda3 ]; then
    echo "Installing conda..."
    curl -so conda_installer.sh \
        "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
    bash conda_installer.sh -b -p $CONDA && rm -rf conda_installer.sh
fi
