#!/bin/bash
#master script - reads a file containing PDB ids and computes values of various features using other scripts.Assumes all pdb files are present in the local directory

exec<$1
value=0
while read line
do
    #B, the accessible surface area
    b=$( echo $( asa $line -w ) | tail -n 1)
    
    #Fbu,number of interface atoms and full buried atoms
    s=$( echo $( fbu $line -w ) | tail -n 1 )
    
    #hbonds,number of hbonds formed by interface
    hb=$( echo $( hbonds $line -w ) | tail -n 1 )
    
    #Local density
    ld=$( echo $( LD $line -w ) | tail -n 1 )

    #Hydrophobic Interaction
    hi=$( echo $( HI $line -w) | tail -n 1 )

    #Residue Propensity
    rp=$( echo $( RP $line ) | tail -n 1 ) 
    
    echo $line $b $hb $s $ld $hi $rp
done




