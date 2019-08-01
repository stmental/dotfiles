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

#LS_COLORS='no=00:fi=00:di=01;37:ln=01;36:pi=40;33:so=40;33:bd=40;33:cd=40;33:ex=01;32:*.sh=01;32:*.pl=01;32:*.bin=01;32:*.class=01;3
#2:*.php=01;32:*.php3=01;32:*.js=01;32:*.tar=01;31:*.tgz=01;31:*.rpm=01;31:*.deb=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=0
#1;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.rar=01;31:*.pkg=01;31:*.jpg=35:*.jpeg=35:*.gif=35:*.png=35:*.bmp=35:*.xbm=35:*.xpm=35:*.pm=35:*.xwd
#=35:*.pic=35:*.mp3=35:*.xcf=35:*.rm=35:*.avi=35:*.flac=35:*.ogg=35:*.mpg=35:*.wav=35:*.mpeg=35:*.ps=34:*.pdf=34:*.rtf=34:*.html=34:*.htm=34
#:*.xls=34:*.gnumeric=34:*.abw=34:*.tex=34:*.txt=34:*.doc=34:*.c=33:*.h=33:*.java=33:*.cc=33:*.hh=33:'
#export LS_COLORS

# Set some colors
LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
# Set the prompt
PS1='\e[37;1m\u@\e[35m\w\e[0m\$ '
