# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
# Init NVM
if [[ -e /usr/share/nvm/init-nvm.sh ]]; then
  source /usr/share/nvm/init-nvm.sh
fi

# General aliases
alias update="sudo pacman -Syy & sudo pacman -Syu"
alias open=xdg-open
alias battery=acpi

alias logout="i3-msg exit"
alias reboot="sudo reboot"
alias suspend="systemctl suspend"

if command -v tmatrix &> /dev/null
then
  alias matrix="tmatrix -t \"SEE THE FUTURE\""
fi

# Used for Git bare repo .dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
alias config-add="config add $(config ls-files -m)"

# Check applications that are using a specific port
#
function port() {
  lsof -i :$1
}

# Search for a pattern in any file within current directory
#
function search() {
  if [ -z "$2" ]
  then
    grep -rnF --color $1 .
  else
    grep -rnF --color $1 $2
  fi
}

# Get my external current IP address
# Source: http://apple.stackexchange.com/questions/20547/how-do-i-find-my-ip-address-from-the-command-line)
#
function myip() {
  CURRENT_IP=$(curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g')
  echo "Your current public IP address is $CURRENT_IP"
}

# Create and change directory
#
function take() {
  mkdir -pv "$1"
  cd "$1"
}

# extract - archive extractor
# usage: extract <file>
#
function extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#	Add GPG key
#
function gpg-add() {
  gpg --keyserver pool.sks-keyservers.net --recv-keys $1
}

# Drastic command to purge docker images and volumes
#
function docker_purge() {
  docker container rm ($docker container list -aq)
  docker rmi -f $(docker images -q)
  docker system prune --force
}

# Play with Python virtual environment
#
function venv() {
  case "$1" in
    "init") python3 -m venv venv
      source venv/bin/activate
      if [[ ! -f "requirements.txt" ]]; then
          touch requirements.txt
      fi
      ;;
    "use") source venv/bin/activate
      ;;
    "add") pip3 install $2
      pip3 freeze > requirements.txt
      ;;
    "freeze") pip3 freeze > requirements.txt
      ;;
    *) echo "Invalid option $1"
      ;;
  esac
}

# Add SSH key
#
function add_ssh() {
  /usr/bin/ssh-add -K ~/.ssh/id_rsa
}

# Get SHA256 of a text
# Source: http://albertech.blogspot.fr/2015/02/generate-sha-256-hash-from-command-line.html
#
function sha256() {
  echo -n $1 | shasum -a 256
}

