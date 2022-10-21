.PHONY: init update remove

init:
vim +PluginInstallvim +PluginInstall	unlink $(HOME)/.bashrc
	ln -s  $(HOME)/.vim/bashrc $(HOME)/.bashrc
	ln -s  $(HOME)/.vim/vimrc  $(HOME)/.vimrc
	ln -s  $(HOME)/.vim/tmux.conf  $(HOME)/.tmux.conf

