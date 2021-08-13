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

# ### Added by Zinit's installer
# if [[ ! -f /home/js/.zinit/bin/zinit.zsh ]]; then
#   print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
#   command mkdir -p "/home/js/.zinit" && command chmod g-rwX "/home/js/.zinit"
#   command git clone https://github.com/zdharma/zinit "/home/js/.zinit/bin" && \
#     print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#     print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi

source "/home/js/.zinit/bin/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

# # Load a few important annexes, without Turbo
# # (this is currently required for annexes)
# zinit light-mode for \
#   zinit-zsh/z-a-patch-dl \
#   zinit-zsh/z-a-as-monitor \
#   zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# zinit stuff
zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# | highlighting | #
zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma/fast-syntax-highlighting

setopt autocd # cd without typing cd
setopt rm_star_silent # dont ask to confirm rm

# autojump
# source /etc/profile.d/autojump.sh


# | exports | #
# export TERM='xterm-256color'
export PATH=/usr/local/bin:/home/js/.local/bin:/opt/cuda/bin:/home/js/.cargo/bin:/usr/bin:/home/js/.cargo/bin
export EDITOR='nvim'
# export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH
export JUPYTERHUB_SINGLEUSER_APP='jupyter_server.serverapp.ServerApp'
export PYTHONPATH=/usr/bin/python3
export PIPEWIRE_LATENCY=256/48000
export CMDSTAN='/home/js/.cmdstan/cmdstan-2.27.0'
# export LS_COLORS="$(vivid generate one-dark)"
source "/home/js/.config/zsh/load_lscolors.zsh"
export STARSHIP_CONFIG="/home/js/.config/starship.toml"


# for fzf: use `fd` instead of `find`
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git . ~'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# fasd
source "/home/js/.config/zsh/load_fasd.zsh"

# completion when typing middle of word
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# shift tab to go through completion menu backwards
bindkey '^[[Z' reverse-menu-complete

# no timeout when entering normal mode
KEYTIMEOUT=0

# export RUSTC_WRAPPER=sccache


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
alias gcmsg='git commit -S -m'
alias gfp='git fetch --all && git reset --hard origin/master'
alias yr="cal -y"
alias extip='curl ipinfo.io/city; curl ipinfo.io/country; curl ipinfo.io/ip'
alias pid='while read c1 c2 c3; do echo $c2; done'
alias mpv='mpv --sub-scale=0.4'
alias feh='feh --conversion-timeout 1 --scale-down --auto-zoom'
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
alias xev="xev | awk -F'\''[ )]+'\'' '\''/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'\''"
alias pid='while read c1 c2 c3; do echo $c2; done'
alias sortmirrors='reflector --sort rate --protocol http,https -n 5 --latest 20 --verbose --country Canada,"United States"'
alias texwatch='latexmk -pdf -pvc -shell-escape'
alias carta='/home/js/builds/CARTA.AppImage'
alias clss='rm -f /home/js/screenshots/*'
alias brightness='xrandr --output DP-0 --gamma 0.875 --brightness'
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"
alias rsnative='RUSTFLAGS="-C target-cpu=native"'
alias kbcon="xmodmap /home/js/.Xmodmap && xset r rate 175 35"
alias xc='xclip -se c'
alias xrg='xargs -d "\n"'
alias rg='rg --hidden --no-ignore-vcs --follow --glob '!.git''
alias gc='gh repo clone'
alias hf='hyperfine'

# vulkan sdk
source "/home/js/builds/vulkansdk/1.2.162.1/setup-env.sh"

# completions
source "/home/js/.config/gh/completions.zsh"
source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"


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

source <(/usr/local/bin/starship init zsh --print-full-init)

# zprof
