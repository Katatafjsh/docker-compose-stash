#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m' # No Color

printf "${RED}### Downloading latest wordpress version ...${NC}\n"
curl -o wp.tar.gz --progress-bar "https://wordpress.org/latest.tar.gz"

printf "${RED}### Unzipping to ./wordpress${NC}\n"
tar -xzvf wp.tar.gz ./wordpress

printf "${RED}### Cleaning up ...${NC}\n"
rm wp.tar.gz
