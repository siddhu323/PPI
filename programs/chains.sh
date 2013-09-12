#!/bin/bash
exec<$1
value=0
while read line
do
   a=$( grep "^ATOM"  $line.pdb | cut -c 22-22 | uniq | sed ':a;N;$!ba;s/\n/ /g;')
   echo $line $a
done



