#! /bin/bash

java=$(echo JAVA_HOME)
if [ ${#java} == 0 ]
then 
text=$(update-alternatives --config java | grep java)
pos=$(expr index  "$text" :)
length=${#text}
let "length=length-pos"
result=${text:$pos:$length}
echo -e "$(cat /etc/environment)\nJAVA_HOME=\"$result\"" > /etc/environment
source /etc/environment

fi
