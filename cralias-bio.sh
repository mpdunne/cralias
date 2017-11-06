##########################
# Sequence viewing
##########################
function flatfa { sed -r "s/(>.*$)/\1£££/g" $1 | tr '\n' ' ' | sed -r "s/ >/\n>/g" | sed -r "s/£££/\n/g" | sed -r "s/ //g" ;}

function flok { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | sed -r "s/###/\n/g" | grep -vP "^$"; }
function flol { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$"; }
function flal { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | sed -r "s/(.*)###(.*)/\2###\1/g" | grep -vP "^$"; }
function flil { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$" | sed -r "s/###/\t/g" ; }

function flols { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$" | lesss;}
function flals { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | sed -r "s/(.*)###(.*)/\2###\1/g" | grep -vP "^$" | lesss;}
function flils { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$" | sed -r "s/###/\t/g" | column -t -n -s $'\t' | lesss; }

alias unflal="sed -r 's:(.*)###(.*):\2\n\1:g'"

function frep { flal $2 | grep -P "$1" | sed -r "s/(.*)###(.*)/\2\n\1/g" ;}
function frepv { flal $2 | grep -Pv "$1" | sed -r "s/(.*)###(.*)/\2\n\1/g" ;}
function fsort { flil $1 | sort -k1,1V | sed -r "s/\t/\n/g" ;}

##########################
# Sequence generation
##########################
function ranseqn { cat /dev/urandom | tr -cd 'acgt' | head -c $1 ; }
function ranseqp { cat /dev/urandom | tr -cd 'ARNDCQEGHILKMFPOSUTWYV' | head -c $1 ; }

##########################
# Sequence alignments
##########################
alias mq="mafft --quiet"

##########################
# Gtf manipulation
##########################
alias tst='sed -r "s/.*transcript_id[ =]\"([^\"]*)\".*/\1/g"'

##########################
# Feature file sorting 
##########################
alias gsort="sort -k1,1V -k4,4n -k5,5n"
alias bsort="sort -k1,1V -k2,2n"
