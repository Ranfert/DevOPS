df --block-size=1 | awk 'NR>2{sum+=$2}END{print sum}'
df -h --output=size --total | awk 'END {print $1}' 
