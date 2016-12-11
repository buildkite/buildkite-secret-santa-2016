#!/bin/bash

# Christmas tree by rodrigo.pulido.gf@gmail.com
#
# https://github.com/rpulid/christmastree

BLACK='\033[0;30m'
GRAY='\033[1;30m'
RED='\033[0;31m'
LRED='\033[1;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
BRWORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LBLUE='\033[1;34m'
PURPLE='\033[0;35m'
LPURPLE='\033[1;35m'
CYAN='\033[0;36m'
LCYAN='\033[1;36m'
LGRAY='\033[0;37m'
WHITE='\033[1;37m'
BOLD=$(tput bold)
COLORS=( $BLACK $GRAY $RED $LRED $GREEN $LGREEN $BRWORANGE $YELLOW
$BLUE $LBLUE $PURPLE $LPURPLE $CYAN $LCYAN $WHITE )

WIDTH=65

func1 () {
  case "$1" in
  BLACK)
    printf "${BLACK}$2"
  ;;
  BRWORANGE)
    printf "${BRWORANGE}$2"
  ;;
  YELLOW)
    printf "${YELLOW}$2"
  ;;
  GREEN)
    printf "${GREEN}$2"
  ;;
  GRAY)
    printf "${GRAY}$2"
  ;;
  RED)
    printf "${RED}$2"
  ;;
  BLUE)
    printf "${BLUE}$2"
  ;;
  WHITE)
    printf "${WHITE}$2"
  ;;
  esac
}
func2 () {
  arr=( "8" "0" "o" "@" "*" "~" "-" "+" "^" "." "," "_" "=" "{" "}" "]" "[" ";" ":" "#" "$" "&" "!" );
  cols=( "YELLOW" "BLUE" "WHITE" "RED" )
  randnum="$[RANDOM % 23]"
  if [ $randnum -gt "4" ];
  then
   func1 "GREEN" "${arr[$randnum]}"
  else
   func1 "${cols["$[RANDOM % ${#cols[@]}]"]}" "${arr[$randnum]}"
  fi
}
xmastree() {
 n=$(($(($(tput lines)*9))/10))
 if [ $(($n*2)) -gt $WIDTH ];
 then
    n=$(($WIDTH/2))
 fi
 i="1"
 while [ $i -lt $n ];
 do
   let k=$i
   widht=$(($WIDTH/2))
   while [ $k -lt $widht ];
   do
     printf "${SPACE}"
     let k=k+1
   done

   if [ $i -eq 1 ];
   then
     func1 "YELLOW" "*"
     func1 "GREEN" " "
   fi

   j="1"
   while [ $j -lt $i ];
   do
     func2
     let j=j+1
   done

   z="1"
   while [ $z -lt $i ];
   do
     func2 cositas
     let z=z+1
   done

   i=$[$i+1]
   echo ""
 done

 t="0"
 while [ $t -lt $(($n/10)) ];
 do
  for b in `seq 1 $((widht - ($(($n/4))+1)))`;
  do
   printf "${SPACE}"
  done
  for c in `seq 1 $(($n/2))`;
  do
   func1 "BRWORANGE" "#"
  done
  echo ""
  let t=t+1
 done

 tput sgr0
}
CENTER=0
SPACE=" "

xmastree
