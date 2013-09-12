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

interface $PDB_ID.asa $CHAIN_A.asa $CHAIN_B.asa

resprop asa

if [ "$2" != "-w" ];then
    rm *.hb
    rm *.log
    rm *.asa
    rm *.rsa
    rm  $CHAIN_A_FILE
    rm  $CHAIN_B_FILE
fi



