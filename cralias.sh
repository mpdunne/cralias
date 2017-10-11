##########################
# Directory navigation
##########################
function setfave { pwd > ~/.faveplace ; echo "set faveplace to `pwd`"; }
function fave { cd `cat ~/.faveplace` ;}
function cd { pwd >> ~/.dirhistory; tail -n 50 ~/.dirhistory > ~/.dirhistory.tmp; mv ~/.dirhistory.tmp  ~/.dirhistory; builtin cd $1 ;}
function cl { if [[ -z $1 ]]; then a=1; else a=$1; fi; dest=$(tail -n $a ~/.dirhistory | head -n1); cd $dest ;}
function cz { d=`dirname $1`; cd $d ;}
function cdh { if [[ -z $1 ]]; then a=10; else a=$1; fi; tail -n $1 ~/.dirhistory ;}
for i in `seq 1 30`; do al=$(for j in `seq 1 $i`; do printf '.'; done); target=$(for j in `seq 1 $i`; do printf '../'; done) ; alias .$al="cd $target"; done
function shortcut { loc=`readlink -f $2`; echo "alias $1=\"cd $loc\"" >> ~/.bash_aliases ; source ~/.bash_aliases; }

function md { mkdir -p $1; cd $1 ;}

alias home='cd ~'
alias aliases='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bashrc="vim ~/.bashrc"
alias sourcerc="source ~/.bashrc"
alias pony="source ~/.bash_aliases"

##########################
# Sandbox
##########################
mkdir -p ~/.sandbox
alias sandbox="cd ~/.sandbox"
function sand { a=`mktemp -d ~/.sandbox/tmp.XXXXX`; cd $a ;}
function clearsand { a=`rm -r ./sandbox/*` ;}

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
function up { awk '{print toupper($0)}' ; }
function low { awk '{print tolower($0)}' ; }
function rt { sed -r "s/ +/\t/g" $1 ;}
alias dehash="awk 'NR == 1 ||  \$1 ~ /^[^#]/'"

##########################
# Finding things
##########################
function nfind { find . -name "$1" ;}
function pfind { find . -name "*$1*" ;}

##########################
# cat variants
##########################
function dog { for f in $@; do echo $f; cat $f; done;}
function puss { for file in `ls $1`; do cat $file; done ;}
function pooch { for file in `ls $1`; do dog $file; done ;}


##########################
# Sorting things
##########################
alias sk="sort -k"

##########################
# less variants
#########################
#http://misc.flogisoft.com/bash/tip_colors_and_formatting
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
alias vk="watch -n 0.1 ls -lt"
function vll { watch -n 0.1 "ls -l | grep \"$1\"" ;}
function vkk { watch -n 0.1 "ls -lt | grep \"$1\"" ;}
function superkill { kill $(ps ux | grep "$1" | awk '{print $2}' );}

##########################
# ls variants
##########################
alias lg="ls -l | grep "

##########################
# grep variants
##########################
alias cgrep="\grep --color=always"

##########################
# awk variants
##########################
alias auk="awk -F'\t'"

##########################
# calculations
##########################
alias mean="awk '{s+=\$1}END{print s/NR}' RS=\"\n\""
