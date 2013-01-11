# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
#bindkey jj vi-cmd-mode

# fix forward delete key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096 SAVEHIST=4096 HISTFILE=~/.zhistory

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling.
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# flush cache
flushcache () {
 echo `dscacheutil -flushcache`
}

# quick access to edit hosts file
ehosts () {
  sudo vim /etc/hosts
}
# subverison stuff
# from http://blog.crazyfraggle.com/2009/10/subversion-helper-functions-in-zsh.html
svnstatus () {
 templist=`svn status $*`
 echo `echo $templist | grep '^?' | wc -l` unversioned files/directories
 echo $templist | grep -v '^?'
}

svnup () {
 svn log --stop-on-copy -r HEAD:BASE $1
 svn up $1
}

#finds all files ending with certain extensions
svnwhiteliststatus () {
	templist=`svn status $*`
	findfiles='png$\|jpg$\|pdf$\|gif$\|php$\|rb$|\erb$\|html$\|css$\|rhtml$\|js$\|inc$\|swf$\|dwt$\|sql$'
	#echo `echo $findfiles`
	echo $templist | grep $findfiles
}
#export NODE_PATH="/Users/jmiller/.homebrew/bin/node"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/Users/jmiller/.homebrew/bin:/usr/local/mysql/bin:/opt/subversion/bin:/Users/jmiller/Applications/android-sdk-macosx/tools:/Users/jmiller/Applications/android-sdk-macosx/platform-tools:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

	
# source .zlogin.  not being read property by iterm.
# perhaps related to the fact that i can not set user shell preference on 
# system level
source .zlogin
source .zprofile #environment vars that are not in source control
alias tmux="TERM=screen-256color-bce tmux"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
