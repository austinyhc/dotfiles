Installation:

    git clone https://github.com/austinyhc/dotvim.git ~/.vim

Create symlinks:

    unlink ~/.bashrc
    ln -s ~/.vim/bashrc ~/.bashrc
    ln -s ~/.vim/vimrc ~/.vimrc

Upgrading all bundled plugins:

    git submodule foreach git pull origin master
