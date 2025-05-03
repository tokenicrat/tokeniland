#!/bin/bash

COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_BLUE="\e[34m"
COLOR_NONE="\e[0m"
HUGO_VER="v0.147.1"

printf "${COLOR_RED} ███████████                                         ████ \n";
printf "░░███░░░░░███                                       ░░███ \n";
printf " ░███    ░███  ██████   ████████  ████████   ██████  ░███ \n";
printf " ░██████████  ░░░░░███ ░░███░░███░░███░░███ ███░░███ ░███ \n";
printf " ░███░░░░░███  ███████  ░███ ░░░  ░███ ░░░ ░███████  ░███ \n";
printf " ░███    ░███ ███░░███  ░███      ░███     ░███░░░   ░███ \n";
printf " ███████████ ░░████████ █████     █████    ░░██████  █████\n";
printf "░░░░░░░░░░░   ░░░░░░░░ ░░░░░     ░░░░░      ░░░░░░  ░░░░░ ${COLOR_NONE}\n";
printf "                                                          \n";
printf "${COLOR_GREEN} ███████████              ███  ████      █████            \n";
printf "░░███░░░░░███            ░░░  ░░███     ░░███             \n";
printf " ░███    ░███ █████ ████ ████  ░███   ███████             \n";
printf " ░██████████ ░░███ ░███ ░░███  ░███  ███░░███             \n";
printf " ░███░░░░░███ ░███ ░███  ░███  ░███ ░███ ░███             \n";
printf " ░███    ░███ ░███ ░███  ░███  ░███ ░███ ░███             \n";
printf " ███████████  ░░████████ █████ █████░░████████            \n";
printf "░░░░░░░░░░░    ░░░░░░░░ ░░░░░ ░░░░░  ░░░░░░░░             ${COLOR_NONE}\n";
printf "\n"

printf "${COLOR_BLUE}INFO${COLOR_NONE} (1) Set up environment\n"

printf "${COLOR_BLUE}INFO${COLOR_NONE} (1.1) Python\n"
# TODO: Expand this when Python part finishes
true \
    && printf "${COLOR_GREEN}SUCCESS${COLOR_NONE} Successfully set up Python environment\n" \
    || (printf "${COLOR_RED}ERROR${COLOR_NONE} Failed to set up Python environment\n" && exit 1)

printf "${COLOR_BLUE}INFO${COLOR_NONE} (2) Apply content enhancement"
printf "${COLOR_BLUE}INFO${COLOR_NONE} (2.1) AI Briefing\n"
# TODO: Expand this when Python part finishes
true \
    && printf "${COLOR_GREEN}SUCCESS${COLOR_NONE} Successfully apply AI briefing\n" \
    || (printf "${COLOR_RED}ERROR${COLOR_NONE} Failed to brief some or all text\n" && exit 1)

printf "${COLOR_BLUE}INFO${COLOR_NONE} (3) Build this site\n"
printf "${COLOR_BLUE}INFO${COLOR_NONE} (3.1) Download latest Hugo binary\n"

HUGO_COMMAND="hugo"

if [[ "$(hugo version)" == *"${HUGO_VER}"* ]]; then
    printf "${COLOR_GREEN}SUCCESS${COLOR_NONE} Detected compatible Hugo version\n"
else
    mkdir build_cache
    (curl "https://github.com/gohugoio/hugo/releases/download/${HUGO_VER}/hugo_${HUGO_VER}_linux-amd64.tar.gz" -o "build_cache/hugo.tar.gz" \
        && tar -xvf hugo.tar.gz) || \
    (printf "${COLOR_RED}ERROR${COLOR_NONE} Failed to download compatible Hugo binary\n" && exit 1)
    HUGO_COMMAND="build_cache/hugo"
fi

printf "${COLOR_BLUE}INFO${COLOR_NONE} (3.2) Build it!\n"
cd "src" || (printf "${COLOR_RED}ERROR${COLOR_NONE} No \`src\` directory found\n" && exit 1)
"${HUGO_COMMAND}" --destination ../public || (printf "${COLOR_RED}ERROR${COLOR_NONE} No \`src\` directory found\n" && exit 1)

printf "${COLOR_BLUE}INFO${COLOR_NONE} Build process finishes. Maybe successfully\n"
