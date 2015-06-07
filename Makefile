init:
	@echo "Fetching Vundle"
	git submodule init
	@echo "Relinking .vimrc"
	ln -sf `pwd`/vimrc ~/.vimrc
	@echo "Installing plugins"
	vim +PluginInstall +qall
