#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define color codes for output formatting
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_BLUE="\e[34m"
COLOR_NONE="\e[0m"

# Hugo version to use
HUGO_VER="v0.147.1"

# Function to display colored messages
print_message() {
    local color=$1
    local message=$2
    printf "${color}%s${COLOR_NONE}\n" "$message"
}

# Function to display info messages
info() {
    print_message "${COLOR_BLUE}INFO${COLOR_NONE} " "$1"
}

# Function to display success messages
success() {
    print_message "${COLOR_GREEN}SUCCESS${COLOR_NONE} " "$1"
}

# Function to display error messages and exit
error() {
    print_message "${COLOR_RED}ERROR${COLOR_NONE} " "$1"
    exit 1
}

# Display banner
cat << "EOF"
[31m ███████████                                         ████ 
░░███░░░░░███                                       ░░███ 
 ░███    ░███  ██████   ████████  ████████   ██████  ░███ 
 ░██████████  ░░░░░███ ░░███░░███░░███░░███ ███░░███ ░███ 
 ░███░░░░░███  ███████  ░███ ░░░  ░███ ░░░ ░███████  ░███ 
 ░███    ░███ ███░░███  ░███      ░███     ░███░░░   ░███ 
 ███████████ ░░████████ █████     █████    ░░██████  █████
░░░░░░░░░░░   ░░░░░░░░ ░░░░░     ░░░░░      ░░░░░░  ░░░░░ [0m
                                                          
[32m ███████████              ███  ████      █████            
░░███░░░░░███            ░░░  ░░███     ░░███             
 ░███    ░███ █████ ████ ████  ░███   ███████             
 ░██████████ ░░███ ░███ ░░███  ░███  ███░░███             
 ░███░░░░░███ ░███ ░███  ░███  ░███ ░███ ░███             
 ░███    ░███ ░███ ░███  ░███  ░███ ░███ ░███             
 ███████████  ░░████████ █████ █████░░████████            
░░░░░░░░░░░    ░░░░░░░░ ░░░░░ ░░░░░  ░░░░░░░░             [0m
EOF
echo

# 1. Set up environment
info "(1) Set up environment"

# 1.1 Python setup
info "(1.1) Python"
# TODO: Expand this when Python part finishes
if true; then
    success "Successfully set up Python environment"
else
    error "Failed to set up Python environment"
fi

# 2. Apply content enhancement
info "(2) Apply content enhancement"
info "(2.1) AI Briefing"
# TODO: Expand this when Python part finishes
if true; then
    success "Successfully apply AI briefing"
else
    error "Failed to brief some or all text"
fi

# 3. Build the site
info "(3) Build this site"
info "(3.1) Download latest Hugo binary"

HUGO_COMMAND="hugo"
BUILD_CACHE="build_cache"

# Check if Hugo is installed and has the correct version
if command -v hugo > /dev/null && [[ "$(hugo version)" == *"${HUGO_VER}"* ]]; then
    success "Detected compatible Hugo version"
else
    # Create build cache directory if it doesn't exist
    mkdir -p "${BUILD_CACHE}"
    
    # Download and extract Hugo
    HUGO_FILENAME="hugo_${HUGO_VER}_linux-amd64.tar.gz"
    HUGO_URL="https://github.com/gohugoio/hugo/releases/download/${HUGO_VER}/${HUGO_FILENAME}"
    
    info "Downloading Hugo ${HUGO_VER}..."
    if curl -sS "${HUGO_URL}" -o "${BUILD_CACHE}/hugo.tar.gz"; then
        tar -xf "${BUILD_CACHE}/hugo.tar.gz" -C "${BUILD_CACHE}" || error "Failed to extract Hugo binary"
        success "Successfully downloaded Hugo ${HUGO_VER}"
        HUGO_COMMAND="${BUILD_CACHE}/hugo"
    else
        error "Failed to download compatible Hugo binary"
    fi
fi

# Build the site
info "(3.2) Build it!"

# Check if src directory exists
if [ ! -d "src" ]; then
    error "No 'src' directory found"
fi

# Change directory to src and build
cd "src" || error "Failed to change directory to 'src'"
"${HUGO_COMMAND}" --destination ../public || error "Failed to build Hugo site"

info "Build process completed successfully!"
