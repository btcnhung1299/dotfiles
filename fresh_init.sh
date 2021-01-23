rm -f ~/.vimrc ~/.zshrc ~/.tmux.conf
rm -rf ~/.vim ~/.conda ~/miniconda3 ~/.zplug ~/oh-my-zsh
ln -s ~/dotfiles/vimrc           ~/.vimrc
ln -s ~/dotfiles/zshrc           ~/.zshrc
ln -s ~/dotfiles/tmux.conf       ~/.tmux.conf
tmux kill-server
zsh
echo "exec zsh" >> ~/.bashrc
cp -r ~/dotfiles/vim/*          ~/.vim
