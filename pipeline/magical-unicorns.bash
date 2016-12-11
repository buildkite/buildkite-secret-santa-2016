#!/bin/bash

# This doesn't actually do any notifying. It actually just prints a brilliant
# unicorn. The real notifying is done via the webhook receiver.

# Color functions
function c_red   { printf "\033[31m"; }
function c_reset { printf "\033[0m";  }

set -euo pipefail

echo "+++ :christmas_tree::unicorn_face::christmas_tree:"

c_red
cat <<"UNICORN"
                       . . . .
                       ,`,`,`,`,
 . . . .               `\`\`\`\;
 `\`\`\`\`,            ~|;!;!;\!
  ~\;\;\;\|\          (--,!!!~`!       .
 (--,\\\===~\         (--,|||~`!     ./
  (--,\\\===~\         `,-,~,=,:. _,//
   (--,\\\==~`\        ~-=~-.---|\;/J,
    (--,\\\((```==.    ~'`~/       a |
      (-,.\\('('(`\\.  ~'=~|     \_.  \
         (,--(,(,(,'\\. ~'=|       \\_;>
           (,-( ,(,(,;\\ ~=/        \
           (,-/ (.(.(,;\\,/          )
            (,--/,;,;,;,\\         ./------.
              (==,-;-'`;'         /_,----`. \
      ,.--_,__.-'                    `--.  ` \
     (='~-_,--/        ,       ,!,___--. \  \_)
    (-/~(     |         \   ,_-         | ) /_|
    (~/((\    )\._,      |-'         _,/ /
     \\))))  /   ./~.    |           \_\;
  ,__/////  /   /    )  /
   '===~'   |  |    (, <.
            / /       \. \
          _/ /          \_\
         /_!/            >_\

UNICORN
c_reset

cat <<MESSAGE
👏 Magical Christmas unicorn webhooks have been sent!

👀 Keep an eye on your email
MESSAGE
