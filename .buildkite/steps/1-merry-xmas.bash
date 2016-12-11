#!/bin/bash

LINES=$(tput lines)
COLUMNS=$(tput cols)

declare -A snowflakes
declare -A lastflakes

clear

function move_flake() {
  i="$1"

  if [ "${snowflakes[$i]}" = "" ] || [ "${snowflakes[$i]}" = "$LINES" ]; then
    snowflakes[$i]=0
  else
    if [ "${lastflakes[$i]}" != "" ]; then
      printf "\033[%s;%sH \033[1;1H " ${lastflakes[$i]} $i
    fi
  fi

  printf "\033[%s;%sH❄️\033[1;1H" ${snowflakes[$i]} $i

  lastflakes[$i]=${snowflakes[$i]}
  snowflakes[$i]=$((${snowflakes[$i]}+1))
}

echo "+++ :christmas_tree: <3"

j=0

while :
do
  i=$(($RANDOM % $COLUMNS))
  j=$j+1

  move_flake $i

  for x in "${!lastflakes[@]}"
  do
      move_flake "$x"
  done

  sleep 0.1

  if [[ $j -gt 100 ]]; then
    break
  fi
done