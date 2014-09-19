#!/bin/bash
/bin/wget http://www.360kb.com/kb/2_122.html -O /tmp/hosts.txt &> /dev/null
/bin/cat /etc/hosts0 > /etc/hosts2
/bin/sed -n 's/^<span>\([^#]*\)<span>\(.*\)<\/span>\(.*\)<\/span><br \/>$/\1\2\3/gp' /tmp/hosts.txt >> /etc/hosts2
/bin/mv /etc/hosts /etc/hosts1
/bin/mv /etc/hosts2 /etc/hosts
