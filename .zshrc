# .zshrc
setopt autocd # cd without typing cd
setopt rm_star_silent # dont ask to confirm rm


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


# | highlighting | #
zinit ice wait lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma/fast-syntax-highlighting


# | prompt | #
fpath+=('/home/js/.nvm/versions/node/v13.12.0/lib/node_modules/pure-prompt/functions')
zinit ice wait lucid compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"


# | exports | #
export PATH=/usr/local/bin:$PATH:~/.local/bin:/opt/cuda/bin:~/.cargo/bin
export EDITOR='nvim'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# | aliases | #
alias gp='git push -u origin master'
alias gs='git status'
alias ga='git add --all'
alias gcmsg='git commit -S -m'
alias gfp='git fetch --all && git reset --hard origin/master'
alias grao='git remote add origin'
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias extip='curl ipinfo.io/city; curl ipinfo.io/country; curl ipinfo.io/ip'
alias pid='while read c1 c2 c3; do echo $c2; done'
alias mpv='mpv --sub-scale=0.4'
alias l='ls -al --color=always'
alias ...='cd ../..'
alias ....='cd ../../..'
alias md='mkdir'
alias rd='rmdir'
alias vim='nvim'
alias v='nvim'
alias wific='sudo wpa_supplicant -B -i wlo1 -c /etc/wpa_supplicant/home.conf'
alias rmorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias suspend='systemctl suspend'
alias xev='xev | awk -F'\''[ )]+'\'' '\''/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'\'''
alias pid='while read c1 c2 c3; do echo $c2; done'
alias sortmirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup && curl -s "https://www.archlinux.org/mirrorlist/?protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 20 - | sudo tee /etc/pacman.d/mirrorlist'
alias texwatch='latexmk -pdf -pvc'
alias carta='/home/js/builds/CARTA-v1.3-remote/carta'
alias clss='rm -f /home/js/screenshots/*'
alias brightness='xrandr --output DP-0 --gamma 0.875 --brightness'
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"

# | custom functions | #

gc() {
    git clone https://github.com/$1.git
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

pdftex() {
    pdflatex -interaction=nonstopmode $1
    bname=$(basename $1 .tex)
    bname+=".pdf"
    open $bname
}

vpn() {
    sudo openvpn /etc/openvpn/$1.ovpn
}

stty -ixon
cd ~
