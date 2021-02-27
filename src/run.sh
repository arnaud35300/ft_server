#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}Welcome in my container !${NC}\n"

# service start
service nginx start

# start the shell
bash
