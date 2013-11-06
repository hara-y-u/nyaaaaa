#!/bin/sh
i=0
n=nyaaaaa
while [ $i -ne 20 ]
do
    i=`expr $i + 1`
    n="${n}a"
    ln -s ./nyaaaaa $n
done
