
export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/dobbie/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="hyperzsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

#source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
#-----------------------------
# Alias
#-----------------------------
alias pacman="pacman --color auto"
alias ls="ls --color"
alias weather="curl http://wttr.in/napier"
alias clock="tty-clock -c"
alias matrix="cmatrix"
alias starwars="telnet towel.blinkenlights.nl"
alias pipes="pipes"
alias mpdn="ncmpcpp -S visualizer"
#alias syua="pacaur -Syu"
#alias syu="sudo pacman -Syu"
alias merge="xrdb -merge ~/.Xresources"
#alias ssh="ssh -p 6666 dobbie03@69.164.210.120"
alias neo="neofetch"
alias lol= "screenfetch | lolcat -F 0.2  -a -s 10"0
alias neoa="neofetch --ascii"
alias play="ncmpcpp -S visualizer"
alias font="sudo fc-cache -f -v"
alias tui="s-tui"
alias upmirrors="sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose"
alias backup="sh ~/Documents/dotii"
alias scr="./.scr"
alias res="openbox --restart"
alias rec="openbox --reconfigure"
#alias orp="sudo pacman -Rns $(pacman -Qtdq)"
alias tutor="vimtutor"

## PACMAN
alias update='sudo pacman -Syyu'
alias install='sudo pacman -S'
alias search='pacman -Ss'
alias remove='sudo pacman -Rns'
alias clean='sudo pacman -Scc'
alias orphan='sudo pacman -Rs $(pacman -Qtdq)'
alias stayonmypc='sudo pacman -D --asexp'
alias fuckoff='sudo pacman -D --asdep'
alias pacinf='pacman -Si'
alias searchlocal='pacman -Qs'
alias listfiles='pacman -Ql'
alias whoisorphan='pacman -Qdt'
alias upmirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup; sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias paclog='tail -f /var/log/pacman.log'
alias pacul='sudo rm /var/lib/pacman/db.lck'

## YAOURT
alias yorphan='yaourt -Qtd'
alias aurin='yaourt -S'
alias aurse='yaourt -Ss'
alias aurup='yaourt -Syua'
alias aurinen='LC_ALL=C yaourt -S'
alias Y='yaourt --noconfirm'
alias aurinf='yaourt -Si'

#neofetch
echo "[3m$(fortune -sa)\n" # display a random short quote at start
./.al.sh
if [[ $TERM != "xterm-termite" ]] || [[ $TERM != "rxvt-256color" ]]; then export TERM="xterm-256color"; fi

PATH="/home/dobbie/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/dobbie/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dobbie/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dobbie/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dobbie/perl5"; export PERL_MM_OPT;

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

PATH="/home/dobbie/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/dobbie/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dobbie/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dobbie/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dobbie/perl5"; export PERL_MM_OPT

# ls after cd.. no-op in dir with more than 40 items to list
cdls() { cd "$@"; [ ${#$(ls)} -le 40 ] && ls --group-directories-first || :; }

alias cd="cdls"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
export PATH=$HOME/bin:$PATH

instantnews () {
  curl https://newsapi.org/v1/articles -s -G \
    -d sources=$1 \
    -d apiKey=83df5985124c4352ae11447b349270f7u \
    | jq '.articles[] | .title'
}

startmyday () {
  echo "Hello, Matt."
  echo "\nUpdating your ArchLabs system..."
  aurup --noconfirm
  echo "\nThe weather right now:"
  ansiweather
  echo "\nLatest News Headlines from BBC:"
  instantnews --news bbc-news
  echo "\nNews from Google:"
  instantnews --news google-news
  echo "\nSport News from BBC Sport:"
  instantnews --news bbc-sport
}

export IN_API_KEY="83df5985124c4352ae11447b349270f7"