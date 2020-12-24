export LANG=en_US.UTF-8
export EDITOR='vim'

export PATH="/usr/local/sbin:$HOME/dotfiles/bin:$PATH"
export PATH="$PATH:/usr/local/opt/go/libexec/bin:$HOME/go/bin"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="xxf"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  kubectl
  zsh-autosuggestions
  z
  fzf
)
source $ZSH/oh-my-zsh.sh

# exa
alias ls="exa -l --group-directories-first --time-style=long-iso"

# bat
alias cat="bat"

# prettyping
alias ping="prettyping --nolegend"

# htop
alias top="sudo htop"

# du
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# cargo
[ -d $HOME/.cargo ] && export PATH="$PATH:$HOME/.cargo/bin"

if uname -a | grep 'microsoft' >/dev/null; then
  export WSL_HOST=$(cat /etc/resolv.conf | grep nameserver | cut -d ' ' -f 2)
  export HTTP_PROXY=${WSL_HOST}:7890
  export HTTPS_PROXY=${WSL_HOST}:7890
  export ALL_PROXY=${WSL_HOST}:7890
  export http_proxy=${WSL_HOST}:7890
  export https_proxy=${WSL_HOST}:7890
  export all_proxy=${WSL_HOST}:7890
fi
