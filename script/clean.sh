#!/bin/bash

FILE_NAME="$(openssl rand -hex 5)"
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_NONE="\e[0m"

if [[ "$(basename \"$PWD\")" != "src" ]]; then
    cd "./src" || (printf "${COLOR_RED}ERROR${COLOR_NONE} \`src\` directory not found\n")
fi

rm -rf ".hugo_build.lock" "../public" && \
  printf "${COLOR_GREEN}SUCCESS${COLOR_NONE} Spring cleaning finishes\n" ||\
  printf "${COLOR_RED}ERROR${COLOR_NONE} Something went wrong\n"
