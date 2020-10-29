##########################
# Directory navigation
##########################
# Type .. for previous directory, ... for the one before, etc.
for i in `seq 1 30`; do al=$(for j in `seq 1 $i`; do printf '.'; done); target=$(for j in `seq 1 $i`; do printf '../'; done) ; alias .$al="cd $target"; done
# Make directory and enter it
function md { mkdir -p $1; cd $1 ;}
# Home is where the heart is
alias home='cd ~'
# Save and recover directory history
function cd { echo "$(cat <(cat ~/.dirhistory 2>/dev/null) <(pwd))" > ~/.dirhistory; builtin cd $1 ;}
function cdh { if [[ -z $1 ]]; then a=10; else a=$1; fi; tail -n $1 ~/.dirhistory ;}
alias cl="cd -"

###########################
# Quick access
###########################
alias aliases='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bashrc="vim ~/.bashrc"
# Horse rhymes with source.
alias horse="source ~/.bashrc"
# Only source the aliases.
alias pony="source ~/.bash_aliases"
alias cralias="vim ${BASH_SOURCE[0]}"
alias craliasd="cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

###########################
# Shortcuts
###########################
# Fave place
function setfave { pwd > ~/.faveplace ; echo "set faveplace to `pwd`"; }
function fave { cd `cat ~/.faveplace` ;}
# Set a shortcut (e.g. shortcut dest ~/destination)
function shortcut { loc=`readlink -f $2`; echo "alias $1=\"cd $loc\"" >> ~/.bash_aliases ; source ~/.bash_aliases; }

##########################
# Sandbox
##########################
# Functions for creating a sandbox environment in home directory.
# Type sand to go to a new sandbox
# Type clearsand to clear all sandboxes
mkdir -p ~/.sandbox
alias sandbox="cd ~/.sandbox"
function sand { a=`mktemp -d ~/.sandbox/tmp.XXXXX`; cd $a ;}
function clearsand { a=`rm -r ./sandbox/*` ;}
# Quick jot for notes. Vim without the intro screen.
function jot { a=`mktemp`; vim $a; rm $a ;}

##########################
# Typos
##########################
alias cd..="cd .."
alias grp="grep"
alias gtrp="grep"
alias les="less"

##########################
# Text manipulation
##########################
# To upper case
function up { awk '{print toupper($0)}' ; }
# To lower case
function low { awk '{print tolower($0)}' ; }
# Replace whitespace with tab
function rt { sed -r "s/ +/\t/g" $1 ;}

##########################
# Finding things
##########################
# Find by name
function nfind { find . -name "$1" ;}
# Find containing name
function pfind { find . -name "*$1*" ;}

##########################
# cat variants
##########################
# Cat and report file names for list of regex strings
function dog { for f in $@; do echo $f; cat $f; done;}
# Cat all files in directory
function puss { for file in `ls $1`; do cat $file; done ;}
# Dog all files in directory
function pooch { for file in `ls $1`; do dog $file; done ;}

##########################
# Sorting things
##########################
# Abbreviation of sort -k
alias sk="sort -k"
# Deduplicate without sorting (faster for long lists)
alias unik="awk '{if (a[\$0] == \"\") {print; a[\$0]=1} }'"

##########################
# less variants
#########################
#http://misc.flogisoft.com/bash/tip_colors_and_formatting
# Less - no word wrap
function lesss { less -S $1 ;}
# Less - align columns, no word wrap
function lesc { column -t -n -s $'\t' $1 | less -S ;}
# Lesc omitting "NA"
function lescn { grep -v "NA" $1 | lesc ;}
# Lesss with colours
function lesssr { less -SR $1 ;}

##########################
# Web functions
##########################
# Get all files in web directory.
function superget { wget -r -nH -nd -np $1 -N *index* ;}

##########################
# Processes
##########################
# Watch files being changed in directory. Unsorted and sorted.
alias vl="watch -n 0.1 ls -l"
alias vk="watch -n 0.1 ls -lt"
# Watch files being changed in directory - regex filtered. Unsorted and sorted.
function vll { watch -n 0.1 "ls -l | grep -P \"$1\"" ;}
function vkk { watch -n 0.1 "ls -lt | grep -P \"$1\"" ;}
# Watch all files being sorted in directory and subdirectories. Sorted.
alias fk="watch -n 0.1 'find . -printf \"%T@ %Tc %s %p \\n\" | sort -nr | column -t'"
# Live file count for files in directory
alias ck="watch -n 0.1 \"ls -f | wc -l \""
# Careful! kill all processes issued by current user matching a regex string
function superkill { kill $(ps ux | grep -P "$1" | awk '{print $2}' );}

##########################
# ls variants
##########################
# View files matching string
alias lg="ls -l | grep -P "
# Don't show hidden files with ll
alias ll="ls -l"
# View hidden files, too
alias la="ls -la"
# Human-readable
alias lh="ls -lh"

##########################
# grep variants
##########################
# Keep colours in grep when piping to less -R or similar
alias cgrep="\grep --color=always"

##########################
# live word count
##########################
# Watch as lines are being counted
alias wcl="awk 'BEGIN{a=0; printf \"\\r\"a}{a++; printf \"\\r\"a}END{printf \"\\n\"}'"

##########################
# awk variants
##########################
# Awk with tab separator as default
alias auk="awk -F'\t'"

##########################
# calculations
##########################
# Calculate the mean of a column of numbers
alias mean="awk '{s+=\$1}END{print s/NR}' RS=\"\n\""

##########################
# Clear screen
##########################
# Clear the screen
alias cls='printf "\033c"'

##########################
# Python shortcuts
##########################
# Python 2
alias py2='python2'

# Python 3
alias py3='python3'
