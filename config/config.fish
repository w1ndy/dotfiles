if grep -q Microsoft /proc/version
  export WSL_HOST=(cat /etc/resolv.conf | grep nameserver | cut -d ' ' -f 2)
  export HTTP_PROXY="http://$WSL_HOST:7890"
  export HTTPS_PROXY="http://$WSL_HOST:7890"
  export ALLPROXY="socks5://$WSL_HOST:7890"
end

set -g PATH ~/.cargo/bin ~/dotfiles/bin $PATH

alias ls="exa -l --group-directories-first --time-style=long-iso --git"
alias cat='bat'
alias ping="prettyping --nolegend"
alias top="sudo htop"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

starship init fish | source
