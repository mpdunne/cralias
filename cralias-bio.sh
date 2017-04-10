##########################
# Sequence viewing
##########################

function flatfa { sed -r "s/(>.*$)/\1£££/g" $1 | tr '\n' ' ' | sed -r "s/ >/\n>/g" | sed -r "s/£££/\n/g" | sed -r "s/ //g" ;}

function flok { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | sed -r "s/###/\n/g" | grep -vP "^$"; }
function flol { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | grep -vP "^$"; }
function flal { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | sed -r "s/(.*)###(.*)/\2###\1/g" | grep -vP "^$"; }
function flil { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | grep -vP "^$" | sed -r "s/###/\t/g" ; }

function flols { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | grep -vP "^$" | lesss;}
function flals { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | sed -r "s/(.*)###(.*)/\2###\1/g" | grep -vP "^$" | lesss;}
function flils { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -v "\*[A-Z]" | grep -vP "^$" | sed -r "s/###/\t/g" | column -t -n -s $'\t' | lesss; }

function frep { flal $2 | grep "$1" | sed -r "s/(.*)###(.*)/\2\n\1/g" ;}


##########################
# Gtf manipulation
##########################

alias tst='sed -r "s/.*transcript_id[ =]\"([^\"]*)\".*/\1/g"'

