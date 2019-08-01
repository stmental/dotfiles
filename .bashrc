# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias rm='rm'
alias vr='vim -R'
alias sf='ls -altr | grep foster'
alias clean='rm -f *.42?'
alias vimdiff='vim -d'

# For local installed libraries and programs
#LD_LIBRARY_PATH=/home/david.foster/local/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH
#PATH=/home/david.foster/local/bin:$PATH
#export PATH

#TERM=vt220
#export TERM

LS_COLORS='no=00:fi=00:di=01;37:ln=01;36:pi=40;33:so=40;33:bd=40;33:cd=40;33:ex=01;32:*.sh=01;32:*.pl=01;32:*.bin=01;32:*.class=01;3
2:*.php=01;32:*.php3=01;32:*.js=01;32:*.tar=01;31:*.tgz=01;31:*.rpm=01;31:*.deb=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=0
1;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.rar=01;31:*.pkg=01;31:*.jpg=35:*.jpeg=35:*.gif=35:*.png=35:*.bmp=35:*.xbm=35:*.xpm=35:*.pm=35:*.xwd
=35:*.pic=35:*.mp3=35:*.xcf=35:*.rm=35:*.avi=35:*.flac=35:*.ogg=35:*.mpg=35:*.wav=35:*.mpeg=35:*.ps=34:*.pdf=34:*.rtf=34:*.html=34:*.htm=34
:*.xls=34:*.gnumeric=34:*.abw=34:*.tex=34:*.txt=34:*.doc=34:*.c=33:*.h=33:*.java=33:*.cc=33:*.hh=33:'
export LS_COLORS
