##########################
# Directory navigation
##########################

function setfave { pwd > ~/.faveplace ; echo "set faveplace to `pwd`"; }
function fave { cd `cat ~/.faveplace` ;}
function cd { pwd >> ~/.dirhistory; tail -n 50 ~/.dirhistory > ~/.dirhistory.tmp; mv ~/.dirhistory.tmp  ~/.dirhistory; builtin cd $1 ;}
function cl { if [[ -z $1 ]]; then a=1; else a=$1; fi; dest=$(tail -n $a ~/.dirhistory | head -n1); cd $dest ;}
function cdh { if [[ -z $1 ]]; then a=10; else a=$1; fi; tail -n $1 ~/.dirhistory ;}
for i in `seq 1 30`; do al=$(for j in `seq 1 $i`; do printf '.'; done); target=$(for j in `seq 1 $i`; do printf '../'; done) ; alias .$al="cd $target"; done
function shortcut { loc=`readlink -f $2`; echo "alias $1=\"cd $loc\"" >> ~/.bash_aliases ; source ~/.bash_aliases; }

alias home='cd ~'
alias aliases='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bashrc="vim ~/.bashrc"

##########################
# Text manipulation
##########################

function up { awk '{print toupper($0)}' ; }
function low { awk '{print tolower($0)}' ; }
function rt { sed -r "s/ +/\t/g" $1 ;}

##########################
# Finding things
##########################

function fn { find . -name "$1" ;}

##########################
# Sorting things
##########################
alias sk="sort -k"

##########################
# less variants
#########################

function lesc { column -t -n -s $'\t' $1 | less -S ;}
function lescn { grep -v "NA" $1 | lesc ;}
function lesss { less -S $1 ;}
function lesssr { less -SR $1 ;}

##########################
# Web functions
##########################

function superget { wget -r -nH -nd -np $1 -N *index* ;}

##########################
# Processes
##########################

alias vl="watch -n 0.1 ls -l"
function superkill { kill $(ps ux | grep "$1" | awk '{print $2}' );}
