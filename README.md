Installation:

    git clone https://github.com/austinyhc/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/bashrc ~/.bashrc
    ln -s ~/.vim/vimrc ~/.vimrc

Upgrading all bundled plugins:

    git submodule foreach git pull origin master
