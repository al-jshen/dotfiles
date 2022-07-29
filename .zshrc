# start tmux on start
# if [ -z $TMUX ]
# then
#     tmux a || tmux
# fi

# Load speed profiling. Uncomment this line and the last line in the file.
# zmodload zsh/zprof

# save zsh history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

source "/home/js/.zinit/bin/zinit.zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#   zdharma-continuum/zinit-annex-{'readurl','bin-gem-node','patch-dl','rust'}

### End of Zinit's installer chunk

# zinit stuff
zinit ice wait blockf lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light chitoku-k/fzf-zsh-completions

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

fpath+=~/.zfunc

# | highlighting | #
zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light z-shell/F-Sy-H

zinit ice wait lucid
zinit light mafredri/zsh-async

setopt autocd # cd without typing cd
setopt rm_star_silent # dont ask to confirm rm

# autojump
# source /etc/profile.d/autojump.sh


# | exports | #
# export TERM='xterm-256color'
export PATH=/usr/local/bin:/home/js/.local/bin:/opt/cuda/bin:/home/js/.cargo/bin:/usr/bin:/home/js/.cargo/bin:/home/js/bin:/home/js/.ghcup/bin
export EDITOR='nvim'
# export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH
export JUPYTERHUB_SINGLEUSER_APP='jupyter_server.serverapp.ServerApp'
export PYTHONPATH=/usr/bin/python3
export PIPEWIRE_LATENCY=128/48000
export CMDSTAN='/home/js/.cmdstan/cmdstan-2.27.0'
# export LS_COLORS="$(vivid generate one-dark)"
source "/home/js/.config/zsh/load_lscolors.zsh"
export STARSHIP_CONFIG="/home/js/.config/starship.toml"
export OPTIX_ROOT_DIR="/opt/optix"
export JULIA_NUM_THREADS=8
export YTUI_MUSIC_DIR='/st/ytui/music/'
export YTUI_CONFIG_DIR='/st/ytui/config/'


# for fzf: use `fd` instead of `find`
export FZF_DEFAULT_COMMAND='fd --hidden --follow --no-ignore . ~'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  fd --hidden --follow --no-ignore . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --no-ignore . "$1"
}

# fasd
source "/home/js/.config/zsh/load_fasd.zsh"

# completion when typing middle of word
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# shift tab to go through completion menu backwards
bindkey '^[[Z' reverse-menu-complete

# ctrl + arrow keys to move forward/backward a word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

# no timeout when entering normal mode
KEYTIMEOUT=0

# export RUSTC_WRAPPER=sccache

# expand aliases with tab
zstyle ':completion:*' completer _expand_alias _complete _ignored


# | aliases | #
alias bat='bat -pp'
alias z='f -e zathura'
alias v='f -e nvim'
alias c='echo -ne "\033c"'
alias cat='bat'
alias j='fasd_cd -d'
alias vim='nvim'
alias g='git'
alias gp='git push'
alias gs="git status"
alias ga='git add --all'
alias gd='git df'
alias gl='git --no-pager log --decorate=short --pretty=oneline -n10'
alias gcam='git commit -S -am'
alias gcm='git commit -S -m'
alias grao='git remote add origin'
alias gfp='git fetch --all && git reset --hard origin/master'
alias yr="cal -y"
alias extip='curl ipinfo.io/ip'
alias pid='while read c1 c2 c3; do echo $c2; done'
alias mpv='mpv --sub-scale=0.35'
alias feh='feh --conversion-timeout 1 --scale-down --auto-zoom'
# alias l='ls -al --color=always'
alias l='exa -alg --git'
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
alias sortmirrors='reflector --sort rate --protocol http,https -n 10 --latest 20 --verbose --country Canada,"United States"'
alias texwatch='latexmk -pdf -pvc -shell-escape'
alias clss='rm -f /home/js/screenshots/*'
alias brightness='xrandr --output DP-0 --gamma 0.875 --brightness'
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"
alias rsnative='RUSTFLAGS="-C target-cpu=native"'
alias kbcon="setxkbmap us && xmodmap /home/js/.Xmodmap && xset r rate 175 35"
alias kbwork="setxkbmap us && xmodmap /home/js/xmodmap.workman && xset r rate 175 35"
alias xc='xclip -se c'
alias xrg='xargs -d "\n"'
alias rg='rg --hidden --no-ignore-vcs --follow --glob '!.git' -S'
alias gc='gh repo clone'
alias hf='hyperfine'
alias ssh='TERM=xterm-256color ssh'
alias docker-nv-cfg='--gpus all --device /dev/nvidia0 --device /dev/nvidia-uvm --device /dev/nvidia-uvm-tools --device /dev/nvidiactl'
alias colsum='paste -s -d + - |bc'
alias nvreset='sudo rmmod nvidia_uvm && sudo modprobe nvidia'
alias carta='carta --host localhost'
alias wz='docker run --rm -it wordz'
alias gca='git commit --amend'
alias puvpn='gp-saml-gui -S --portal vpn.princeton.edu -- --authgroup="US Northeast"'

# vulkan sdk
# source "/home/js/builds/vulkansdk/1.2.162.1/setup-env.sh"

# completions
source "/home/js/.config/gh/completions.zsh"
source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"

# load starship prompt
source <(/usr/local/bin/starship init zsh --print-full-init)

# | prompt | #
# fpath+=('/home/js/.nvm/versions/node/v13.12.0/lib/node_modules/pure-prompt/functions')
# zinit ice wait lucid compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure
# autoload -U promptinit; promptinit
# prompt pure
# prompt_newline='%666v'
# PROMPT=" $PROMPT"


# | custom functions | #

pdfcomp() {
  /usr/bin/gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$2 $1
}

vcomp() {
  ffmpeg -i $1 -vcodec libx264 -crf 28 $2
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

lt() {
  if [ -n "$1" ]
  then
    exa -al --git -T -L $1
  else
    exa -al --git -T
  fi
}

embed() {
  ffmpeg -r 1 -loop 1 -y -i $1 -i $2 -c:a copy -r 1 -vcodec libx264 -shortest -strict -2 $3
}

ch() {
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f /home/js/.config/google-chrome/Default/History /tmp/h

  op=$(sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi) 

  url=$(echo $op | sed 's#.*\(https*://\)#\1#')
  xdg-open $url; zle reset-prompt; zle redisplay
}

calc() {
  python3 -c "print($*)"
}

zle -N ch
bindkey '^h' ch

# Lazy-loading nvm to speed up shell start time

NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | sed 's|.*/||' | sort | uniq`)
NODE_GLOBALS+=("nvm" "node" "jupyter")
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

# cd ~

# zprof


