a=`top -bn1 | grep "Cpu(s)" | sed "s/%Cpu(s): //"`
length=`expr index "$a" "us"`
echo ${a:0:$length-1}
