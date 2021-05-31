# start tmux on start
# if [ -z $TMUX ]
# then
#     tmux a || tmux
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load speed profiling. Uncomment this line and the last line in the file.
# zmodload zsh/zprof

# .zshrc
setopt autocd # cd without typing cd
setopt rm_star_silent # dont ask to confirm rm

# autojump
# source /etc/profile.d/autojump.sh

# fasd
eval "$(fasd --init auto)"

#source /home/js/programs/termwrap/termwrap.plugin.zsh

#source /home/js/test.zsh

# save zsh history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


# Lazy-loading nvm to speed up shell start time
#
NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")
NODE_GLOBALS+=("jupyter")
load_nvm() {
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    if [ -f "$NVM_DIR/bash_completion" ]; then
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
    fi
}

# Making global keywords trigger the lazy loading
for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${cmd} >/dev/null 2>&1; load_nvm; ${cmd} \$@; }"
done


# | completions | #
zinit ice blockf wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# completion when typing middle of word
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# shift tab to go through completion menu backwards
bindkey '^[[Z' reverse-menu-complete
# control+backspace to delete a word at a time
bindkey '^H' backward-kill-word

# no timeout when entering normal mode
KEYTIMEOUT=0

# | highlighting | #
zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma/fast-syntax-highlighting


# | prompt | #
# fpath+=('/home/js/.nvm/versions/node/v13.12.0/lib/node_modules/pure-prompt/functions')
# zinit ice wait lucid compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure
# autoload -U promptinit; promptinit
# prompt pure
# prompt_newline='%666v'
# PROMPT=" $PROMPT"
zinit ice depth=1; zinit light romkatv/powerlevel10k


# | exports | #
export TERM='xterm-256color'
export PATH=/usr/local/bin:$PATH:~/.local/bin:/opt/cuda/bin:~/.cargo/bin
export EDITOR='nvim'
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH
export JUPYTERHUB_SINGLEUSER_APP='jupyter_server.serverapp.ServerApp'
export PYTHONPATH=/home/js/miniconda3/lib/python3.9/site-packages:/home/js/miniconda3/lib/python3.9:/home/js/miniconda3/lib/python3.9/lib-dynload:/home/js/.local/lib/python3.9/site-packages

# export RUSTC_WRAPPER=sccache


# | aliases | #
alias z='f -e zathura'
alias v='f -e nvim'
alias c='f -e bat'
alias ca='bat -P'
alias j='fasd_cd -d'
alias e='nvim'
alias vim='nvim'
alias g='git'
alias gp='git push'
alias gs="git status"
alias ga='git add --all'
alias gcmsg='git commit -S -m'
alias gfp='git fetch --all && git reset --hard origin/master'
alias grao='git remote add origin'
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias yr="cal -y"
alias extip='curl ipinfo.io/city; curl ipinfo.io/country; curl ipinfo.io/ip'
alias pid='while read c1 c2 c3; do echo $c2; done'
alias mpv='mpv --sub-scale=0.4'
alias feh='feh --conversion-timeout 1'
# alias l='ls -al --color=always'
alias l='exa -al --git'
alias ...='cd ../..'
alias ....='cd ../../..'
alias md='mkdir'
alias rd='rmdir'
alias wific='sudo wpa_supplicant -B -i wlo1 -c /etc/wpa_supplicant/home.conf'
alias rmorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias cleanpkgs='sudo paccache -r -k 1 --min-mtime "30 days ago"'
alias suspend="systemctl suspend"
alias xev='xev | awk -F'\''[ )]+'\'' '\''/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'\'''
alias pid='while read c1 c2 c3; do echo $c2; done'
alias sortmirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup && curl -s "https://www.archlinux.org/mirrorlist/?protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 20 - | sudo tee /etc/pacman.d/mirrorlist'
alias texwatch='latexmk -pdf -pvc -shell-escape'
alias carta='/home/js/builds/CARTA.AppImage'
alias xournalpp='home/js/builds/xournalpp-1.1.0.dev-nightly.20210429-x86_64.AppImage'
alias clss='rm -f /home/js/screenshots/*'
alias brightness='xrandr --output DP-0 --gamma 0.875 --brightness'
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"
alias rsnative='RUSTFLAGS="-C target-cpu=native"'
alias timeshell='echo $SHELL; for i in {0..10}; do time $SHELL -i -c exit; done'
alias kbcon="xmodmap /home/js/.Xmodmap && xset r rate 175 35"
alias xc='xclip -se c'
alias xrg='xargs -d "\n"'
alias zrcl='cp /home/js/.config/zathura/zathurarc.light /home/js/.config/zathura/zathurarc'
alias zrcd='cp /home/js/.config/zathura/zathurarc.dark /home/js/.config/zathura/zathurarc'
alias t='todo.sh'

# | custom functions | #

source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"

gc() {
    arg=$1
    if [ ${arg[1,18]} = "https://github.com" ]; then
        git clone $arg
    else
        git clone https://github.com/$arg.git
    fi
}

pdfcomp() {
    /usr/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$2 $1
}

kl() {
    kill $(ps -aux |grep $1 |pid) > /dev/null 2>&1
}

vcomp() {
    ffmpeg -i $1 -vcodec libx264 -crf 20 $2
}

vconv() {
    ffmpeg -i $1 -codec copy $2
}

vtrim() {
    ffmpeg -i $1 -ss $2 -to $3 -c:v copy -c:a copy $4
}

audex() {
    ffmpeg -i $1 -vn -acodec copy $2
}

gitforkeven() {
    git remote add upstream $1
    git fetch upstream
    git pull upstream master
    git push
}

locnb() {
    jq '.cells[] | select(.cell_type == "code") .source[]' $1 | wc -l
}

pdftex() {
    pdflatex -interaction=nonstopmode $1
    bname=$(basename $1 .tex)
    bname+=".pdf"
    open $bname
}

vpn() {
    sudo openvpn /etc/openvpn/$1.ovpn
}

vcreate() {
    ffmpeg -y -framerate $3 -i $1 -c:v libx264 $2
}

lt() {
    if [ -n "$1" ]
    then
        exa -al --git -T -L $1
    else
        exa -al --git -T
    fi
}

# zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f "/home/js/.ghcup/env" ] && source "/home/js/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/js/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/js/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/js/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/js/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

