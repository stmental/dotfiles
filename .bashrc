# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Setup for the gprod environment
#dbgprod

alias ce='echo $MU_DATABASE'
alias sc='ls -altr `echo $MU_SPOOLDIR` | grep $LOGNAME; echo $MU_SPOOLDIR'
alias rm='rm'
alias vr='vim -R'
alias sf='ls -altr | grep foster'
alias clean='rm -f *.42?'
alias cdmydev='cd $MU_ROOT/dev_workspaces/$USER; pwd; ls'
alias vimdiff='vim -d'
alias v10='V10_DEV;export MU_DATABASE=devdb_david.foster;'
alias v102fo='V10.2_FO;export MU_DATABASE=devdb_david.foster;export LOGNAME=munis;'
alias v102fod='V10.2_FO;export MU_DATABASE=devdb_david.foster;export LOGNAME=david.foster;'
alias v10d='V10_DEV;export MU_DATABASE=v100ci_david.foster;export LOGNAME=david.foster;export MU_WSBASEURL=http://fal-devgas1/v10_dev_gws/ws/r/david.foster_gws/;export MU_WSDL=C:/\munis/\DBS/\david.foster/\wsdl'
alias v10p='V10_DEV;export MU_DATABASE=v100ci_peter.hunt;export LOGNAME=munis;export MU_WSBASEURL=http://fal-devgas1/v10_dev_gws/ws/r/david.foster_gws/;export MU_WSDL=C:/\munis/\DBS/\david.foster/\wsdl'
alias v10b='V10_DEV;export MU_DATABASE=v100ci_brian.wagg;export LOGNAME=munis'
alias v10fo='V10.0_FO;export MU_DATABASE=v100ci_david.foster;export LOGNAME=david.foster;export MU_WSBASEURL=http://fal-devgas1/v10_dev_gws/ws/r/david.foster_gws/;export MU_WSDL=C:/\munis/\DBS/\david.foster/\wsdl'
alias v101fo='V10.1_FO;export MU_DATABASE=v100ci_david.foster;export LOGNAME=munis;export MU_WSBASEURL=http://fal-devgas1/v10_dev_gws/ws/r/david.foster_gws/;export MU_WSDL=C:/\munis/\DBS/\david.foster/\wsdl'
alias v10s='V10_DEV;export MU_DATABASE=v10cs_david.foster;export LOGNAME=munis;'
alias v103d='V10.3_FF;export MU_DATABASE=devdb_david.foster;'

# For local installed libraries and programs
LD_LIBRARY_PATH=/home/david.foster/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
PATH=/home/david.foster/local/bin:$PATH
export PATH

#VIMRUNTIME=/home/david.foster/local/share/vim/vim72
VIMRUNTIME=/usr/share/vim/vim74
export VIMRUNTIME
TERM=vt220
export TERM

LS_COLORS='no=00:fi=00:di=01;37:ln=01;36:pi=40;33:so=40;33:bd=40;33:cd=40;33:ex=01;32:*.sh=01;32:*.pl=01;32:*.bin=01;32:*.class=01;3
2:*.php=01;32:*.php3=01;32:*.js=01;32:*.tar=01;31:*.tgz=01;31:*.rpm=01;31:*.deb=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=0
1;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.rar=01;31:*.pkg=01;31:*.jpg=35:*.jpeg=35:*.gif=35:*.png=35:*.bmp=35:*.xbm=35:*.xpm=35:*.pm=35:*.xwd
=35:*.pic=35:*.mp3=35:*.xcf=35:*.rm=35:*.avi=35:*.flac=35:*.ogg=35:*.mpg=35:*.wav=35:*.mpeg=35:*.ps=34:*.pdf=34:*.rtf=34:*.html=34:*.htm=34
:*.xls=34:*.gnumeric=34:*.abw=34:*.tex=34:*.txt=34:*.doc=34:*.c=33:*.h=33:*.java=33:*.cc=33:*.hh=33:'
export LS_COLORS
