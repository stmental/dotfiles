# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:/usr/sbin:$HOME/bin

export PATH
unset USERNAME

function d8
{
   db=devdb_david.foster
   echo "Changing MU_DATABASE to $db"
   export MU_DATABASE=$db
   echo "MU_DATABASE: $MU_DATABASE"
}

function d12
{
   db=devdb12_david.foster
   echo "Changing MU_DATABASE to $db"
   export MU_DATABASE=$db
   echo "MU_DATABASE: $MU_DATABASE"
}
