#!/bin/bash 

PDB_ID=$1
CMPLX_FILE=$PDB_ID".pdb"
CHAIN_A=$PDB_ID"ChainA"
CHAIN_B=$PDB_ID"ChainB"
CHAIN_A_FILE=$CHAIN_A".pdb"
CHAIN_B_FILE=$CHAIN_B".pdb"

if [ ! -f $CHAIN_A_FILE ] || [ ! -f $CHAIN_A_FILE ] ; then
    ExtractFromPDBFiles.pl -m chains -c ALL $CMPLX_FILE > /dev/null
fi


if [ ! -f  $PDB_ID.asa ]; then
    naccess $CMPLX_FILE > /dev/null
fi

if [ ! -f  $CHAIN_A.asa ]; then
    naccess $CHAIN_A_FILE > /dev/null
fi

if [ ! -f  $CHAIN_B.asa ]; then
    naccess $CHAIN_B_FILE > /dev/null
fi

cut -c 57-62 $PDB_ID".asa" > t1.txt
cut -c 57-62 $CHAIN_A".asa" > t2.txt
cut -c 57-62 $CHAIN_B".asa" > t3.txt

A_B=$(awk '{ sum += $1 } END { print sum }' t1.txt )
A=$(awk '{ sum += $1 } END { print sum }' t2.txt )
B=$(awk '{ sum += $1 } END { print sum }' t3.txt )

rm t1.txt
rm t2.txt
rm t3.txt

if [ "$2" != "-w" ];then   
    rm $CHAIN_A_FILE
    rm $CHAIN_B_FILE
    rm *.log
    rm *.asa
    rm *.rsa
fi


echo $(echo $A + $B - $A_B | bc )




















	    














