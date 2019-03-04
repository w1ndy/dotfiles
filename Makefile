all: prettyping
	ln -sf ${PWD}/.oh-my-zsh/custom/themes/xxf.zsh-theme ${HOME}/.oh-my-zsh/custom/themes/xxf.zsh-theme
	ln -sf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -sf ${PWD}/.gitconfig ${HOME}/.gitconfig

prettyping:
	if ! which prettyping > /dev/null 2>&1; then \
		echo "Installing prettyping..."; \
		git clone --depth=1 https://github.com/denilsonsa/prettyping.git usr/local/prettyping; \
		chmod +x usr/local/prettyping/prettyping; \
		ln -s ${PWD}/usr/local/prettyping/prettyping ${PWD}/bin/prettyping; \
	fi

