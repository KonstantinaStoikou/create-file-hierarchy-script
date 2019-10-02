#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[0;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
CYAN="\033[0;36m"
RESET="\033[0m" # No Color

echo -e "${BLUE}Directory name:${RESET}   $1"
echo -e "${BLUE}Numbers of files:${RESET} $2"
echo -e "${BLUE}Number of dirs:${RESET}   $3"
echo -e "${BLUE}Levels:${RESET}           $4"
echo

# check if arguments $2, $3 and $4 are non-negative integers
if [ $(($2)) != $2 ] || [ $(($2)) -lt 0 ]
    then
    echo -e ${RED}Invalid number of files${RESET}
    exit
fi
if [ $(($3)) != $3 ] || [ $(($3)) -lt 0 ]
    then
    echo -e ${RED}Invalid number of directories${RESET}
    exit
fi
if [ $(($4)) != $4 ] || [ $(($4)) -lt 0 ]
    then
    echo -e ${RED}Invalid levels${RESET}
    exit
fi

# if dir exists delete it
if [ -d "$1" ]
    then
    rm -rf $1
fi
# create dir
mkdir -p $1

# an array to store paths of created directories
path_array=( $1 )

# create directory hierarchy
echo -e "${GREEN}Directories created:${RESET}"
num_dirs=$(($3))
levels=$(($4))
while [ $num_dirs -gt 0 ]
    do
    dirpath="$1"
    for i in $(seq 1 $levels)
        do
        if [ $num_dirs -gt 0 ]
            then
            # for the length of the dirname
            # find a random number in range 1-8 
            length=$((1 + RANDOM % 8))
            # create random alphanumberic strings with length $length
            var="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c $length)"
            
            # generate random name until there is no directory 
            # with same name in same level 
            while [ -d "$dirpath/$var" ] 
                do
                var="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c $length)"
            done
            dirpath="$dirpath/$var"
            echo $dirpath
            mkdir -p $dirpath
            path_array+=($dirpath)
            ((num_dirs--))
        fi
    done
done

echo

# create files in round-robin hierarchy
echo -e "${GREEN}Files created:${RESET}"
num_files=$(($2))
while [ $num_files -gt 0 ]
    do
    for i in "${path_array[@]}"
        do 
        if [ $num_files -gt 0 ]
            then
            # for the length of the filename
            # find a random number in range 1-8 
            length=$((1 + RANDOM % 8))
            # create random alphanumberic strings with length $length
            var="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c $length)"
            
            # generate random name until there is no file 
            # with same name in same level 
            while [ -e "$i/$var" ] 
                do
                var="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c $length)"
            done
            filepath="$i/$var"
            touch $filepath
            # write in file a random alphanumeric between 1kB-128kB
            length=$((1000 + RANDOM % 128000))
            var="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c $length)"
            echo $var >> $filepath
            echo "$filepath  ($(($length+1)) bytes)"
            ((num_files--))
        fi
    done
done


