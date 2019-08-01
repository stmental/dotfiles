#!/bin/csh

# "here" document
# Alternate way to redirect input to a command
# use << followed by a user-defined word (terminator)
# All text is then input until the terminator is reached
cat << END
This script contains lots of examples of C shell programming,
but it doesn't really do anything useful except show examples
of how things are used.

END

echo "Commands can be grouped on a single line, separated by semicolons like: ls; pwd; df"

# Variables - can only be strings or sets of strings
# Are case sensitive and may contain up to 20 characters [0-9][a-zA-Z][_]
# Use the set command to assign local variables, EX set dog = oakey
# Use the setenv command to assign global variables, EX setenv dog = oakey
# The dollar sign precedes variables to extract the value of the variable
# $? prepended to a variable tells if a variable is set or not (0 = false)
# Curly braces insulate a variable from any characters that immediately follow it, EX echo ${var}work
# If a string assigned to a var contains more than one word, use double quotes
# A var can be assigned the output of a command by placing the command in back quotes (command substitution)
# Command substitution stores output as an array (wordlist), not a string (for output with multiple words)
set tfile1 = tfile1_`date +%m%d%y_%H_%M_%S`.tmp
set tfile2 = tfile2_`date +%m%d%y_%H_%M_%S`.tmp

# Arrays - a list of words, separated by spaces or tabs, enclosed in parentheses
# Are assigned similarly to variables, using the "set name =" method
# Subscripts start at 1, use brackets with subscripts after the array name to access elements
# $# preceding the array name indicates the number of elements in the array
# The "shift" command will shift off the leftmost element and reduce the array by 1
# With no argument, the shift command shifts from the built-in argv array
set days = (Mon Tue Wed Thur Fri Sat Sun)
echo There are $#days days in the week
echo I can not wait for $days[5]

# User Input - Use $< to accept a line of input (up to newline) from user
# The input from $< is stored as a string, break into a wordlist with ()
echo What is your name \(first and last\) \?
set name =  $<
set name = ( $name )
echo Your name is $name[1] $name[2]

# Command Line Arguments
# The script name is assigned to $0, any words following are assigned to $1, $2, $3...${10}, ${11},...
# Additionally you can also use the built-in argv array (does not include script name)
# $* is the same as $argv[*] are represents all arguments

# Conditional constructs - if, if/else, if/else if/else, switch
# Comparison operators: ==, !=, >, >=, <, <=, =~, !~, !, ||, &&
# if the if expression is followed by a single command, the then and endif keywords are not necessary
# The switch command is an alternative to if-then-else, useful when you have multiple options
# The value in the switch expression is matched against the expressions (labels) follow the case keyword
# Use the breaksw command at end of each case to transfer execution to endsw
# if ( $#argv != 1 ) then
#   echo Need an argument
# endif
# if ( $answer =~ [Yy]* ) then
#   echo Yes
# else
#   echo No
# endif
# if ( $x > 5 ) then
#   echo Greater than 5
# else if ( $x < 5 ) then
#   echo Less than 5
# else
#   echo Equals 5
# switch ($color)
# case blue:
#   echo Blue
#   breaksw
# case red:
#   echo Red
#   breaksw
# default:
#   echo Illegal color
# endsw

# Loops
# The break command is used to break out of a loop and start execution after the end statement
# If there are nested loops, it only breaks out of the innermost loop.
# Use the continue command to start execution at the top of the innermost loop
# foreach variable (wordlist)
#   commands
# end
# while (expression)            <-- Continue loop while expression evaluates to true (nonzero)
#   commands
# end
# while ($#argv)
#   echo $argv; shift
# end

# goto - Allows you to jump to some label in the program
# labels are any words that start a line and end with a colon
# hereting - C shell has built-in options for testing file properties
# To use, include test flag before filename, EX if ( -e file ) echo file exists
# Test Flag   True if
# -r          Current user can read the file
# -w          Current user can write the file
# -x          Current user can execute the file
# -e          File exists
# -o          Current user owns the file
# -z          File is zero length (empty)
# -d          File is a directory
# -f          File is a plain file


# Pathname variable modifiers
# If a variable contains a pathname, it's possible to manipulate the pathname variable
# by appending special C shell extensions to it.  The pathname is divided into four
# parts- head, tail, root and extension
# set pn = /home/dfoster/bin/vcs_run_regress.pl
# Modifier Meaning   Example     Result
# :r       root      echo $pn:r  /home/dfoster/bin/vcs_run_regress
# :h       head      echo $pn:h  /home/dfoster/bin
# :t       tail      echo $pn:t  vcs_run_regress.pl
# :e       extension echo $pn:e  pl

# Metacharacters are used to expand filenames
# * = zero or more characters in a file
# ? = one character in a file
# [] = one character from a range of characters
# {} = character or string from a set of characters and/or strings
# Metacharaters can be turned off by setting noglob (set noglob)
# Full C shell metacharacter list: * ? [ ] $ ~ ! ^ & { } ( ) > < / ; : %
# Metacharacters can be escaped with a backslash (\) or quotes
# Use the backslash to continue lines (escape the newline)
# EX echo "I can't give $name" ' $5.00\!'
# EX echo She cried, \"Oh help me\!' "', $name

# File redirection
# < Redirect input from file to command
# > Redirect output from command to file
# >& Redirect output and errors to file
# >> Append output to existing file
# >>& Append output and errors to file
# The special C shell built-in variable "noclobber", when set
# protects you from clobbering files with redirection

# use || and && to do conditional execution
# &&: cmd on right only executes if the command on the left has a zero exit status
# ||: cmd on right only executes if the command on the left has a non-zero exit status (failed)
grep $USER /etc/passwd || echo "Did not find $USER in /etc/passwd"


#Exit status (0 - 255) is stored in the $status env variable
#0 means successful exit, non-zero means failure in some way
exit 0


