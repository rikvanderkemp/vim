init:
	@echo " _  _  ____  __  __" 
	@echo "( \/ )(_  _)(  \/  )"
	@echo " \  /  _)(_  )    (" 
	@echo "  \/  (____)(_/\/\_)"
	@echo ""
	@echo "...Fetching Vundle"
	@git submodule init
	@echo "...Relinking .vimrc"
	@ln -sf `pwd`/vimrc ~/.vimrc
	@echo "...Installing plugins"
	@vim +PluginInstall +qall
	@echo "\nDone!"
