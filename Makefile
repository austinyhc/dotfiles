.PHONY: init update remove

init:
	ln -s  $(HOME)/.vim/bashrc $(HOME)/.bashrc
	ln -s  $(HOME)/.vim/vimrc  $(HOME)/.vimrc
	ln -s  $(HOME)/.vim/tmux.conf  $(HOME)/.tmux.conf
	cp $(HOME)/.vim/gitconfig  $(HOME)/.gitconfig

