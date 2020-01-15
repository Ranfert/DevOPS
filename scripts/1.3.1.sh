#!/bin/bash
if [ -n "$1" ]
then
val=$1
else
val=0
fi

while [ $val != "EUR" ] && [ $val != "USD" ]
do
echo "choose USD or EUR"
read val
done

if [ "$val" == "USD" ]
then list=$(curl https://finance.tut.by/kurs/ -silent | grep "<p>" | grep "dollar" )
result=${list:15:6}

else list=$(curl https://finance.tut.by/kurs/ -silent | grep "<p>" | grep "euro" )

result=${list:15:6}
fi
echo $result
