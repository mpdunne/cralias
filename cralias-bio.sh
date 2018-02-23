##########################
# Sequence generation
##########################
# Basic random sequence generation - nucleotides. Argument is sequence length.
function ranseqn { cat /dev/urandom | tr -cd 'acgt' | head -c $1 ; }
# Basic random sequence generation - amino acids. Argument is sequence length.
function ranseqp { cat /dev/urandom | tr -cd 'ARNDCQEGHILKMFPOSUTWYV' | head -c $1 ; }
# Basic random sequence generation - gene sequence. Argument is gene AA length, incl stop.
function ranseqg { cat /dev/urandom | tr -cd 'ARNDCQEGHILKMFPOSUTWYV' | head -c $1 | sed -r "s/^./M/g" | sed -r "s/.$/*/g" ; }

##########################
# Sequence alignments
##########################
# Run mafft quietly
alias mq="mafft --quiet"

##########################
# Feature file sorting 
##########################
# Sort a gff file
alias gsort="sort -k1,1V -k4,4n -k5,5n"
# Sort a bed file
alias bsort="sort -k1,1V -k2,2n"

##########################
# Gtf manipulation
##########################
# Extract transcript names from GTF file.
alias tst='sed -r "s/.*transcript_id[ =]\"([^\"]*)\".*/\1/g"'

##########################
# Simple Sequence viewing
##########################
# Unwrap a fasta file
function flatfa { sed -r "s/(>.*$)/\1£££/g" $1 | tr '\n' ' ' | sed -r "s/ >/\n>/g" | sed -r "s/£££/\n/g" | sed -r "s/ //g" ;}
# Single-line fasta entries with IDs at end ###forexample
function flal { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | sed -r "s/(.*)###(.*)/\2###\1/g" | grep -vP "^$"; }
# Turn flal file back into fasta file.
alias unflal="sed -r 's:(.*)###(.*):\2\n\1:g'"
# Single-line fasta entries with IDs at beginning before ###
function flol { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$"; }
# Single-line fasta entries with IDs at beginning before tab
function flil { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$" | sed -r "s/###/\t/g" ; }
# Same as above, but lessed.
function flals { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | sed -r "s/(.*)###(.*)/\2###\1/g" | grep -vP "^$" | lesss;}
function flols { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$" | lesss;}
function flils { sed -r "s/^>(.*)$/£££>\1###/g" $1 | tr '\n' ' ' | sed -r "s/£££/\n/g" | sed -r "s/ //g" | grep -vP "^$" | sed -r "s/###/\t/g" | column -t -n -s $'\t' | lesss; }


##########################
# Other fasta tools
##########################
# Grep a fasta file, e.g. frep "query" file

function frep { flal $2 | grep -P "$1" | sed -r "s/(.*)###(.*)/\2\n\1/g" ;}
# Grep -v a fasta file, e.g. frepv "query" file
function frepv { flal $2 | grep -Pv "$1" | sed -r "s/(.*)###(.*)/\2\n\1/g" ;}
# Sort a fasta file by sequence ID.
function fsort { flil $1 | sort -k1,1V | sed -r "s/\t/\n/g" ;}
