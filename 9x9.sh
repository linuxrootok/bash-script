#!/bin/bash
/bin/awk 'BEGIN{print "\n";for(i=1;i<=9;i++){for(j=1;j<=i;j++){printf "%dx%d=%d\t",i,j,j*i,j,i,j*i;if(i==j)print "\n"}}}'
