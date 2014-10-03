#!/bin/awk
awk '{gsub(/[a-z]{2}/,"&|",$0);print $0}' word.txt | awk -F\| '{for(i=1;i<=NF;i++)if($i!="" && length($i)==2)w[$i]++;}END{for(j in w)print j "=" w[j]}'
