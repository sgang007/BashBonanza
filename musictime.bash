#!/bin/sh
#USAGE musictime path_to_music_folder

use_playlist()
{
  if [ "$2" = "" ] 
  then
  eval   path='~/Music/'$1"/*"
  else
    path=$2$1"/*"
  fi
for file in $(ls -d $(find $path))
  do
    if [ "$file" != '*.*' ]; then
      cvlc $file
    else
      exit 0
    fi
  done
}

check_time_to_run()
{   
    
    currTime=`date +%k%M`
    if [ $currTime -gt 0 -a $currTime -lt 700 ]; then 
      type="instrumental"
    elif [ $currTime -gt 700 -a $currTime -lt 1200 ]; then
      type="devotional"
    elif [ $currTime -gt 1200 -a $currTime -lt 1600 ]; then
      type="pop"
    elif [ $currTime -gt 1600 ]; then
      type="rock"
    fi
    use_playlist $type $1
}

check_time_to_run $1
