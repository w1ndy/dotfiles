all: zsh exa bat fzf prettyping ncdu
	@echo "Linking files..."
	@ln -sf ${PWD}/.oh-my-zsh/custom/themes/xxf.zsh-theme ${HOME}/.oh-my-zsh/custom/themes/xxf.zsh-theme
	@ln -sf ${PWD}/.zshrc ${HOME}/.zshrc
	@ln -sf ${PWD}/.gitconfig ${HOME}/.gitconfig

zsh:
	@if ! which zsh >/dev/null 2>&1; then \
		echo "No ZSH installed!" && exit 1; \
	fi
	@ if [ ! -d ${HOME}/.oh-my-zsh ]; then \
		echo "Install oh-my-zsh..."; \
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; \
	fi

rust:
	@if [ ! -d ${HOME}/.cargo ]; then \
		echo "Installing rust..."; \
		curl https://sh.rustup.rs -sSf | sh; \
	fi

exa: rust
	@PATH="${PATH}:${HOME}/.cargo/bin"; \
	if ! which exa > /dev/null 2>&1; then \
		echo "Installing exa..."; \
		cargo install exa; \
	fi

bat: rust
	@PATH="${PATH}:${HOME}/.cargo/bin"; \
	if ! which bat > /dev/null 2>&1; then \
		echo "Installing bat..."; \
		cargo install bat; \
	fi

fzf:
	@if ! which fzf > /dev/null 2>&1; then \
		echo "Installing fzf..."; \
		git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf; \
		${HOME}/.fzf/install --no-update-rc --key-bindings --completion; \
	fi

prettyping:
	@if ! which prettyping > /dev/null 2>&1; then \
		echo "Installing prettyping..."; \
		git clone --depth=1 https://github.com/denilsonsa/prettyping.git usr/local/prettyping; \
		chmod +x usr/local/prettyping/prettyping; \
		ln -sf ${PWD}/usr/local/prettyping/prettyping ${PWD}/bin/prettyping; \
	fi

ncdu:
	@if ! which ncdu > /dev/null 2>&1; then \
		echo "Installing ncdu..."; \
		curl -o /tmp/ncdu.tar.gz -sSL https://dev.yorhel.nl/download/ncdu-linux-i486-1.14.tar.gz; \
		mkdir usr/local/ncdu; \
		tar -xf /tmp/ncdu.tar.gz -C usr/local/ncdu; \
		ln -sf ${PWD}/usr/local/ncdu/ncdu ${PWD}/bin/ncdu; \
	fi

