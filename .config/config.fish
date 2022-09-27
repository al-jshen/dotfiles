if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g -x fish_greeting 
set -g -x EDITOR nvim
set -g -x JULIA_NUM_THREADS 8
set -g -x HOMEBREW_NO_AUTO_UPDATE 1
set -g -x TERM xterm-256color 

set -g -x FZF_DEFAULT_COMMAND "fd --hidden --follow --no-ignore . ~"
set -g -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

fish_add_path -g /opt/homebrew/opt/curl/bin /opt/homebrew/bin /opt/homebrew/sbin ~/.cargo/bin /opt/homebrew/opt/fzf/bin
set -g -x CPPFLAGS "$CPPFLAGS -I /opt/homebrew/opt/curl/include"
set -g -x LDFLAGS "$LDFLAGS -L /opt/homebrew/opt/curl/lib"

alias vim nvim
alias bat "bat -pp"
alias z "f -e zathura"
alias v "f -e nvim"
alias c "echo -ne '\033c'"
alias cat "bat"
alias j "fasd_cd -d"
alias g "git"
alias gp "git push"
alias gs "git status"
alias ga "git add --all"
alias gd "git diff"
alias gl "git --no-pager log --decorate=short --pretty=oneline -n10"
alias gcam "git commit -S -am"
alias gcm "git commit -S -m"
alias grao "git remote add origin"
alias gfp "git fetch --all && git reset --hard origin/master"
alias extip "curl ipinfo.io/ip"
alias mpv "mpv --sub-scale=0.35"
alias l "exa -alg --git"
alias ... "cd ../.."
alias .... "cd ../../.."
alias md "mkdir"
alias rd "rmdir"
alias texwatch "latexmk -pdf -pvc -shell-escape"
alias rg "rg --hidden --no-ignore-vcs --follow --glob '!.git' -S"
alias gc "gh repo clone"
alias hf "hyperfine"
alias colsum "paste -s -d + - |bc"
alias gca "git commit --amend"
alias rsnative "RUSTFLAGS='-C target-cpu=native'"

source ~/.config/fish/load_fasd.fish

function load_conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
  eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
end

