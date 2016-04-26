#!/bin/bash

#USAGE: picoragan <root directory>
#EXAMPLE: picorgan ~

DESTINATION_DIR=~/Pictures/picorgan
mkdir -p $DESTINATION_DIR

find $1 -name '*' -exec file {} \; |  awk '{
    if ($3=="image"){
        print substr($1, 0, length($1));
	system("cp --parents "substr($1,0,length($1))" ~/Pictures/picorgan");

       }
}'

